//
//  SecondViewController.m
//  demo
//
//  Created by 张祎 on 2020/6/4
//  Copyright © 2020 objcat. All rights reserved.
//


#import "SecondViewController.h"
#import "EHFormTableView.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

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
    
    [tableView addNormalRowWithName:@"UILabel" value:nil cell:@"EHTapTableViewCell" rowHeight:50 callBack:^(EHFormModel *model) {
        [weakSelf.view makeToast:model.name duration:2 position:CSToastPositionCenter];
    }];
    
    [tableView addNormalRowWithName:@"UITextField" value:nil cell:@"EHTapTableViewCell" rowHeight:50 callBack:^(EHFormModel *model) {
        [weakSelf.view makeToast:model.name duration:2 position:CSToastPositionCenter];
    }];
    
}

@end
