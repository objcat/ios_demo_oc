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
    self.baseTitleView.titleLabel.text = @"禁用某页面的返回手势";
    self.stopInteractivePopGestureRecognizer = YES;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
