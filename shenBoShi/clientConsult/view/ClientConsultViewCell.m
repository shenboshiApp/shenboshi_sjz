//
//  ClientConsultViewCell.m
//  shenBoShi
//
//  Created by 开发4 on 15/12/30.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import "ClientConsultViewCell.h"

@implementation ClientConsultViewCell


- (void)awakeFromNib {
    // Initialization code
    
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.iconImageView];
        [self addSubview:self.nameLable];
        [self addSubview:self.detailLable];
        [self addSubview:self.deleteButton];
        [self addSubview:self.replyButton];
        [self addSubview:self.bottomLine];
    }
    
    return self;
}

//- (UIImageView *)iconImageView
//{
//    if (_iconImageView == nil) {
//        _iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 7, 54, 54)];
//        _iconImageView.image = [UIImage imageNamed:@"flower"];
//    }
//    return _iconImageView;
//}

- (UILabel *)nameLable
{
    if (_nameLable == nil) {
        _nameLable = [[UILabel alloc]initWithFrame:CGRectMake(20, 5, KDEVICEWIDTH-40, 80)];
//        _nameLable.backgroundColor = [UIColor redColor];
//        NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:@"预约穆大力主任"];
//        [attributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0/255.0 green:162/255.0 blue:255/255.0 alpha:1.0] range:NSMakeRange(2, 3)];
//        _nameLable.attributedText = attributedStr;
        _nameLable.numberOfLines = 0;
//        [_nameLable sizeToFit];
        _nameLable.font = [UIFont systemFontOfSize:12];
    }
    return _nameLable;
}
//- (UILabel *)detailLable
//{
//    if (_detailLable == nil) {
//        _detailLable = [[UILabel alloc]initWithFrame:CGRectMake(81, 39, 208 * A_WIDTH, 11)];
//        NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:@"尿蛋白3+ 潜血1+ 肌酐335 血压180/90 ......"];
//        [attributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0/255.0 green:162/255.0 blue:255/255.0 alpha:1.0] range:NSMakeRange(0, 3)];
//        [attributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0/255.0 green:162/255.0 blue:255/255.0 alpha:1.0] range:NSMakeRange(6, 2)];
//        [attributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0/255.0 green:162/255.0 blue:255/255.0 alpha:1.0] range:NSMakeRange(11, 2)];
//        [attributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0/255.0 green:162/255.0 blue:255/255.0 alpha:1.0] range:NSMakeRange(17, 2)];
//        _detailLable.attributedText = attributedStr;
//        
//        _detailLable.font = [UIFont systemFontOfSize:11];
//    }
//    return _detailLable;
//}
//添加删除按钮
//- (UIButton *)deleteButton
//{
//    if (_deleteButton == nil) {
//        _deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        _deleteButton.frame = CGRectMake(235 * A_WIDTH, 55, 33, 10);
//        [_deleteButton setImage:[UIImage imageNamed:@"shanchu"] forState:UIControlStateNormal];
//        _deleteButton.titleLabel.font = [UIFont systemFontOfSize:9];
//        [_deleteButton setTitle:@"删除" forState:UIControlStateNormal];
//        [_deleteButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [_deleteButton addTarget:self action:@selector(deleteClick:) forControlEvents:UIControlEventTouchUpInside];
//        
//        
//        
//    }
//    return _deleteButton;
//}
////添加回复按钮
//- (UIButton *)replyButton
//{
//    if (_replyButton == nil) {
//        _replyButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        _replyButton.frame = CGRectMake(268 * A_WIDTH, 55, 33, 10);
//        [_replyButton setImage:[UIImage imageNamed:@"huifu"] forState:UIControlStateNormal];
//        _replyButton.titleLabel.font = [UIFont systemFontOfSize:9];
//        [_replyButton setTitle:@"回复" forState:UIControlStateNormal];
//        [_replyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [_replyButton addTarget:self action:@selector(replyClick:) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _replyButton;
//}
//按钮的点击事件
- (void)deleteClick:(UIButton *)button
{

}
- (void)replyClick:(UIButton *)button
{

}
- (UIView *)bottomLine
{
    _bottomLine = [[UIView alloc]initWithFrame:CGRectMake(20, 90, KDEVICEWIDTH - 40, 1)];
    _bottomLine.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:234/255.0 alpha:1.0];
    return _bottomLine;
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
