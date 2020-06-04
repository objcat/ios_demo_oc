//
//  BaseNavigationController.m
//  demo
//
//  Created by 张祎 on 2020/6/4
//  Copyright © 2020 objcat. All rights reserved.
//
    

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航栏背景颜色, 这里使用99%透明度的图片作为背景, 既做到了不透明又不影响初始坐标系
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navi_bar_image"] forBarMetrics:UIBarMetricsDefault];
}

// push页面后自动隐藏tabBar
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count >= 1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end
