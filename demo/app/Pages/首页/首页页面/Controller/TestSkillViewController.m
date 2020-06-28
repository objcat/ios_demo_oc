//
//  TestSkillViewController.m
//  demo
//
//  Created by 张祎 on 2020/6/15
//  Copyright © 2020 objcat. All rights reserved.
//
    

#import "TestSkillViewController.h"
#import "EHFormTableView.h"
#import "BackButtonHookViewController.h"
#import "StopPopGestureRecognizerViewController.h"

@interface TestSkillViewController ()

@end

@implementation TestSkillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTableView];
}

- (void)createTableView {
    EHFormTableView *tableView = [EHFormTableView tableView];
    tableView.frame = self.view.bounds;
    [self.view addSubview:tableView];
    
    __weak typeof(self) weakSelf = self;
    
    [tableView addNormalRowWithName:@"返回按钮拦截" value:nil cell:@"EHTapTableViewCell" rowHeight:50 callBack:^(EHFormModel *model) {
        [weakSelf.navigationController pushViewController:[[BackButtonHookViewController alloc] init] animated:YES];
    }];
    
    [tableView addNormalRowWithName:@"禁用某页面的返回手势" value:nil cell:@"EHTapTableViewCell" rowHeight:50 callBack:^(EHFormModel *model) {
        [weakSelf.navigationController pushViewController:[[StopPopGestureRecognizerViewController alloc] init] animated:YES];
    }];
    

    
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
