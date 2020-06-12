//
//  AppDelegate.m
//  demo
//
//  Created by 张祎 on 2020/6/4
//  Copyright © 2020 objcat. All rights reserved.
//
    

#import "AppDelegate.h"
#import "BaseTabBarController.h"
#import <IQKeyboardManager.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 初始化window
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // 设置主视图控制器
    [self setupMain];
    // 设置IQ
    [self configIQKeyboard];
    // 让window显示在屏幕上
    [self.window makeKeyAndVisible];
    

    
    return YES;
}

- (void)setupMain {
    // 自定义tabBarController
    self.window.rootViewController = [[BaseTabBarController alloc] init];
}

- (void)configIQKeyboard {
    // 使用智能键盘
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    // 控制工具条到输入框距离
    manager.keyboardDistanceFromTextField = 10;
    // 控制整个功能是否启用
    manager.enable = YES;
    // 控制是否显示键盘上的自动工具条,当需要支持内联编辑(Inline Editing), 这就需要隐藏键盘上的工具条(默认打开)
    manager.enableAutoToolbar = YES;
    // 启用手势触摸:控制点击背景是否收起键盘。
    manager.shouldResignOnTouchOutside = YES;
    // 是否显示提示文字
    manager.shouldShowToolbarPlaceholder = YES;
}

@end
