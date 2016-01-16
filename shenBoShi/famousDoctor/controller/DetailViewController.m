//
//  DetailViewController.m
//  shenBoShi
//
//  Created by 开发3 on 15/12/25.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.mingYiDetailView];
    self.automaticallyAdjustsScrollViewInsets = NO;
    //导航栏左侧返回按钮
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage *backImage = [UIImage imageNamed:@"back@3x"];
    backImage = [backImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:backImage style:(UIBarButtonItemStylePlain) target:self action:@selector(backButton:)];

    //导航栏题目
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 80, 10)];
    label.text = @"专家个人资料";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"Arial-BoldMT" size:18];
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = label;
    
//    self.navigationController.title = @"简介";
    
}


- (void)backButton:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(MingYIDetailView *)mingYiDetailView
{
    if (_mingYiDetailView == nil) {
        _mingYiDetailView = [[MingYIDetailView alloc] initWithFrame:CGRectMake(0, 64, KDEVICEWIDTH, KDEVICEHEIGHT - 64)];
        
    }
    return _mingYiDetailView;
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
