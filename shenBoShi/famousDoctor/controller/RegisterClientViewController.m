//
//  RegisterClientViewController.m
//  RegisterProject
//
//  Created by 开发4 on 16/1/10.
//  Copyright © 2016年 开发4. All rights reserved.
//

#import "RegisterClientViewController.h"
#import "RegisterClientView.h"
#import "personCentreController.h"

@interface RegisterClientViewController ()
@property (nonatomic, strong)RegisterClientView *registerClientView;
@end

@implementation RegisterClientViewController

- (RegisterClientView *)registerClientView
{
    if (_registerClientView == nil) {
        _registerClientView = [[RegisterClientView alloc]initWithFrame:[UIScreen mainScreen].bounds];
       
    }
    return _registerClientView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.registerClientView];
    
    
    //导航栏题目
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 80, 10)];
    label.text = @"注册";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"Arial-BoldMT" size:18];
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = label;
    

    
    //导航栏左侧返回按钮
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage *backImage = [UIImage imageNamed:@"back@3x"];
    backImage = [backImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:backImage style:(UIBarButtonItemStylePlain) target:self action:@selector(backButton)];
    
    //导航栏右侧按钮
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [rightButton setImage:[UIImage imageNamed:@"list@3x"] forState:UIControlStateNormal];
    [rightButton setTitle:@"完成" forState:UIControlStateNormal];
    rightButton.frame = CGRectMake(KDEVICEWIDTH-36, 35.5, 50, 10);
    [rightButton setImageEdgeInsets:UIEdgeInsetsMake(0, 60, 0, 0)]; //距离左边多少  要是向左移动 是负数
    [rightButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    [rightButton addTarget:self action:@selector(bingZhongButton:) forControlEvents:(UIControlEventTouchUpInside)];
    


}


- (void)bingZhongButton: (UIButton *)sender
{

    [self.registerClientView setFinsh:YES];
    
    
    personCentreController *personVC = [[personCentreController alloc] init];
    
    
    
    [self.navigationController pushViewController:personVC animated:YES];
}
- (void)backButton
{
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
