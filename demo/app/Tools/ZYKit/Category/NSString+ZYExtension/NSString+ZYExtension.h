//
//  NSString+ZYExtension.h
//  ZYKit
//
//  Created by 张祎 on 2018/9/21.
//  Copyright © 2018年 objcat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZYExtension)

/** 字符串md5值 */
@property (readonly) NSString *zy_md5;
/** 字符串base64值 */
@property (readonly) NSString *zy_base64;
/** base64转字符串 */
@property (readonly) NSString *zy_deBase64;
/** 将URL转换为安全URL */
@property (readonly) NSString *zy_url;

/** 是否为手机号 */
@property (readonly) BOOL zy_isMobile;
/** 是否为邮箱 */
@property (readonly) BOOL zy_isEmail;
/** 是否为URL */
@property (readonly) BOOL zy_isURL;
/** 是否为正整数 */
@property (readonly) BOOL zy_isPositiveInteger;
/** 是否包含数字 */
@property (readonly) BOOL zy_containNumber;
/** 是否包含大写字母 */
@property (readonly) BOOL zy_containUppercase;
/** 是否包含小写字母 */
@property (readonly) BOOL zy_containLowercase;
/** 是否包含特殊字符 */
@property (readonly) BOOL zy_containSpecialcase;
/** 是否包含汉字 */
@property (readonly) BOOL zy_containChinese;

/**
 * 是否介于长度之间
 */
- (BOOL)zy_lengthInRange:(NSRange)range;

@end
