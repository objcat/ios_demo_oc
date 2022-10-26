//
//  BaseTitleView.h
//  demo
//
//  Created by 张祎 on 2020/6/4
//  Copyright © 2020 objcat. All rights reserved.
//
    

#import <UIKit/UIKit.h>

@interface BaseTitleView : UIView
+ (BaseTitleView *)defaultBaseTitleView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *rightImage;
@end
