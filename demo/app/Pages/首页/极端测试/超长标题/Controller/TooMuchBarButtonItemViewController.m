//
//  TooMuchBarButtonItemViewController.m
//  demo
//
//  Created by 张祎 on 2020/6/11
//  Copyright © 2020 objcat. All rights reserved.
//
    

#import "TooMuchBarButtonItemViewController.h"

@interface TooMuchBarButtonItemViewController ()

@end

@implementation TooMuchBarButtonItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.baseTitleView.titleLabel.text = @"挡不着的!!!";
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"点击" style:UIBarButtonItemStyleDone target:self action:nil];
    
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"听说挡不着" style:UIBarButtonItemStyleDone target:self action:nil];
    
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithTitle:@"fuck!!!" style:UIBarButtonItemStyleDone target:self action:nil];
    
    self.navigationItem.rightBarButtonItems = @[item1, item2, item3];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
