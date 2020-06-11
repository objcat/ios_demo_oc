//
//  TooLongTitleViewController.m
//  demo
//
//  Created by 张祎 on 2020/6/11
//  Copyright © 2020 objcat. All rights reserved.
//
    

#import "TooLongTitleViewController.h"

@interface TooLongTitleViewController ()

@end

@implementation TooLongTitleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.baseTitleView.titleLabel.text = @"我的家在东北松花江上，那里有森林煤矿，还有那满山遍野的大豆高粱";
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
