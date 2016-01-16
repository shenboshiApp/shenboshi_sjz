//
//  bankCardController.m
//  shenBoShi
//
//  Created by 开发2 on 16/1/12.
//  Copyright © 2016年 开发3-lyp. All rights reserved.
//

#import "bankCardController.h"

@interface bankCardController ()
{
    UITableView * _tableView;
}
@end

@implementation bankCardController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self.view addSubview:self.backImageView];
    [self createNav];
    [self createTable];
    [self createFootViewButton];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)createNav{
    //导航栏题目
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 80, 10)];
    label.text = @"银行卡";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"Arial-BoldMT" size:18];
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = label;
    
    
    //导航栏左侧按钮
    UIImage *backImage = [UIImage imageNamed:@"back@3x"];
    backImage = [backImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:backImage style:(UIBarButtonItemStylePlain) target:self action:@selector(backButton)];
    
}
#pragma mark ---pop页面
-(void)backButton
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark ---创建tableView
-(void)createTable
{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen] bounds].size.height-64) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.separatorColor=[UIColor clearColor];
    _tableView.backgroundColor=[UIColor clearColor];
    [self.view addSubview:_tableView];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        if(indexPath.row==0){
            UIImageView * imageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, cell.frame.size.width-20, 60)];
            imageView.image=[UIImage imageNamed:@"blue"];
            [cell.contentView addSubview:imageView];
        }
        else if(indexPath.row==1){
            UIImageView * imageView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, cell.frame.size.width-20, 60)];
            imageView.image=[UIImage imageNamed:@"red"];
            [cell.contentView addSubview:imageView];
        }

    }
   
    cell.backgroundColor=[UIColor clearColor];
    return cell;
}


-(void)createFootViewButton
{
    UIView *view=[[UIView alloc]initWithFrame:CGRectMake(10, 0, KDEVICEWIDTH-20, 40)];
//    view.backgroundColor=[UIColor whiteColor];
    _tableView.tableFooterView=view;
    
    
    
    
    UIButton * button=[[UIButton alloc]initWithFrame:CGRectMake(10, 10, 109, 17)];
    [button setTitle:@"+ 添加银行卡" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [view addSubview:button];
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark ---创建背景图片
-(UIImageView *)backImageView
{
    if(_backImageView==nil){
        _backImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 64, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
        _backImageView.image=[UIImage imageNamed:@"background"];
    }
    return _backImageView;
}
@end
