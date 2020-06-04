//
//  BaseTitleLabel.m
//  demo
//
//  Created by 张祎 on 2020/6/4
//  Copyright © 2020 objcat. All rights reserved.
//
    

#import "BaseTitleLabel.h"

@implementation BaseTitleLabel

- (void)setText:(NSString *)text {
    NSString *str = text;
    // 设置文字显示个数
    if (text.length > 10) {
        str = [[text substringToIndex:10] stringByAppendingFormat:@"..."];
    }
    
    // 文字改变执行代理
    if (self.delegate && [self.delegate respondsToSelector:@selector(textDidSet:)]) {
        [self.delegate textDidSet:text];
    }
    
    [super setText:text];
}

@end
