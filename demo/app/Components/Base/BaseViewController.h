//
//  BaseViewController.h
//  demo
//
//  Created by 张祎 on 2020/6/4
//  Copyright © 2020 objcat. All rights reserved.
//
    

#import <UIKit/UIKit.h>
#import "BaseTitleView.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

/**
 * 自定义titleView
 * 可以方便的控制文字颜色
 */
@property (strong, nonatomic) BaseTitleView *baseTitleView;

@end

NS_ASSUME_NONNULL_END
