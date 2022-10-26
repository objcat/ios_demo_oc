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
    // 设置子控制器
    [self setupControllers];
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
