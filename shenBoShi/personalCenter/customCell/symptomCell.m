//
//  symptomCell.m
//  shenBoShi
//
//  Created by 开发2 on 15/12/29.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import "symptomCell.h"

@implementation symptomCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        [self createCell];
        
    }
    
    return self;
    
    
}
-(void)createCell
{
//    UILabel * symLabel=[[UILabel alloc]init];
//    symLabel.text=[NSString stringWithFormat:@"%@:%@",@"       主要症状",@"肾炎综合征是指血尿、蛋白尿、高血压、水肿为表现的一组综合征，有时亦可以见到肌酐升高、少尿等，常见于急性肾小球肾炎、急进型肾小球肾炎等。主要是以肾小球炎性病变、基底膜及足细胞结构紊乱为特点的一组疾病，肾炎综合征并不等于肾病综合征，一般而言肾炎综合征以血尿为主要表现，蛋白尿一般小于3.5g/天，高血压，水肿可以不明显。而肾病综合征主要大量蛋白尿、低蛋白血症、高血脂，水肿为主要表现，可无血尿或血尿表现轻微。"];
//    symLabel.backgroundColor=[UIColor yellowColor];
//    symLabel.numberOfLines=0;
//    symLabel.lineBreakMode=NSLineBreakByWordWrapping;
//    symLabel.font=[UIFont fontWithName:@"Helvetica-light" size:13];
//    self.sympLabel=symLabel;
//    [self.contentView addSubview:self.sympLabel];
    
//    
//    for(int i=0;i<3;i++){
//        UIView * line1=[[UIView alloc]initWithFrame:CGRectMake(26, i*35, 264, 1)];
//        line1.backgroundColor=RGB(179, 179, 179, 0.5);
//        self.lineView=line1;
//        [self.contentView addSubview:self.lineView];
//        //
//    }
//    
//    UIView * line4=[[UIView alloc]initWithFrame:CGRectMake(26, 35*3+2, 264, 1)];
//    line4.backgroundColor=RGB(179, 179, 179, 0.5);
//    self.lineView=line4;
//    [self.contentView addSubview:self.lineView];
//    
//    UIView * line5=[[UIView alloc]initWithFrame:CGRectMake(26, 35*4+4, 264, 1)];
//    line5.backgroundColor=RGB(179, 179, 179, 0.5);
//    self.lineView=line5;
//    [self.contentView addSubview:self.lineView];
//    
//    
//    UIView * line6=[[UIView alloc]initWithFrame:CGRectMake(26, 35*5+6, 264, 1)];
//    line6.backgroundColor=RGB(179, 179, 179, 0.5);
//    self.lineView=line6;
//    [self.contentView addSubview:self.lineView];
//    
//    UIView * line7=[[UIView alloc]initWithFrame:CGRectMake(26, 35*6+7, 264, 1)];
//    line7.backgroundColor=RGB(179, 179, 179, 0.5);
//    self.lineView=line7;
//    [self.contentView addSubview:self.lineView];
//    
//    
//    UIView * line8=[[UIView alloc]initWithFrame:CGRectMake(26, 35*7+9, 264, 1)];
//    line8.backgroundColor=RGB(179, 179, 179, 0.5);
//    self.lineView=line8;
//    [self.contentView addSubview:self.lineView];
//    
//    UIView * line9=[[UIView alloc]initWithFrame:CGRectMake(26, 35*8+13, 264, 1)];
//    line9.backgroundColor=RGB(179, 179, 179, 0.5);
//    self.lineView=line9;
//    [self.contentView addSubview:self.lineView];
//    
//    
//    UIView * line10=[[UIView alloc]initWithFrame:CGRectMake(26, 35*9+15, 264, 1)];
//    line10.backgroundColor=RGB(179, 179, 179, 0.5);
//    self.lineView=line10;
//    [self.contentView addSubview:self.lineView];
//    
//    UIView * line11=[[UIView alloc]initWithFrame:CGRectMake(26, 35*10+18, 264, 1)];
//    line11.backgroundColor=RGB(179, 179, 179, 0.5);
//    self.lineView=line11;
//    [self.contentView addSubview:self.lineView];
//    
//    
//    UIView * line12=[[UIView alloc]initWithFrame:CGRectMake(26, 35*11+18, 264, 1)];
//    line12.backgroundColor=RGB(179, 179, 179, 0.5);
//    self.lineView=line12;
//    [self.contentView addSubview:self.lineView];
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
