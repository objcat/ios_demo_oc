//
//  SecondViewController.m
//  demo
//
//  Created by 张祎 on 2020/6/4
//  Copyright © 2020 objcat. All rights reserved.
//
    

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (BOOL)navigationShouldPopOnBackButton {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否返回" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *determin = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
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
    self.view.backgroundColor = [UIColor cyanColor];
    
    UITextField *textField = [[UITextField alloc] init];
    textField.frame = CGRectMake(100, 500, 100, 40);
    textField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:textField];
    
    UITextField *textField2 = [[UITextField alloc] init];
    textField2.frame = CGRectMake(100, 600, 100, 40);
    textField2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:textField2];
}

@end
