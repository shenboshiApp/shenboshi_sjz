//
//  consultDetailController.m
//  shenBoShi
//
//  Created by 开发2 on 16/1/10.
//  Copyright © 2016年 开发3-lyp. All rights reserved.
//

#import "consultDetailController.h"

@interface consultDetailController ()

@end

@implementation consultDetailController
{
       UIScrollView * _scrollView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    //consult视图
    [self consultView];
    
    //添加背景图
//    [self.view addSubview:self.backImageView];
    //导航上的标题
    [self createNavTitle];
    //导航左按钮
    [self createLeftButton];


}

#pragma mark ---导航上的名称
-(void)createNavTitle
{
    UILabel * navLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 62.67, 37.3)];
    navLabel.text=@"未查看";
    navLabel.font=[UIFont fontWithName:@"Arial-BoldMT" size:18];
    navLabel.textColor=[UIColor whiteColor];
    self.navigationItem.titleView=navLabel;
}
#pragma mark ---导航左边按钮
-(void)createLeftButton
{
    UIImage *backImage = [UIImage imageNamed:@"back@3x"];
    backImage = [backImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:backImage style:(UIBarButtonItemStylePlain) target:self action:@selector(backButton)];
    
}
#pragma mark ---pop页面
-(void)backButton
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//未查看详情View
-(consult *)consultView
{
    if(_consultView==nil){
        _consultView=[[consult alloc]initWithFrame:CGRectMake(0, 0, KDEVICEWIDTH, KDEVICEHEIGHT)];
        
        _consultView.textString = self.string;
        _consultView.symptomString=self.symString;
        [self.view addSubview:_consultView];
    }
    return _consultView;
}





@end
