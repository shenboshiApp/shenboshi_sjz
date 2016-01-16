//
//  personCentreView.m
//  shenBoShi
//
//  Created by 开发2 on 15/12/26.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import "personCentreView.h"
#import "personCentreCell.h"
#import "alterCell.h"
#import "myMessageCell.h"
#import "myDoctorCell.h"
#import "informationDetailViewController.h"
#import "UIView+UIViewController.h"
#import "MyquestionViewController.h"
#import "MyDoctorViewController.h"
@implementation personCentreView
{
    UITableView * _tableView;
    
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame] ) {
        [self addSubview:self.bottomView];
//      
        [self createTableView];
       
    }
    return self;
    
}
#pragma mark ---创建tableView
-(void)createTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, KDEVICEWIDTH,KDEVICEHEIGHT-64) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.separatorColor=[UIColor clearColor];
    _tableView.backgroundColor=[UIColor clearColor];
    _tableView.sectionIndexTrackingBackgroundColor=[UIColor clearColor];
    [[UITableViewHeaderFooterView appearance] setTintColor:[UIColor clearColor]];
    [self addSubview:_tableView];
    
}
#pragma mark ---tableview的代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0){
        return (KDEVICEHEIGHT-KDEVICEHEIGHT*(926.0/1704))*(250.0/650);
    }else{
        return (KDEVICEHEIGHT-KDEVICEHEIGHT*(926.0/1704))*(200.0/650);
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    
    if(section==0){
        return KDEVICEHEIGHT*(40/1704.0);
    }
    if(section==1){
        return KDEVICEHEIGHT*(156/1704.0);
    }
    if(section==2){
        return KDEVICEHEIGHT*(51/1704.0);
    }
    if(section==3){
        return KDEVICEHEIGHT*(51/1704.0);
    }
    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==1){
    informationDetailViewController * detail=[[informationDetailViewController alloc]init];
        [self.viewController.navigationController pushViewController:detail animated:YES];
    }
    if (indexPath.section == 2) {
        MyquestionViewController *myQuestion = [[MyquestionViewController alloc] init];
        [self.viewController.navigationController pushViewController:myQuestion animated:YES];
    }
    if (indexPath.section == 3) {
        MyDoctorViewController *myDoctor = [[MyDoctorViewController alloc] init];
        [self.viewController.navigationController pushViewController:myDoctor animated:YES];
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section==0){
   personCentreCell * cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell==nil){
        cell=[[personCentreCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.backgroundColor=[UIColor whiteColor];
    cell.headImageView.image=[UIImage imageNamed:@"flower"];
      
        return cell;
    }
    if(indexPath.section==1){
        alterCell * alCell=[tableView dequeueReusableCellWithIdentifier:@"alterCell"];
        if(!alCell){
            alCell=[[alterCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"alterCell"];
        }
        UIImageView * backImageView=[[UIImageView alloc]initWithFrame:alCell.bounds];
        backImageView.image=[UIImage imageNamed:@"white-background2"];
        alCell.backgroundView=backImageView;
        alCell.headImageView.image=[UIImage imageNamed:@"bianji"];
        alCell.selectionStyle=UITableViewCellSelectionStyleNone;
        return alCell;
    }
    if(indexPath.section==2){
    myMessageCell * myCell=[tableView dequeueReusableCellWithIdentifier:@"ID"];
    if(!myCell){
        myCell=[[myMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
        UIImageView * backImageView=[[UIImageView alloc]initWithFrame:myCell.bounds];
        backImageView.image=[UIImage imageNamed:@"white-background2"];
       myCell.backgroundView=backImageView;
    myCell.headImageView.image=[UIImage imageNamed:@"wodexiaoxi"];
        myCell.selectionStyle=UITableViewCellSelectionStyleNone;
    return myCell;
    }
    
    myDoctorCell * docCell=[tableView dequeueReusableCellWithIdentifier:@"DocCell"];
    if(!docCell){
        docCell=[[myDoctorCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DocCell"];
    }
    UIImageView * backImageView=[[UIImageView alloc]initWithFrame:docCell.bounds];
    backImageView.image=[UIImage imageNamed:@"white-background2"];
    docCell.backgroundView=backImageView;
    docCell.headImageView.image=[UIImage imageNamed:@"wodeyisheng"];
    docCell.selectionStyle=UITableViewCellSelectionStyleNone;
    return docCell;
}

#pragma mark ---背景图
-(UIImageView *)bottomView
{
    if (_bottomView == nil) {
        _bottomView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
        [_bottomView setImage:[UIImage imageNamed:@"background"]];
    }
    return _bottomView;
}












@end
