//
//  ClientConsultViewCell.h
//  shenBoShi
//
//  Created by 开发4 on 15/12/30.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClientConsultViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *nameLable;
@property (nonatomic, strong) UILabel *detailLable;
@property (nonatomic, strong) UIButton *deleteButton;
@property (nonatomic, strong) UIButton *replyButton;
@property (nonatomic, strong) UIView *bottomLine;
@end
