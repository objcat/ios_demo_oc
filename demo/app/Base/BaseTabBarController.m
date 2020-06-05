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
    // 设置未选中标题颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:RGBA(73, 73, 73, 1)} forState:UIControlStateNormal];
    // 设置选中后标题颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:RGBA(6, 181, 141, 1)} forState:UIControlStateSelected];
}

- (void)setupControllers {
    
    
    NSMutableArray *viewControllers = [NSMutableArray array];
    
    /**
     * 使用 {} 隔离作用域使得命名可以重复
     */
    
    {
        BaseViewController *vc = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
        BaseNavigationController *navi = [[BaseNavigationController alloc] initWithRootViewController:vc];
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:[[UIImage imageNamed:@"tabbar_main"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_main_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [viewControllers addObject:navi];
    }
    
    {
        BaseViewController *vc = [[AppViewController alloc] initWithNibName:@"AppViewController" bundle:nil];
        BaseNavigationController *navi = [[BaseNavigationController alloc] initWithRootViewController:vc];
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"应用" image:[[UIImage imageNamed:@"tabbar_apps"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_apps_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [viewControllers addObject:navi];
    }
    
    {
        BaseViewController *vc = [[NewsViewController alloc] initWithNibName:@"NewsViewController" bundle:nil];
        BaseNavigationController *navi = [[BaseNavigationController alloc] initWithRootViewController:vc];
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"新闻" image:[[UIImage imageNamed:@"tabbar_news"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_news_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [viewControllers addObject:navi];
    }
    
    {
        BaseViewController *vc = [[MineViewController alloc] initWithNibName:@"MineViewController" bundle:nil];
        BaseNavigationController *navi = [[BaseNavigationController alloc] initWithRootViewController:vc];
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:[[UIImage imageNamed:@"tabbar_mine"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabbar_mine_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [viewControllers addObject:navi];
    }
    
    self.viewControllers = viewControllers;
    
}


@end
