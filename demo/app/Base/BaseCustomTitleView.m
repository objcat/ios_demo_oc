//
//  BaseCustomTitleView.m
//  demo
//
//  Created by 张祎 on 2020/6/4
//  Copyright © 2020 objcat. All rights reserved.
//
    

#import "BaseCustomTitleView.h"

@interface BaseCustomTitleView ()

@end

@implementation BaseCustomTitleView

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (CGSize)intrinsicContentSize {
    return UILayoutFittingCompressedSize;
}

@end
