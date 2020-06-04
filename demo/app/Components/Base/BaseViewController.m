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
    // Do any additional setup after loading the view.
    //    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    //    self.navigationItem.backBarButtonItem = backItem;
}

/**
 * 使用baseTitleView取代系统原有的titleView使得自定义变的非常容易
 */
- (BaseTitleView *)baseTitleView {
    if (!_baseTitleView) {
        // 初始自定义titleView
        _baseTitleView = [[NSBundle mainBundle] loadNibNamed:@"BaseTitleView" owner:nil options:nil][0];
        _baseTitleView.frame = CGRectMake(0, 0, 0, 44);
        _baseTitleView.backgroundColor = [UIColor yellowColor];
        // 设置标题最多显示字数, 超出显示 ...
        _baseTitleView.titleLabel.maxTextNum = 10;
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

@end
