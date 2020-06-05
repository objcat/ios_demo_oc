//
//  BaseTitleView.m
//  demo
//
//  Created by 张祎 on 2020/6/4
//  Copyright © 2020 objcat. All rights reserved.
//
    

#import "BaseTitleView.h"

@interface BaseTitleView () <BaseTitleLabelDelegate>

@end

@implementation BaseTitleView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleLabel.delegate = self;
}

- (void)textDidSet:(NSString *)text {
    self.textDidSetBlock ? self.textDidSetBlock(text) : nil;
}




@end
