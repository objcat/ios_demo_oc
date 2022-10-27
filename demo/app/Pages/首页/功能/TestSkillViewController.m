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
#import "ExitViewController.h"

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
    
    [tableView addNormalRowWithName:@"返回按钮拦截" value:nil cellClass:[EHTapTableViewCell class] rowHeight:50 callBack:^(EHFormModel *model, EHFormModelEventType eventType, NSDictionary *dictionary) {
        [weakSelf.navigationController pushViewController:[[BackButtonHookViewController alloc] init] animated:YES];
    }];
    
    [tableView addNormalRowWithName:@"禁用某页面的返回手势" value:nil cellClass:[EHTapTableViewCell class] rowHeight:50 callBack:^(EHFormModel *model, EHFormModelEventType eventType, NSDictionary *dictionary) {
        [weakSelf.navigationController pushViewController:[[StopPopGestureRecognizerViewController alloc] init] animated:YES];
    }];
    
    [tableView addNormalRowWithName:@"退出程序" value:nil cellClass:[EHTapTableViewCell class] rowHeight:50 callBack:^(EHFormModel *model, EHFormModelEventType eventType, NSDictionary *dictionary) {
        [weakSelf.navigationController pushViewController:[[ExitViewController alloc] init] animated:YES];
    }];
}

@end
