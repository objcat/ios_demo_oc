//
//  ZYCustomTitleView.m
//  demo
//
//  Created by objcat on 2022/10/27.
//  Copyright © 2022 objcat. All rights reserved.
//

#import "ZYCustomTitleView.h"

@implementation ZYCustomTitleView
+ (instancetype)defaultTitleView {
    return [[NSBundle mainBundle] loadNibNamed:@"ZYCustomTitleView" owner:nil options:nil][0];
}
@end
