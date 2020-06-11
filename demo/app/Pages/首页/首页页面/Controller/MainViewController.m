//
//  MainViewController.m
//  demo
//
//  Created by 张祎 on 2020/6/4
//  Copyright © 2020 objcat. All rights reserved.
//


#import "MainViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "EHFormTableView.h"

@interface MainViewController ()
@property (strong, nonatomic) EHFormTableView *tableView;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.baseTitleView.titleLabel.text = @"Demo案例";
    self.baseTitleView.titleLabel.textColor = COLORHEX(@"#409EFF");
    self.baseTitleView.titleLabel.font = [UIFont systemFontOfSize:25];
    [self createTableView];
    
    
}

- (void)createTableView {
    
    EHFormTableView *tableView = [EHFormTableView tableView];
    tableView.frame = self.view.bounds;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    __weak typeof(self) weakSelf = self;

    [tableView addNormalRowWithName:@"原生控件" value:nil cell:@"EHTapTableViewCell" rowHeight:50 callBack:^(EHFormModel *model) {
        [weakSelf performSegueWithIdentifier:@"SecondViewController" sender:model];
    }];
    
    [tableView addNormalRowWithName:@"ZYKit" value:nil cell:@"EHTapTableViewCell" rowHeight:50 callBack:^(EHFormModel *model) {
        [weakSelf performSegueWithIdentifier:@"ThirdViewController" sender:model];
    }];
    
    [tableView addNormalRowWithName:@"极端测试" value:nil cell:@"EHTapTableViewCell" rowHeight:50 callBack:^(EHFormModel *model) {
        [weakSelf performSegueWithIdentifier:@"FourthViewController" sender:model];
    }];
    
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // 多态, 获取push的控制器
    BaseViewController *vc = segue.destinationViewController;
    // 获取传递的model
    EHFormModel *model = sender;
    // 把model的name赋值到标题上
    vc.baseTitleView.titleLabel.text = model.name;
}

@end
