//
//  BaseViewController.m
//  demo
//
//  Created by 张祎 on 2020/6/4
//  Copyright © 2020 objcat. All rights reserved.
//


#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 设置返回按钮文字
    [self configBackButton];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 各项设置
    [self setting];
    // 打印沙盒路径
    [self logSandbox];
}

- (void)setting {
    
    // 设置返回按钮的标题, 设置为空就是原标题
    self.backButtonTitle = nil;
    
    // 设置背景颜色
    if (self.view.backgroundColor == nil) {
        /**
         * 判断是否初始化了颜色 如果没有赋值成白色
         * 加判断的目的是为了不影响storyboard中设置的初始背景颜色
         */
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

/**
 * 使用baseTitleView取代系统原有的titleView使得自定义变的非常容易
 */
- (BaseTitleView *)baseTitleView {
    if (!_baseTitleView) {
        // 初始自定义titleView
        _baseTitleView = [[NSBundle mainBundle] loadNibNamed:@"BaseTitleView" owner:nil options:nil][0];
        _baseTitleView.backgroundColor = [UIColor yellowColor];
        self.navigationItem.titleView = _baseTitleView;
    }
    return _baseTitleView;
}

- (void)configBackButton {
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:self.backButtonTitle ? self.backButtonTitle : self.baseTitleView.titleLabel.text style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.backBarButtonItem = backItem;
    self.title = nil;
    self.navigationItem.title = nil;
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
