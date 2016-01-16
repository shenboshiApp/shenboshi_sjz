//
//  LoginViewController.m
//  shenBoShi
//
//  Created by 开发3 on 16/1/10.
//  Copyright © 2016年 开发3-lyp. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loginView];

    // Do any additional setup after loading the view.
    //导航栏左侧返回按钮
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage *backImage = [UIImage imageNamed:@"back@3x"];
    backImage = [backImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:backImage style:(UIBarButtonItemStylePlain) target:self action:@selector(backButton)];
    
    //导航栏题目
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 80, 10)];
    label.text = @"登录";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"Arial-BoldMT" size:18];
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = label;
    

    
    
    
}

- (void)backButton
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(LoginView *)loginView
{
    if (!_loginView) {
        _loginView = [[LoginView alloc] initWithFrame:CGRectMake(0, 64, KDEVICEWIDTH, KDEVICEHEIGHT - 64)];
    
    }
    
    
    
    [self.view addSubview:_loginView];
    
    
    
    return _loginView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
