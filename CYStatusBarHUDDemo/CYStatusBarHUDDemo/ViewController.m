//
//  ViewController.m
//  CYStatusBarHUDDemo
//
//  Created by 陈勇 on 15-1-27.
//  Copyright (c) 2015年 zhssit. All rights reserved.
//

#import "ViewController.h"

#import "CYStatusBarHUD/CYStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)showSuccess
{
    [CYStatusBarHUD showSuccess:@"资源加载成功！"];
}

- (IBAction)showError
{
    [CYStatusBarHUD showError:@"资源加载失败！"];
}

- (IBAction)showLoding
{
    [CYStatusBarHUD showLoading:@"资源正在拼命加载中。。。"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 3秒后隐藏消息
        [CYStatusBarHUD hideLoading];
    });
}

@end
