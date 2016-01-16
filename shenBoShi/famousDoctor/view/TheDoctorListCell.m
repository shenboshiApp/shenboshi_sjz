//
//  TheDoctorListCell.m
//  shenBoShi
//
//  Created by 开发5 on 15/12/26.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import "TheDoctorListCell.h"

@implementation TheDoctorListCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self ctreatMyView];
    }
    return self;
}


-(void)ctreatMyView
{
    self.imagelabel = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imagelabel];
    
    self.namelabel1 = [[UILabel alloc] init];
    [self.contentView addSubview:self.namelabel1];
    
    self.zhiChengLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.zhiChengLabel];
    
    self.jianJieLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.jianJieLabel];
    
    self.nameLabel2 = [[UILabel alloc] init];
    [self.contentView addSubview:self.nameLabel2];
    
    self.buttonImage = [[UIImageView alloc] init];
    [self.contentView addSubview:self.buttonImage];
    
    self.xianLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.xianLabel];
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imagelabel.frame = CGRectMake(KDEVICEWIDTH/320 * 33.3, KDEVICEHEIGHT/568 * 9, 71, 71);
    self.imagelabel.image = [UIImage imageNamed:@"photo@3x"];
    //self.imagelabel.backgroundColor = [UIColor redColor];
    
    self.namelabel1.frame = CGRectMake(KDEVICEWIDTH/320 * 120.7, KDEVICEHEIGHT/568 * 25, 200, 10);
    self.namelabel1.text = @"穆大力  主任医师";
    self.namelabel1.font = [UIFont systemFontOfSize:15];
    
    self.jianJieLabel.frame = CGRectMake(KDEVICEWIDTH/320 * 120.7, B_HIGHT * 45, KDEVICEWIDTH - 120.7 * A_WIDTH - 53.3 * A_WIDTH, 40);
    self.jianJieLabel.text = @"简介：长期从事中医药防治肾脏病的临床与实验研究，具备扎实的中医临床实践基础，熟练应用现代肾脏疾病的诊疗技术结合";
    self.jianJieLabel.textColor = [UIColor colorWithRed:148/255.0 green:148/255.0 blue:148/255.0 alpha:1];
    self.jianJieLabel.font = [UIFont systemFontOfSize:10];
   
    //设置lable行间距
    NSMutableAttributedString *attributedsString = [[NSMutableAttributedString alloc] initWithString:self.jianJieLabel.text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:4];
    [attributedsString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self.jianJieLabel.text length])];
    self.jianJieLabel.attributedText = attributedsString;
    
    self.jianJieLabel.lineBreakMode =  NSLineBreakByTruncatingTail;
    
    self.jianJieLabel.numberOfLines = 2;
//    [self.jianJieLabel sizeToFit];
//    self.jianJieLabel.backgroundColor = [UIColor redColor];
    
    self.nameLabel2.frame = CGRectMake(KDEVICEWIDTH/320 * 49.3,  B_HIGHT* 80, 60, 15);
    self.nameLabel2.font = [UIFont systemFontOfSize:12];
    self.nameLabel2.textColor = [UIColor colorWithRed:148/255.0 green:148/255.0 blue:148/255.0 alpha:1];
    self.nameLabel2.text = @"穆大力";
//    self.nameLabel2.backgroundColor = [UIColor redColor];
    
    self.buttonImage.frame = CGRectMake(KDEVICEWIDTH - 42, KDEVICEHEIGHT/568 * 59.4, 15, 10);
    self.buttonImage.image = [UIImage imageNamed:@"enter@3x"];
//    self.buttonImage.backgroundColor = [UIColor redColor];
    
    self.xianLabel.frame = CGRectMake(20, 106, KDEVICEWIDTH-30, 2);
    self.xianLabel.text = @"------------------------------------------------------";
    self.xianLabel.textColor = [UIColor colorWithRed:148/255.0 green:148/255.0 blue:148/255.0 alpha:1];
 //   self.xianLabel.backgroundColor = [UIColor redColor];
    
    
}

-(void)setDoctor:(Doctor *)doctor
{
    self.imagelabel.image = [UIImage imageNamed:doctor.image];
    self.namelabel1.text = doctor.name1;
    self.zhiChengLabel.text = doctor.zhiCheng;
    self.jianJieLabel.text = doctor.jianjie;
    self.nameLabel2.text = doctor.name2;
    self.buttonImage.image = [UIImage imageNamed:doctor.button];
}

- (void)awakeFromNib {
    
    
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
