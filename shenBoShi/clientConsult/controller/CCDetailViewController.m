//
//  CCDetailViewController.m
//  shenBoShi
//
//  Created by 开发4 on 16/1/1.
//  Copyright © 2016年 开发3-lyp. All rights reserved.
//

#import "CCDetailViewController.h"

@interface CCDetailViewController ()
@end

@implementation CCDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.ccDetail];
    [self addTitleView];
    [self addLeftBarButton];
    // Do any additional setup after loading the view.
}
- (CCDetailView *)ccDetail
{
    if (_ccDetail == nil) {
        _ccDetail = [[CCDetailView alloc]initWithFrame:CGRectMake(0, 64, KDEVICEWIDTH, KDEVICEHEIGHT)];
    }
    return _ccDetail;
}
- (void)addTitleView
{
    UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 60, 20)];
    titleLable.textColor = [UIColor whiteColor];
    titleLable.font=[UIFont fontWithName:@"Arial-BoldMT" size:20];
    titleLable.text = @"患者交流中心";
    self.navigationItem.titleView = titleLable;
}
- (void)addLeftBarButton
{
    UIImage *backImage = [UIImage imageNamed:@"back@3x"];
    backImage = [backImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:backImage style:(UIBarButtonItemStylePlain) target:self action:@selector(backButton:)];
    
}

- (void)backButton:(UIButton *)button
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
