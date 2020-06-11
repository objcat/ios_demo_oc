//
//  BaseViewController.h
//  demo
//
//  Created by 张祎 on 2020/6/4
//  Copyright © 2020 objcat. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "BaseTitleView.h"


@interface BaseViewController : UIViewController

/**
 * 自定义titleView
 */
@property (strong, nonatomic) BaseTitleView *baseTitleView;

/**
 * 设置返回按钮的标题
 */
@property (strong, nonatomic) NSString *backButtonTitle;

@end

