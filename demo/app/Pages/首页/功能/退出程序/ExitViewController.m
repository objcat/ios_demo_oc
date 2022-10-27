//
//  ExitViewController.m
//  demo
//
//  Created by 张祎 on 2020/8/27
//  Copyright © 2020 objcat. All rights reserved.
//
    

#import "ExitViewController.h"

@interface ExitViewController ()

@end

@implementation ExitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 200, 100, 20);
    [button setTitle:@"退出" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(doExit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)doExit {
    [UIView animateWithDuration:.3f delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [[[UIApplication sharedApplication] delegate] window].bounds = CGRectZero;
    } completion:^(BOOL finished) {
        exit(0);
    }];
}

@end
