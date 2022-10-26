//
//  TestExtremeViewController.m
//  demo
//
//  Created by 张祎 on 2020/6/11
//  Copyright © 2020 objcat. All rights reserved.
//


#import "TestExtremeViewController.h"
#import "EHFormTableView.h"
#import "TooLongTitleViewController.h"
#import "TooMuchBarButtonItemViewController.h"

@interface TestExtremeViewController ()

@end

@implementation TestExtremeViewController

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
    
    [tableView addNormalRowWithName:@"超长标题" value:nil cellClass:[EHTapTableViewCell class] rowHeight:50 callBack:^(EHFormModel *model, EHFormModelEventType eventType, NSDictionary *dictionary) {
        [weakSelf.navigationController pushViewController:[[TooLongTitleViewController alloc] init] animated:YES];
    }];
    
    [tableView addNormalRowWithName:@"超多按钮" value:nil cellClass:[EHTapTableViewCell class] rowHeight:50 callBack:^(EHFormModel *model, EHFormModelEventType eventType, NSDictionary *dictionary) {
        [weakSelf.navigationController pushViewController:[[TooMuchBarButtonItemViewController alloc] init] animated:YES];
    }];
}

@end
