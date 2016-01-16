//
//  consult.m
//  shenBoShi
//
//  Created by 开发2 on 16/1/11.
//  Copyright © 2016年 开发3-lyp. All rights reserved.
//

#import "consult.h"

@implementation consult
{
    UIScrollView *  _scrollView;
}
-(instancetype)initWithFrame:(CGRect)frame 

{
    self=[super initWithFrame:frame];
    if(self){
        [self addSubview:self.backImageView];
        
       //创建scrollView
        [self createScrollView];
        
        
    }
    return self;
}


#pragma mark ---创建scrollView
-(void)createScrollView{
    
    _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, KDEVICEWIDTH, KDEVICEHEIGHT-64)];
    _scrollView.backgroundColor=[UIColor clearColor];
    _scrollView.contentSize=CGSizeMake(KDEVICEWIDTH, 2*KDEVICEHEIGHT);
    _scrollView.showsVerticalScrollIndicator=NO;
    [self addSubview:_scrollView];
    
}

#pragma mark ---重写setter方法
- (void)setTextString:(NSString *)textString
{
    if (_textString != textString ) {
        _textString = textString;
        
    }
}
-(void)setSymptomString:(NSString *)symptomString
{
    if(_symptomString!=symptomString){
        _symptomString=symptomString;
        //创建UI
         [self createUI];
       
    }
    
}
#pragma mark ---创建UI
-(void)createUI
{
    //姓名
    UILabel * nameLabel=[[UILabel alloc]initWithFrame:CGRectMake(30, 30*B_HIGHT, 200*A_WIDTH, 12)];
    nameLabel.text=self.textString;
    nameLabel.font = [UIFont systemFontOfSize:12];
    [_scrollView addSubview:nameLabel];
    //病情描述
    UILabel * symptomLabel=[[UILabel alloc]initWithFrame:CGRectMake(30, 43*B_HIGHT+11, KDEVICEWIDTH-65, 60)];
    symptomLabel.text=self.symptomString;
    symptomLabel.font = [UIFont systemFontOfSize:12];
    symptomLabel.numberOfLines=0;
    symptomLabel.lineBreakMode=NSLineBreakByWordWrapping;
    NSString * string=symptomLabel.text;
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:string];
    NSUInteger length = [string length];
    NSMutableParagraphStyle *
    style = [[NSMutableParagraphStyle alloc]init];
    //行间距
    style.lineSpacing=13;
    [attrString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, length)];
    symptomLabel.attributedText=attrString;
    [_scrollView addSubview:symptomLabel];
    //预约时间
    UIButton * yuYueBtn=[[UIButton alloc]initWithFrame:CGRectMake(30,63*B_HIGHT+11+60 , 70*A_WIDTH, 19)];
    [yuYueBtn setBackgroundImage:[UIImage imageNamed:@"yuyueshijian"] forState:UIControlStateNormal];
    [yuYueBtn setTitle:@"预约时间" forState:UIControlStateNormal];
    yuYueBtn.titleLabel.font=[UIFont systemFontOfSize:12];
    [_scrollView addSubview:yuYueBtn];
    [yuYueBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    //预约时间的展示
    UILabel * timeLabel=[[UILabel alloc]initWithFrame:CGRectMake(30+80*A_WIDTH, 63*B_HIGHT+11+60, 180*A_WIDTH, 19)];
    timeLabel.layer.cornerRadius=5;
    timeLabel.layer.masksToBounds=YES;
    timeLabel.layer.borderColor=RGB(53, 170, 170, 0.8).CGColor;
    timeLabel.layer.borderWidth=1;
    [_scrollView addSubview:timeLabel];
    //中间线1
    UIView * line1=[[UIView alloc]initWithFrame:CGRectMake(30,80*B_HIGHT+11+60+19, 130*A_WIDTH, 1)];
    line1.backgroundColor=RGB(200, 200, 200, 1);
    [_scrollView addSubview:line1];
    //提交时间
    UILabel * tijiaoLabel=[[UILabel alloc]initWithFrame:CGRectMake(130*A_WIDTH+30,74*B_HIGHT+11+60+19, 70, 13)];
    tijiaoLabel.text=@"2016-1-10";
    tijiaoLabel.font=[UIFont systemFontOfSize:14];
    tijiaoLabel.textColor=RGB(169, 169, 169, 1);
    [_scrollView addSubview:tijiaoLabel];
    

    //中间线2
    UIView * line2=[[UIView alloc]initWithFrame:CGRectMake(130*A_WIDTH+30+70,80*B_HIGHT+11+60+19 , KDEVICEWIDTH-(130*A_WIDTH+130), 1)];
    line2.backgroundColor=RGB(200, 200, 200, 1);
    [_scrollView addSubview:line2];

    
    //提交Button
    UIButton * tijiaoButton=[[UIButton alloc]initWithFrame:CGRectMake(30, KDEVICEHEIGHT-240*B_HIGHT, KDEVICEWIDTH-60, 30*B_HIGHT)];
    [tijiaoButton setBackgroundImage:[UIImage imageNamed:@"tijiao-"] forState:UIControlStateNormal];
    [tijiaoButton setTitle:@"提交" forState:UIControlStateNormal];
    tijiaoButton.titleLabel.font=[UIFont systemFontOfSize:12];
    [_scrollView addSubview:tijiaoButton];
    [tijiaoButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
}
//预约时间的点击方法
-(void)btnClick
{
    NSLog(@"预约时间");
}
//提交点击方法
-(void)buttonClick
{
    NSLog(@"提交");
}
-(UIImageView *)backImageView
{
    if(_backImageView==nil){
        _backImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 64, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height-64)];
        _backImageView.image=[UIImage imageNamed:@"background"];
    }
    return _backImageView;
}
@end
