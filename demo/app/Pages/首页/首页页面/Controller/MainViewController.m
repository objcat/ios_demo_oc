//
//  MainViewController.m
//  demo
//
//  Created by 张祎 on 2020/6/4
//  Copyright © 2020 objcat. All rights reserved.
//


#import "MainViewController.h"
#import "TestZYKitViewController.h"
#import "EHFormTableView.h"

@interface MainViewController ()
@property (strong, nonatomic) EHFormTableView *tableView;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // 设置页面标题
    self.navigationItem.title = @"Demo案例";
    // 创建tableView
    [self createTableView];
    /**
     如果你对这个项目一脸懵逼 我推荐你直接去`Main.storyboard`去看跳转逻辑 我的页面之间跳转是使用segue来实现的
     */
}

- (void)createTableView {
    
    EHFormTableView *tableView = [EHFormTableView tableView];
    tableView.frame = self.view.bounds;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    __weak typeof(self) weakSelf = self;

    [tableView addNormalRowWithName:@"原生控件" value:nil cell:@"EHTapTableViewCell" rowHeight:50 callBack:^(EHFormModel *model) {
        [weakSelf performSegueWithIdentifier:@"TestNativeControlsViewControllerSegue" sender:model];
    }];
    
    [tableView addNormalRowWithName:@"功能" value:nil cell:@"EHTapTableViewCell" rowHeight:50 callBack:^(EHFormModel *model) {
        [weakSelf performSegueWithIdentifier:@"TestSkillViewControllerSegue" sender:model];
    }];
    
    [tableView addNormalRowWithName:@"极端测试" value:nil cell:@"EHTapTableViewCell" rowHeight:50 callBack:^(EHFormModel *model) {
        [weakSelf performSegueWithIdentifier:@"TestExtremeViewControllerSegue" sender:model];
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // 多态, 获取push的控制器
    BaseViewController *vc = segue.destinationViewController;
    // 获取传递的model
    EHFormModel *model = sender;
    // 把model的name赋值到标题上
    vc.navigationItem.title = model.name;
}

@end
