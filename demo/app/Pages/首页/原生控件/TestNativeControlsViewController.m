//
//  TestNativeControlsViewController.m
//  demo
//
//  Created by objcat on 2022/10/26.
//  Copyright © 2022 objcat. All rights reserved.
//

#import "TestNativeControlsViewController.h"
#import "EHFormTableView.h"

@interface TestNativeControlsViewController ()

@end

@implementation TestNativeControlsViewController

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
    [tableView addNormalRowWithName:@"UIView" value:nil cellClass:[EHTapTableViewCell class] rowHeight:50 callBack:^(EHFormModel *model, EHFormModelEventType eventType, NSDictionary *dictionary) {
        [weakSelf performSegueWithIdentifier:@"UIViewDemoViewController" sender:model];
    }];
    
    [tableView addNormalRowWithName:@"UITextField" value:nil cellClass:[EHTapTableViewCell class] rowHeight:50 callBack:^(EHFormModel *model, EHFormModelEventType eventType, NSDictionary *dictionary) {
        [weakSelf performSegueWithIdentifier:@"UITextFieldDemoViewController" sender:model];
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    EHFormModel *model = sender;
    BaseViewController *vc = segue.destinationViewController;
    vc.baseTitleView.titleLabel.text = model.name;
}

@end
