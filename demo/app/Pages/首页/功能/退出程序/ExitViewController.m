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
    
#pragma mark 123
}

#pragma - mark 123

- (void)doExit {
    exit(0);
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
