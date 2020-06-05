//
//  UIColor+Extension.h
//  EGShellProject
//
//  Created by 张祎 on 2019/4/17.
//  Copyright © 2019年 objcat. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGBA(r,g,b,a) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a]
#define COLORHEX(x) [UIColor colorWithHexString:x]

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Extension)

/** 主要颜色 */
@property (class, readonly) UIColor *mainColor;

/**
 * 通过16进制字符串创建颜色, 例如: #F173AC 是粉色
 * @param hexString 16进制字符串
 * @return 颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;

/**
 * 判断颜色是否相同
 */
- (BOOL)isEqualToColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
