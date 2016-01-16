//
//  consultPatientController.m
//  shenBoShi
//
//  Created by 开发2 on 16/1/6.
//  Copyright © 2016年 开发3-lyp. All rights reserved.
//

#import "consultPatientController.h"
#import "allView.h"
#import "noLookView.h"
#import "lookedView.h"
#import "treatedView.h"
@interface consultPatientController ()

@end

@implementation consultPatientController
{
    UIImageView * _bottomView;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self bottomView];
    [self createLeftButton];
    [self createNavTitle];
    [self createScroll];
    // Do any additional setup after loading the view.
}
#pragma mark ---导航上的名称
-(void)createNavTitle
{
    UILabel * navLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 62.67, 37.3)];
    navLabel.text=@"咨询您的患者信息";
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

#pragma mark 创建头部滑动条
-(void)createScroll{
    
    CGRect frame =CGRectMake(0, 64, KDEVICEWIDTH , KDEVICEHEIGHT-64);
    //对应填写两个数组
    NSArray *views =@[[allView new],[noLookView new],[lookedView new],[treatedView new]];
    NSArray *names =@[@"全部",@"未查看",@"已查看",@"已诊治"];
    
    
    //创建使用
    self.scroll =[XLScrollViewer scrollWithFrame:frame withViews:views withButtonNames:names withThreeAnimation:222];//三中动画都选择
    
    //自定义各种属性。。打开查看
    self.scroll.xl_topBackColor =RGB(53, 170, 170, 1);
    self.scroll.xl_sliderColor =[UIColor whiteColor];
    self.scroll.xl_buttonColorNormal =[UIColor whiteColor];
    self.scroll.xl_buttonColorSelected =[UIColor whiteColor];
    self.scroll.xl_buttonFont =14;
    self.scroll.xl_buttonToSlider =2;
    self.scroll.xl_sliderHeight =2;
    self.scroll.xl_topHeight =30;
    self.scroll.xl_isSliderCorner =YES;
    
    //加入控制器视图
    [self.view addSubview:self.scroll];
    
   
    
}
-(void)bottomView
{
    _bottomView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
    [_bottomView setImage:[UIImage imageNamed:@"background"]];
    [self.view addSubview:_bottomView];
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
