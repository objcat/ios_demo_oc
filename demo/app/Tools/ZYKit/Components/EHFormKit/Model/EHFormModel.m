//
//  EHFormlModel.m
//  ExpandHouseProject
//
//  Created by 张祎 on 2018/1/11.
//  Copyright © 2018年 张祎. All rights reserved.
//

#import "EHFormModel.h"

@interface EHFormModel ()
/// 字典容器储存扩展数据
@property (nonatomic, strong) NSMutableDictionary *ext;
@end

@implementation EHFormModel

- (instancetype)init {
    self = [super init];
    if (self) {
        self.ext = [NSMutableDictionary dictionary];
        self.arr = [NSMutableArray array];
        self.submitValue = @"";
    }
    return self;
}

- (NSString *)reuseId {
    if (_reuseId) {
        return _reuseId;
    } else {
        return NSStringFromClass(self.cellClass);
    }
}

+ (EHFormModel *)converEHFormModel:(id)object {
    return (EHFormModel *)object;
}

- (void)eh_attributed:(void (^)(EHFormModel *))attributed {
    attributed(self);
}

- (BOOL)useXib {
    NSString *path = [[NSBundle mainBundle] pathForResource:NSStringFromClass(self.cellClass) ofType:@"nib"];
    if (path) {
        return YES;
    } else {
        return NO;
    }
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name: %@ value: %@ 指针: %@", self.name, self.value, [super description]];
}

@end
