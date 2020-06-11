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

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置默认背景颜色 防止渲染延迟反应
    self.view.backgroundColor = [UIColor whiteColor];
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
        
        __weak typeof(self) weakSelf = self;
        [_baseTitleView setTextDidSetBlock:^(NSString * _Nonnull text) {
            /**
             * 这里可以单独控制返回按钮的标题, 做到了标题和返回按钮的标题分离的效果
             * 比如清空返回按钮的标题就是设置为 @""
             */
            weakSelf.navigationItem.title = text;
        }];
    }
    return _baseTitleView;
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
