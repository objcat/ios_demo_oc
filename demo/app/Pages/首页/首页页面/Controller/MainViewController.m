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
    [tableView addNormalRowWithName:@"原生组件" value:nil cell:@"EHTapTableViewCell" rowHeight:50 callBack:^(EHFormModel *model) {
        [weakSelf performSegueWithIdentifier:@"SecondViewController" sender:nil];
    }];
    
    [tableView addNormalRowWithName:@"ZYKit" value:nil cell:@"EHTapTableViewCell" rowHeight:50 callBack:^(EHFormModel *model) {
        
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"%@", segue.destinationViewController);
}

@end
