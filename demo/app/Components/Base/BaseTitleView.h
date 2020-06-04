//
//  BaseTitleView.h
//  demo
//
//  Created by 张祎 on 2020/6/4
//  Copyright © 2020 objcat. All rights reserved.
//
    

#import <UIKit/UIKit.h>
#import "BaseTitleLabel.h"

NS_ASSUME_NONNULL_BEGIN


@interface BaseTitleView : UIView
@property (weak, nonatomic) IBOutlet BaseTitleLabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *rightImage;
@property (copy, nonatomic) void (^textDidSetBlock) (NSString *text);
@end

NS_ASSUME_NONNULL_END
