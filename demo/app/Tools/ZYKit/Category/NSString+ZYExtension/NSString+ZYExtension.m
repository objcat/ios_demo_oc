//
//  NSString+ZYExtension.m
//  ZYKit
//
//  Created by 张祎 on 2018/9/21.
//  Copyright © 2018年 objcat. All rights reserved.
//

#import "NSString+ZYExtension.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (ZYExtension)

- (NSString *)zy_md5 {
    const char *cstr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cstr, (CC_LONG)strlen(cstr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]];
}

- (NSString *)zy_base64 {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    return [data base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
}

- (NSString *)zy_deBase64 {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:self options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSURL *)zy_url {
    NSURL *url = [NSURL URLWithString:self];
    if (url) return url;
    return [NSURL URLWithString:[self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
}

- (BOOL)zy_isMobile {
    NSString *pattern = @"0?(13|14|15|17|18|19)[0-9]{9}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [predicate evaluateWithObject:self];
    return isMatch;
}

- (BOOL)zy_isEmail {
    NSString *pattern = @"\\w[-\\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\\.)+[A-Za-z]{2,14}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [predicate evaluateWithObject:self];
    return isMatch;
}

- (BOOL)zy_isURL {
    NSString *pattern = @"^((https|http|ftp|rtsp|mms)?:\\/\\/)[^\\s]+";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [predicate evaluateWithObject:self];
    return isMatch;
}

- (BOOL)zy_isPositiveInteger {
    NSString *pattern = @"^[1-9]\\d*$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [predicate evaluateWithObject:self];
    return isMatch;
}

- (BOOL)zy_containNumber {
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:@"[0-9]" options:0 error:nil];
    NSInteger count = [regularExpression numberOfMatchesInString:self options:0 range:NSMakeRange(0, self.length)];
    if (count > 0) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)zy_containUppercase {
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:@"[A-Z]" options:0 error:nil];
    NSInteger count = [regularExpression numberOfMatchesInString:self options:0 range:NSMakeRange(0, self.length)];
    if (count > 0) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)zy_containLowercase {
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:@"[a-z]" options:0 error:nil];
    NSInteger count = [regularExpression numberOfMatchesInString:self options:0 range:NSMakeRange(0, self.length)];
    if (count > 0) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)zy_containSpecialcase {
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:@"((?=[\x21-\x7e]+)[^A-Za-z0-9])" options:0 error:nil];
    NSInteger count = [regularExpression numberOfMatchesInString:self options:0 range:NSMakeRange(0, self.length)];
    if (count > 0) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)zy_containChinese {
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:@"[\u4e00-\u9fa5]" options:0 error:nil];
    NSInteger count = [regularExpression numberOfMatchesInString:self options:0 range:NSMakeRange(0, self.length)];
    if (count > 0) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)zy_lengthInRange:(NSRange)range {
    NSString *pattern = [NSString stringWithFormat:@"%@%lu%@%lu%@", @"^[a-zA-Z0-9]{", range.location, @",", range.length, @"}$"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [predicate evaluateWithObject:self];
    return isMatch;
}


@end
