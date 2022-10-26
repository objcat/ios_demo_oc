//
//  BaseViewController.m
//  demo
//
//  Created by 张祎 on 2020/6/4
//  Copyright © 2020 objcat. All rights reserved.
//


#import "BaseViewController.h"

@interface BaseViewController () <UIGestureRecognizerDelegate>
/**
 * 设置返回按钮图片 此属性非常顽固
 * 所以通常情况下所有页面的返回按钮样式要保持一样 这里不支持动态修改
 */
@property (strong, nonatomic) UIImage *backButtonImage;
@end

@implementation BaseViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // 禁用某页面返回按钮功能
    if (self.stopInteractivePopGestureRecognizer) {
        if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        }
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (self.stopInteractivePopGestureRecognizer) {
        if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
            self.navigationController.interactivePopGestureRecognizer.enabled = YES;
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 默认设置
    [self defaultSetting];
    // 打印沙盒路径
    [self logSandbox];
}

- (void)defaultSetting {
    // 默认返回按钮标题 随原标题
    self.backButtonTitle = nil;
    // 默认返回按钮颜色
    self.backButtonTintColor = COLORHEX(@"#409EFF");
    // 是否使用tintColor的颜色渲染返回按钮的图片
    self.backButtonImageTemplete = YES;
    // 默认返回按钮图标 注释掉就是系统默认图标
    self.backButtonImage = [UIImage imageNamed:@"back"];
    
    /**
     * 判断是否初始化了颜色 如果没有赋值成白色
     * 加判断的目的是为了不影响storyboard中设置的初始背景颜色
     */
    if (self.view.backgroundColor == nil) {
        self.view.backgroundColor = [UIColor whiteColor];
    }
}

- (void)logSandbox {
    // 打印沙盒路径
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"沙盒路径: %@", [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject]);
    });
}

- (void)configTitleView {
    if (self.baseTitleView) {
        // 设置返回按钮标题
        self.navigationItem.titleView = self.baseTitleView;
    }
}

- (void)configBackButton {
    NSString *defaultText = nil;
    // 如果当前控制器是自定义titleView
    if (self.baseTitleView) {
        defaultText = self.baseTitleView.titleLabel.text;
    } else {
        // 如果当前控制器不是自定义titleView
        defaultText = self.navigationItem.title;
    }
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:self.backButtonTitle ? self.backButtonTitle : defaultText style:UIBarButtonItemStyleDone target:nil action:nil];
    backItem.tintColor = self.backButtonTintColor;
    self.navigationItem.backBarButtonItem = backItem;
    // 设置返回按钮图片
    UIImage *image = self.backButtonImage;
    if (self.backButtonImageTemplete) {
        // 渲染
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    } else {
        // 不渲染
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    self.navigationController.navigationBar.backIndicatorImage = image;
    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = image;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    // 设置自定义titleView
    [self configTitleView];
    // 设置返回按钮
    [self configBackButton];
}

/**
 * 打印控制器释放, 非常重要一定要写
 * 经常导致控制器不能释放的问题, 归根结底就是对象被持有了, 只要引用计数>0, 对象就永远不会被释放
 * 1.block没有使用weakSelf
 * 2.子类持有父类对象使用了strong, 没有使用weak
 */
- (void)dealloc {
    NSLog(@"控制器释放---%@", NSStringFromClass([self class]));
}

@end
