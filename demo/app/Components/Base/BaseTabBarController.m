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
    // Do any additional setup after loading the view.
    // 设置样式
    [self setupStyles];
    // 设置子控制器
    [self setupControllers];
}

- (void)setupStyles {
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar_color_image"]];
}

- (void)setupControllers {
    
    
    NSMutableArray *viewControllers = [NSMutableArray array];
    
    /**
     * 使用 {} 区分作用域使得命名可以重复
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
