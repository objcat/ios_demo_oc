//
//  ApiMap.h
//  demo
//
//  Created by 张祎 on 2020/6/11
//  Copyright © 2020 objcat. All rights reserved.
//
    

#import <Foundation/Foundation.h>

/**
 * 使用该工具可以非常灵活的管理接口
 * 比如处理切换多种环境上, 要比定义常量好太多了
 */

@interface ApiMap : NSObject
/** hello接口 */
@property (class, readonly, nonatomic) NSString *api_hello;
/** world接口 */
@property (class, readonly, nonatomic) NSString *api_world;
@end
