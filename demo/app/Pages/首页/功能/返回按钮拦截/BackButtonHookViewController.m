//
//  BackButtonHookViewController.m
//  demo
//
//  Created by 张祎 on 2020/6/15
//  Copyright © 2020 objcat. All rights reserved.
//
    

#import "BackButtonHookViewController.h"

@interface BackButtonHookViewController ()

@end

@implementation BackButtonHookViewController

- (BOOL)navigationShouldPopOnBackButton {
    __weak typeof(self) weakSelf = self;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否返回" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *determin = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alert addAction:determin];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"返回按钮拦截";
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
