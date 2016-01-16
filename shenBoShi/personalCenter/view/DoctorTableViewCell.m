//
//  DoctorTableViewCell.m
//  shenBoShi
//
//  Created by 开发5 on 16/1/1.
//  Copyright © 2016年 开发3-lyp. All rights reserved.
//

#import "DoctorTableViewCell.h"

@implementation DoctorTableViewCell

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
    self.imageIcon = [[UIImageView alloc] init];
    [self.contentView addSubview:self.imageIcon];
    
    self.moreimage = [[UIImageView alloc] init];
    [self.contentView addSubview:self.moreimage];

    self.nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.nameLabel];
    
    self.zhiChengLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.zhiChengLabel];

    self.xianLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.xianLabel];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageIcon.frame = CGRectMake(20, 12, 60, 60);
    self.imageIcon.image = [UIImage imageNamed:@"flower"];
    
    self.nameLabel.frame = CGRectMake(106, 25, 85, 14);
    self.nameLabel.text = @"姓名：穆大力";
    self.nameLabel.font = [UIFont systemFontOfSize:14];
    
    self.zhiChengLabel.frame = CGRectMake(106, 49, 98, 15);
    self.zhiChengLabel.text = @"职称：主任医师";
    self.zhiChengLabel.font = [UIFont systemFontOfSize:14];

    
    self.moreimage.frame = CGRectMake(294, 37, 10, 10);
    self.moreimage.image = [UIImage imageNamed:@"iconfont-gengduo-2"];
    
    self.xianLabel.frame = CGRectMake(20, 77, KDEVICEWIDTH-40, 1);
    self.xianLabel.backgroundColor = [UIColor blackColor];
    
}

-(void)setDoctor:(Doctor *)doctor
{
    self.imageIcon.image = [UIImage imageNamed:doctor.image];
    self.nameLabel.text = doctor.name;
    self.zhiChengLabel.text = doctor.zhiCheng;
    self.moreimage.image = [UIImage imageNamed:doctor.more];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
