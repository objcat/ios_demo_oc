//
//  ZYUserDefaults.m
//  ZYKit
//
//  Created by 张祎 on 2020/5/7.
//  Copyright © 2020 objcat. All rights reserved.
//

#import "ZYUserDefaults.h"
#import "objc/runtime.h"

@interface ZYUserDefaults ()
@property (strong, nonatomic) NSUserDefaults *ud;
@property (strong, nonatomic) NSMutableArray *propertyList;
@end

@implementation ZYUserDefaults

/**
 *  单例
 */
+ (instancetype)shareInstance {
    static ZYUserDefaults *info = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        info = [[ZYUserDefaults alloc] init];
        // 设置ud路径
        info.ud = [[NSUserDefaults alloc] initWithSuiteName:@"zy_ud"];
        // 绑定数据
        [info bindData];
        // 监听数据变化
        [info addObserver];
        NSLog(@"ZYUserDefaults启动成功, 保存路径: \n %@/Preferences/zy_ud.plist", [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject]);
    });
    return info;
}

/**
 *  绑定数据 目前仅用于初始化
 */
- (void)bindData {
    for (NSString *propertyName in self.propertyList) {
        id value = [self.ud objectForKey:propertyName];
        if (value == nil) continue;
        [self setValue:value forKey:propertyName];
    }
}

/**
 *  设置监听
 */
- (void)addObserver {
    for (NSString *property in self.propertyList) {
        [self addObserver:self forKeyPath:property options:NSKeyValueObservingOptionNew context:nil];
    }
}

/**
 *  KVO
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    id value = [object valueForKey:keyPath];
    [self.ud setObject:value forKey:keyPath];
}

/**
 *  获取属性列表
 */
- (NSArray *)propertyList {
    if (!_propertyList) {
        _propertyList = [NSMutableArray array];
        unsigned count = 0;
        // 设置屏蔽属性 屏蔽两个不需存储的属性
        NSArray *ignores = @[@"propertyList", @"ud"];
        objc_property_t *properties = class_copyPropertyList(self.class, &count);
        for (NSInteger i = 0; i < count; i++) {
            objc_property_t property = properties[i];
            NSString *propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
            if ([ignores containsObject:propertyName]) {
                continue;
            }
            [_propertyList addObject:propertyName];
        }
        free(properties);
    }
    return _propertyList;
}

/**
 *  打印模型
 */
- (NSString *)description {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    for (NSString *propertyName in self.propertyList) {
        // 设置nil打印值
        id value = [self valueForKey:propertyName] ? : @"我是空的nil";
        [dictionary setObject:value forKey:propertyName];
    }
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictionary options:1 error:nil];
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return [NSString stringWithFormat:@"<%@: %p> \n %@ ", [self class], self, str];
}

- (void)clean {
    // 清理属性
    [self cleanPropertys];
    // 清理ud, 理论上来说上面的方法已经全部清空了, 但是NSNumber类型的仍然会存留在ud不清理也没什么关系 这里还是选择了清理
    [self cleanUserDefaults];
}

- (void)cleanPropertys {
    for (NSString *propertyName in self.propertyList) {
        if ([[self valueForKey:propertyName] isKindOfClass:[NSNumber class]]) {
            //NSNumber bool int float long
            [self setValue:@(0) forKey:propertyName];
        } else {
            [self setValue:nil forKey:propertyName];
        }
    }
}

- (void)cleanUserDefaults {
    NSDictionary *dic = [self.ud dictionaryRepresentation];
    for (id key in dic) {
        [self.ud removeObjectForKey:key];
    }
    [self.ud synchronize];
}

- (void)dealloc {
    // 由于是单例 所以不用担心释放的问题 固不用移除
}

@end
