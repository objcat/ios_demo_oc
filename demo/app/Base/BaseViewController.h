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
 * 支持动态修改
 * 需要在前一个页面进行修改
 */
@property (strong, nonatomic) NSString *backButtonTitle;

/**
 * 设置返回按钮文字和按钮颜色
 * 支持动态修改
 * 需要在前一个页面进行修改
 */
@property (strong, nonatomic) UIColor *backButtonTintColor;

/**
 * 是否使用tintColor的颜色渲染返回按钮的图片 默认是YES
 */
@property (assign, nonatomic) BOOL backButtonImageTemplete;

/**
 *  禁用单个页面返回手势
 */
@property (assign, nonatomic) BOOL stopInteractivePopGestureRecognizer;

@end

