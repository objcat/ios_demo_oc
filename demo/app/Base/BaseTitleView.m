//
//  BaseTitleView.m
//  demo
//
//  Created by 张祎 on 2020/6/4
//  Copyright © 2020 objcat. All rights reserved.
//
    

#import "BaseTitleView.h"

@interface BaseTitleView ()

@end

@implementation BaseTitleView

/**
 * 使用baseTitleView取代系统原有的titleView使得自定义变的非常容易
 */
+ (BaseTitleView *)defaultBaseTitleView {
    BaseTitleView *baseTitleView = [[NSBundle mainBundle] loadNibNamed:@"BaseTitleView" owner:nil options:nil][0];
    return baseTitleView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (CGSize)intrinsicContentSize {
    return UILayoutFittingCompressedSize;
}

@end
