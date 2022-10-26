//
//  TestCustomViewController.m
//  demo
//
//  Created by objcat on 2022/10/26.
//  Copyright © 2022 objcat. All rights reserved.
//

#import "TestCustomViewController.h"
#import "EHFormTableView.h"
#import "TestCustomTitleViewViewController.h"

@interface TestCustomViewController ()
@property (strong, nonatomic) EHFormTableView *tableView;
@end

@implementation TestCustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTableView];
}

- (void)createTableView {
    self.tableView = [EHFormTableView tableView];
    [self.view addSubview:self.tableView];
    __weak typeof(self) weakSelf = self;
    [self.tableView addNormalRowWithName:@"自定义标题栏" value:nil cellClass:[EHTapTableViewCell class] rowHeight:50 callBack:^(EHFormModel *model, EHFormModelEventType eventType, NSDictionary *dictionary) {
        [weakSelf.navigationController pushViewController:[[TestCustomTitleViewViewController alloc] init] animated:YES];
    }];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    CGRect safeAreaLayoutFrame = self.view.safeAreaLayoutGuide.layoutFrame;
    self.tableView.frame = safeAreaLayoutFrame;
}

@end
