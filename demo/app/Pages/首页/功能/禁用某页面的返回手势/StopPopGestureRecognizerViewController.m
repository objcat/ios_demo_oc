//
//  StopPopGestureRecognizerViewController.m
//  demo
//
//  Created by 张祎 on 2020/6/28
//  Copyright © 2020 objcat. All rights reserved.
//
    

#import "StopPopGestureRecognizerViewController.h"

@interface StopPopGestureRecognizerViewController ()

@end

@implementation StopPopGestureRecognizerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"禁用某页面的返回手势";
    self.stopInteractivePopGestureRecognizer = YES;
}

@end
