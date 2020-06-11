//
//  ApiMap.m
//  demo
//
//  Created by 张祎 on 2020/6/11
//  Copyright © 2020 objcat. All rights reserved.
//


#import "ApiMap.h"

@interface ApiMap ()
@property (class, readonly, nonatomic) NSString *host;
@end

@implementation ApiMap

+ (NSString *)host {
    /**
     * 这里切换环境只是作为简单的演示, 默认两种环境, 生产和开发
     */
    if (x_store.isDev) {
        // 开发环境
        return @"192.168.1.2";
    } else {
        // 生产环境
        return @"www.objcat.com";
    }
}

+ (NSString *)api_hello {
    return [NSString stringWithFormat:@"%@/hello", self.host];
}

+ (NSString *)api_world {
    return [NSString stringWithFormat:@"%@/world", self.host];
}

@end
