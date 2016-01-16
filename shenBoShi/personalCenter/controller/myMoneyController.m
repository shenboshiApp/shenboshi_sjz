//
//  ViewController.m
//  cell
//
//  Created by 开发2 on 16/1/10.
//  Copyright © 2016年 开发2. All rights reserved.
//

#import "myMoneyController.h"
#import "consultPatientController.h"
#import "expertInformationController.h"
#import "bankCardController.h"
@interface myMoneyController ()
{
    UITableView * _tableView;
    
    //姓名和电话
    UILabel * _nameLabel;
    UILabel * _telLabel;
    //编辑
    UILabel * _bianjiLabel;
    
    NSString * _name;
    NSString * _tel;
    
    
}
@end

@implementation myMoneyController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    [self.view addSubview:self.backImageView];
    [self createNav];
    [self createTable];
    _name=@"姓名：穆大力";
    _tel=@"电话：13722786896";
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)createNav{
//导航栏题目
UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 80, 10)];
label.text = @"我的钱包";
label.textColor = [UIColor whiteColor];
label.font = [UIFont fontWithName:@"Arial-BoldMT" size:18];
label.textAlignment = NSTextAlignmentCenter;
self.navigationItem.titleView = label;


//导航栏左侧按钮
    UIImage *backImage = [UIImage imageNamed:@"back@3x"];
    backImage = [backImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:backImage style:(UIBarButtonItemStylePlain) target:self action:@selector(backButton)];
    

//self.navigationItem.leftBarButtonItem=leftItem;
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
#pragma mark ---tableView的代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==0){
        return 165;
    }
    
    return 100;
    
}
//点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row==2){
        
        
        bankCardController *bankVC = [[bankCardController alloc] init];
        [self.navigationController pushViewController:bankVC animated:YES];
        
    }
   
    
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.backgroundColor=[UIColor clearColor];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    if(indexPath.row==0){
        UIImageView * backView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 13, [[UIScreen mainScreen]bounds].size.width, 100)];
        backView.image=[UIImage imageNamed:@"whitebackground"];
        [cell.contentView addSubview:backView];
//        cell.backgroundColor=[UIColor yellowColor];
        UIImageView * headImageView=[[UIImageView alloc]initWithFrame:CGRectMake(17, 12, 65, 65)];
        headImageView.image=[UIImage imageNamed:@"flower"];
        [backView addSubview:headImageView];
        
        
        _nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(104, 25, 140, 14)];
        _nameLabel.text=_name;
        
        _nameLabel.font = [UIFont fontWithName:@"Helvetica-light" size:14];
        [backView addSubview:_nameLabel];
        
        _telLabel=[[UILabel alloc]initWithFrame:CGRectMake(104, 48, 200, 14)];
        _telLabel.text=_tel;
        _telLabel.font=[UIFont fontWithName:@"Helvetica-light" size:14];
        [backView addSubview:_telLabel];
        
        
    }
    
    
    UIImageView * backView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, 80)];
    
    [cell.contentView addSubview:backView];
    
    if (indexPath.row==1||indexPath.row==2) {
        NSArray * nameArr=@[@"",@"我的收益",@"银行卡"];
        NSArray * imageArr=@[@"",@"wodeshouyi",@"card"];
        backView.image=[UIImage imageNamed:@"white-background2"];
        UIImageView * headImageView=[[UIImageView alloc]initWithFrame:CGRectMake(22, 25, 35, 35)];
        headImageView.image=[UIImage imageNamed:imageArr[indexPath.row]];
        [backView addSubview:headImageView];
        
        if(indexPath.row==1){
            UILabel *moneyLabel = [[UILabel alloc] initWithFrame:CGRectMake(KDEVICEWIDTH - 70, (86.0/200)*(KDEVICEHEIGHT-KDEVICEHEIGHT*(926.0/1704))*(200.0/650), 70, (28.0/200)*(KDEVICEHEIGHT-KDEVICEHEIGHT*(926.0/1704))*(200.0/650))];
            
            moneyLabel.text = @"￥0.00";
            moneyLabel.font = [UIFont systemFontOfSize:12];
            moneyLabel.textAlignment = NSTextAlignmentLeft;
            [cell.contentView addSubview:moneyLabel];
        }
        
        
        _bianjiLabel=[[UILabel alloc]initWithFrame:CGRectMake(102, 35, 150, 14)];
        _bianjiLabel.text=nameArr[indexPath.row];
        _bianjiLabel.font = [UIFont fontWithName:@"Helvetica-light" size:14];
        [backView addSubview:_bianjiLabel];
//        cell.backgroundColor=[UIColor redColor];
    }
    
    
    
    return cell;
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
