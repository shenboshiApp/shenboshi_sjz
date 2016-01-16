//
//  QuestionTableViewCell.h
//  shenBoShi
//
//  Created by 开发5 on 15/12/31.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h"

@interface QuestionTableViewCell : UITableViewCell

//@property(nonatomic,strong)UIImageView *bgView;
@property(nonatomic,strong)UIImageView *iconImage;
@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UILabel *ziXunLabel;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *questionLabel;
@property(nonatomic,strong)UILabel *xianLabel;

@property(nonatomic,strong)Question *question;

@end
