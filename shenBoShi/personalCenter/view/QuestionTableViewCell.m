//
//  QuestionTableViewCell.m
//  shenBoShi
//
//  Created by 开发5 on 15/12/31.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import "QuestionTableViewCell.h"

@implementation QuestionTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatMyView];
    }
    return self;
}

-(void)creatMyView
{
//    self.bgView = [[UIImageView alloc] init];
//    [self.contentView addSubview:self.bgView];
    
    self.iconImage = [[UIImageView alloc] init];
    [self.contentView addSubview:self.iconImage];

    self.timeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.timeLabel];
    
    self.ziXunLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.ziXunLabel];
    
    self.nameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.nameLabel];
    
    self.questionLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.questionLabel];
    
    self.xianLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.xianLabel];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
//    _bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
//    _bgView.frame = CGRectMake(0, 0, KDEVICEWIDTH, KDEVICEHEIGHT);
//    [self.contentView addSubview:_bgView];

    
    self.iconImage.frame = CGRectMake(20, 21, 6, 6);
    self.iconImage.image = [UIImage imageNamed:@"square"];
    
    self.timeLabel.frame = CGRectMake(35, 17, 84, 15);
    self.timeLabel.text = @"2015/12/23";
    self.timeLabel.font = [UIFont systemFontOfSize:13];
//    self.timeLabel.backgroundColor = [UIColor redColor];
    
    self.ziXunLabel.frame = CGRectMake(KDEVICEWIDTH - 130, 17, 110 , 15);
    self.ziXunLabel.text = @"咨询医生穆大力";
    self.ziXunLabel.font = [UIFont systemFontOfSize:15];
//    self.ziXunLabel.backgroundColor = [UIColor redColor];
    
    self.questionLabel.frame = CGRectMake(20, 51, KDEVICEWIDTH - 40, 88);
    self.questionLabel.text = @"昨天去体检，体检报告上显示尿蛋白3+、潜血1+、血压180/90、脸部和腿部有浮肿，像这样的情况严重吗？到底是怎么回事？";
    self.questionLabel.numberOfLines = 0;
    [self.questionLabel sizeToFit];
//    self.questionLabel.backgroundColor = [UIColor redColor];
    
    self.xianLabel.frame = CGRectMake(20, 157, 279 * A_WIDTH, 1);
    self.xianLabel.backgroundColor = [UIColor colorWithRed:222/255.0 green:222/255.0 blue:222/255.0 alpha:1];

}

-(void)setQuestion:(Question *)question
{
    self.iconImage.image = [UIImage imageNamed:@"square"];
    self.timeLabel.text = question.time;
    self.ziXunLabel.text = question.ziXun;
    self.questionLabel.text = question.question;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
