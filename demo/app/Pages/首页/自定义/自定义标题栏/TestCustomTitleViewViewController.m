//
//  TestCustomTitleViewViewController.m
//  demo
//
//  Created by objcat on 2022/10/26.
//  Copyright © 2022 objcat. All rights reserved.
//

#import "TestCustomTitleViewViewController.h"
#import "ZYCustomTitleView.h"
#import "EHFormTableView.h"

@interface TestCustomTitleViewViewController ()
@property (strong, nonatomic) EHFormTableView *tableView;
@end

@implementation TestCustomTitleViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"点击列表切换自定义标题栏";
    [self createTableView];
}

- (void)createTableView {
    self.tableView = [EHFormTableView tableView];
    [self.view addSubview:self.tableView];
    __weak typeof(self) weakSelf = self;
    
    [self.tableView addNormalRowWithName:@"自定义label标题栏" value:@"" cellClass:[EHTapTableViewCell class] rowHeight:50 callBack:^(EHFormModel *model, EHFormModelEventType eventType, NSDictionary *dictionary) {
        UILabel *label = [[UILabel alloc] init];
        label.text = @"我是自定义label";
        weakSelf.customTitleView = label;
    }];
    
    [self.tableView addNormalRowWithName:@"自定义label长标题栏" value:@"" cellClass:[EHTapTableViewCell class] rowHeight:50 callBack:^(EHFormModel *model, EHFormModelEventType eventType, NSDictionary *dictionary) {
        UILabel *label = [[UILabel alloc] init];
        label.text = @"我是超长label*(&#89473289748932746781263872613908192083";
        weakSelf.customTitleView = label;
    }];
    
    [self.tableView addNormalRowWithName:@"带图标的标题栏" value:@"" cellClass:[EHTapTableViewCell class] rowHeight:50 callBack:^(EHFormModel *model, EHFormModelEventType eventType, NSDictionary *dictionary) {
        ZYCustomTitleView *customTitleView = [ZYCustomTitleView defaultTitleView];
        customTitleView.titleLabel.text = @"我是只猫";
        weakSelf.customTitleView = customTitleView;
    }];
    
    [self.tableView addNormalRowWithName:@"带图标的长标题栏" value:@"" cellClass:[EHTapTableViewCell class] rowHeight:50 callBack:^(EHFormModel *model, EHFormModelEventType eventType, NSDictionary *dictionary) {
        ZYCustomTitleView *customTitleView = [ZYCustomTitleView defaultTitleView];
        customTitleView.titleLabel.text = @"我是只猫156243561243562143562145632145632145634";
        weakSelf.customTitleView = customTitleView;
    }];
    
    [self.tableView addNormalRowWithName:@"还原标题栏" value:@"" cellClass:[EHTapTableViewCell class] rowHeight:50 callBack:^(EHFormModel *model, EHFormModelEventType eventType, NSDictionary *dictionary) {
        weakSelf.customTitleView = nil;
    }];
    
    [self.tableView addNormalRowWithName:@"测试跳转" value:@"" cellClass:[EHTapTableViewCell class] rowHeight:50 callBack:^(EHFormModel *model, EHFormModelEventType eventType, NSDictionary *dictionary) {
        [weakSelf.navigationController pushViewController:[[TestCustomTitleViewViewController alloc] init] animated:YES];
    }];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    CGRect safeAreaLayoutFrame = self.view.safeAreaLayoutGuide.layoutFrame;
    self.tableView.frame = safeAreaLayoutFrame;
}

@end
