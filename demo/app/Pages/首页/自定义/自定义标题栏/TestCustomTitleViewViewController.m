//
//  TestCustomTitleViewViewController.m
//  demo
//
//  Created by objcat on 2022/10/26.
//  Copyright © 2022 objcat. All rights reserved.
//

#import "TestCustomTitleViewViewController.h"
#import "BaseTitleView.h"

@interface TestCustomTitleViewViewController ()

@end

@implementation TestCustomTitleViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.baseTitleView = [BaseTitleView defaultBaseTitleView];
    self.baseTitleView.titleLabel.text = @"我是只猫";
}

@end
