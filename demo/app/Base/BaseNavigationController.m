//
//  BaseNavigationController.m
//  demo
//
//  Created by 张祎 on 2020/6/4
//  Copyright © 2020 objcat. All rights reserved.
//


#import "BaseNavigationController.h"

@interface BaseNavigationController () <UINavigationBarDelegate, UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationController

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    // 防止根视图控制器调用返回手势造成卡顿数秒的问题
    return self.childViewControllers.count > 1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 返回手势代理
    self.interactivePopGestureRecognizer.delegate = self;
}

/**
 * push页面后自动隐藏tabBar
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count >= 1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


/**
 * 该方法用于拦截返回按钮的返回事件
 * 使用方法: 在控制器里重写 navigationShouldPopOnBackButton 返回NO即为不pop控制器
 */
- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {
    
    // 这里利用了导航栏的特性 判断了是"点击返回按钮"还是执行了"popViewControllerAnimated"方法, 从而使得 popViewControllerAnimated 方法可以顺利的pop控制器
    if([self.viewControllers count] < [navigationBar.items count]) {
        return YES;
    }
    
    // 设置返回默认值
    BOOL shouldPop = YES;
    
    // 判断控制器有没有重写 navigationShouldPopOnBackButton 方法
    UIViewController *vc = [self topViewController];
    if([vc respondsToSelector:@selector(navigationShouldPopOnBackButton)]) {
        shouldPop = [vc navigationShouldPopOnBackButton];
    }
    
    // 如果没有重写方法执行 popViewControllerAnimated pop控制器
    if(shouldPop) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self popViewControllerAnimated:YES];
        });
    }
    
    /**
     * 这个地方以前的第三方工具是返回YES, 但这样会有一个问题, 在iOS11上会出现不返回但改变标题的问题
     * 所以这里修改为默认返回NO
     */
    return NO;
}

@end
