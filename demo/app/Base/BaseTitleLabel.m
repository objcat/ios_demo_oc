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
    
    // 文字改变执行代理
    if (self.delegate && [self.delegate respondsToSelector:@selector(textDidSet:)]) {
        [self.delegate textDidSet:text];
    }
    
    [super setText:text];
}

@end
