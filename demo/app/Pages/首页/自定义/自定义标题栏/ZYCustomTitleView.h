//
//  ZYCustomTitleView.h
//  demo
//
//  Created by objcat on 2022/10/27.
//  Copyright © 2022 objcat. All rights reserved.
//

#import "BaseCustomTitleView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZYCustomTitleView : BaseCustomTitleView
+ (instancetype)defaultTitleView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *rightImage;
@end

NS_ASSUME_NONNULL_END
