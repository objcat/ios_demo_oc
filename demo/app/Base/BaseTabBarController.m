//
//  BaseTabBarController.m
//  demo
//
//  Created by 张祎 on 2020/6/4
//  Copyright © 2020 objcat. All rights reserved.
//


#import "BaseTabBarController.h"

#import "BaseNavigationController.h"

#import "MainViewController.h"
#import "AppViewController.h"
#import "NewsViewController.h"
#import "MineViewController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     * 自定义tabBar
     * 这里可以对tabBar无限制进行自定义
     */
    
    // 设置样式
    [self setupStyles];
    // 设置子控制器
    [self setupControllers];
}

- (void)setupStyles {
    // 设置tabBar背景颜色, 这里使用99%透明度的图片作为背景, 既做到了不透明又不影响初始坐标系
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar_color_image"]];
    // 设置选中颜色
    [UITabBar appearance].tintColor = RGBA(6, 181, 141, 1);
    // 设置未选中颜色 注意此方法仅支持iOS10以上 需要兼容以下版本使用 setTitleTextAttributes
    [UITabBar appearance].unselectedItemTintColor = RGBA(73, 73, 73, 1);
}

- (void)setupControllers {
    
    
    NSMutableArray *viewControllers = [NSMutableArray array];
    
    /**
     * 使用 {} 隔离作用域使得命名可以重复
     */
    
    {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *vc = [sb instantiateInitialViewController];
        BaseNavigationController *navi = [[BaseNavigationController alloc] initWithRootViewController:vc];
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[[UIImage imageNamed:@"tabbar_1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_1_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [viewControllers addObject:navi];
    }
    
    {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"App" bundle:nil];
        UIViewController *vc = [sb instantiateInitialViewController];
        BaseNavigationController *navi = [[BaseNavigationController alloc] initWithRootViewController:vc];
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"应用" image:[[UIImage imageNamed:@"tabbar_2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_2_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [viewControllers addObject:navi];
    }
    
    {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"News" bundle:nil];
        UIViewController *vc = [sb instantiateInitialViewController];
        BaseNavigationController *navi = [[BaseNavigationController alloc] initWithRootViewController:vc];
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"新闻" image:[[UIImage imageNamed:@"tabbar_3"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_3_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [viewControllers addObject:navi];
    }
    
    {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Mine" bundle:nil];
        UIViewController *vc = [sb instantiateInitialViewController];
        BaseNavigationController *navi = [[BaseNavigationController alloc] initWithRootViewController:vc];
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[[UIImage imageNamed:@"tabbar_4"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_4_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [viewControllers addObject:navi];
    }
    
    self.viewControllers = viewControllers;
    
}


@end
