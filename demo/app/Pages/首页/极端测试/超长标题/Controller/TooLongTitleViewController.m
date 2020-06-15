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
    self.baseTitleView.titleLabel.text = @"超长标题超长标题超长标题超长标题超长标题超长标题";
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
