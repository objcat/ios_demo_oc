//
//  MainViewController.m
//  demo
//
//  Created by 张祎 on 2020/6/4
//  Copyright © 2020 objcat. All rights reserved.
//


#import "MainViewController.h"
#import "SecondViewController.h"
#import "EHFormTableView.h"

@interface MainViewController ()
@property (strong, nonatomic) EHFormTableView *tableView;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.baseTitleView.titleLabel.text = @"首页";
    self.baseTitleView.titleLabel.textColor = COLORHEX(@"#409EFF");
    NSLog(@"%@", NSStringFromCGRect(self.view.bounds));
    NSLog(@"%@", NSStringFromCGRect([UIScreen mainScreen].bounds));
    [self createTableView];
}

- (void)createTableView {
    self.tableView = [EHFormTableView tableView];
    self.tableView.frame = self.view.bounds;
    [self.view addSubview:self.tableView];
    
    __weak typeof(self) weakSelf = self;
    
    [self.tableView addWhiteRowWithcell:@"EHWhiteRowTableViewCell" BackgroundColor:self.tableView.backgroundColor rowHeight:16 separatorHeight:0 separatorColor:nil separatorOffset:0];
    
    [self.tableView addNormalRowWithName:@"个人资料" value:nil cell:@"EHTapTableViewCell" rowHeight:50 callBack:^(EHFormModel *model) {
    }];
    
    [self.tableView addNormalRowWithName:@"客服电话" value:@"1388888888" cell:@"EHPhoneNumberTableViewCell" rowHeight:50 callBack:^(EHFormModel *model) {
    }];
    
    [[self.tableView addUnableTapRowWithName:@"消息免打扰" value:nil cell:@"EHSwitchTableViewCell" rowHeight:50 callBack:^(EHFormModel *model) {
        if (model.on) {
            NSLog(@"开关on");
        } else {
            NSLog(@"开关off");
        }
    }] eh_attributed:^(EHFormModel *model) {
        // 设置开关默认值
        model.on = YES;
    }];
    
    [self.tableView addWhiteRowWithcell:@"EHWhiteRowTableViewCell" BackgroundColor:self.tableView.backgroundColor rowHeight:16 separatorHeight:0 separatorColor:nil separatorOffset:0];
    
    [self.tableView addNormalRowWithName:@"个人资料" value:nil cell:@"EHTapTableViewCell" rowHeight:50 callBack:^(EHFormModel *model) {
    }];
    
    
    
}


@end
