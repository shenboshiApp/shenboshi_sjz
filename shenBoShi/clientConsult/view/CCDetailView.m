//
//  CCDetailView.m
//  shenBoShi
//
//  Created by 开发4 on 16/1/1.
//  Copyright © 2016年 开发3-lyp. All rights reserved.
//

#import "CCDetailView.h"

@implementation CCDetailView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self addSubview:self.doctorIntroduction];
        [self addSubview:self.clientIntroduction];
    }
    return self;
}
//医生介绍
- (UIView *)doctorIntroduction
{
    if (_doctorIntroduction == nil) {
        _doctorIntroduction = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KDEVICEWIDTH, 217)];
        UIImageView *doctorImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 13, 87, 87)];
        doctorImageView.image = [UIImage imageNamed:@"mudali"];
        [_doctorIntroduction addSubview:doctorImageView];
        
        UILabel *doctorLable = [[UILabel alloc]initWithFrame:CGRectMake(122, 25, 188, 70)];
        doctorLable.numberOfLines = 0;
        doctorLable.text = @"穆大力\n职称：主任医师\n格言：看着每一个肾病患者康复出院，那是我最有满足感的时候。";
        doctorLable.font = [UIFont systemFontOfSize:12.0];
        [_doctorIntroduction addSubview:doctorLable];
        
        UILabel *doctorDetailLable = [[UILabel alloc]initWithFrame:CGRectMake(21, 122, KDEVICEWIDTH -21 -24, 77)];
        doctorDetailLable.numberOfLines = 0;
        doctorDetailLable.font = [UIFont systemFontOfSize:11.0];
        doctorDetailLable.text = @"简介：穆大力，男，河北省优秀中医临床人才\n在国家十一五重点肾病专科临床验证工作中，负责慢性肾衰的临床验证。病例总结，数据处理和资料上报工作，受到了慢性肾衰协作组组长单位的好评。主治急慢性肾小球肾炎肾功能衰竭，各种全身性系统疾病的肾损害。";
        [_doctorIntroduction addSubview:doctorDetailLable];
    }
    return _doctorIntroduction;
}
//患者介绍
- (UIView *)clientIntroduction
{
    if (_clientIntroduction == nil) {
        
        _clientIntroduction = [[UIView alloc]initWithFrame:CGRectMake(0, 217, KDEVICEWIDTH, 248)];
        
        //姓名
        UILabel *nameLable = [[UILabel alloc]initWithFrame:CGRectMake(29, 31, KDEVICEWIDTH -58, 30)];
        nameLable.text = @"姓名：张**          时间：2015-12-23";
        nameLable.font = [UIFont systemFontOfSize:11.0];
        UIView *nameLine = [[UIView alloc]initWithFrame:CGRectMake(0, 29, KDEVICEWIDTH -58, 1)];
        nameLine.backgroundColor = [UIColor colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1.0];
        [nameLable addSubview:nameLine];
        [_clientIntroduction addSubview:nameLable];
        
        //病理类型
        UILabel *styleLable = [[UILabel alloc]initWithFrame:CGRectMake(29, 60, KDEVICEWIDTH -58, 33)];
        styleLable.text = @"病理类型：慢性肾炎";
        styleLable.font = [UIFont systemFontOfSize:11.0];
        [_clientIntroduction addSubview:styleLable];
        UIView *stytleLine = [[UIView alloc]initWithFrame:CGRectMake(0, 33, KDEVICEWIDTH -58, 1)];
        stytleLine.backgroundColor = [UIColor  colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1.0];
        [styleLable addSubview:stytleLine];
        
        //主要症状
        UILabel *symptomLable = [[UILabel alloc]initWithFrame:CGRectMake(29, 93, KDEVICEWIDTH-58, 52)];
        symptomLable.numberOfLines = 0;
        //symptomLable.textAlignment =
        symptomLable.font = [UIFont systemFontOfSize:11.0];
        symptomLable.text = @"主要症状：尿蛋白3+，潜血1+，肌酐335，血压180/90，有腰酸、腰疼的感觉，小腿有浮肿。现在服用金水宝、保肾康。";
        
        //symptomLable.baselineAdjustment = UIBaselineAdjustmentNone;
        [_clientIntroduction addSubview:symptomLable];
        
        //添加四周的线
        UIView *topLine = [[UIView alloc]initWithFrame:CGRectMake(20, 22, KDEVICEWIDTH -40, 1)];
        topLine.backgroundColor = [UIColor  colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1.0];
        [_clientIntroduction addSubview:topLine];
        
        UIView *leftLine = [[UIView alloc]initWithFrame:CGRectMake(20, 22, 1, 209)];
        leftLine.backgroundColor = [UIColor  colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1.0];
        [_clientIntroduction addSubview:leftLine];
        
        UIView *rightLine = [[UILabel alloc]initWithFrame:CGRectMake(KDEVICEWIDTH -20, 22, 1, 209)];
        rightLine.backgroundColor = [UIColor  colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1.0];
        [_clientIntroduction addSubview:rightLine];
        
        UIView *bottomLine = [[UILabel alloc]initWithFrame:CGRectMake(20, 231, KDEVICEWIDTH -40, 1)];
        bottomLine.backgroundColor = [UIColor  colorWithRed:216/255.0 green:216/255.0 blue:216/255.0 alpha:1.0];
        [_clientIntroduction addSubview:bottomLine];
        
    }
    return _clientIntroduction;
}

@end
