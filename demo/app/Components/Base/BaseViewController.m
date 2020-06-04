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
}

- (BaseTitleView *)baseTitleView {
    if (!_baseTitleView) {
        BaseTitleView *titleView = [[NSBundle mainBundle] loadNibNamed:@"BaseTitleView" owner:nil options:nil][0];
        titleView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 200, 44);
        //        titleView.backgroundColor = [UIColor yellowColor];
        _baseTitleView = titleView;
        self.navigationItem.titleView = _baseTitleView;
        
        __weak typeof(self) weakSelf = self;
        [_baseTitleView setTextDidSetBlock:^(NSString * _Nonnull text) {
            weakSelf.navigationItem.title = text;
        }];
    }
    return _baseTitleView;
}

@end
