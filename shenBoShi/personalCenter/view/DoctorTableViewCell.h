//
//  DoctorTableViewCell.h
//  shenBoShi
//
//  Created by 开发5 on 16/1/1.
//  Copyright © 2016年 开发3-lyp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Doctor.h"

@interface DoctorTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *imageIcon;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *zhiChengLabel;
@property(nonatomic,strong)UIImageView *moreimage;
@property(nonatomic,strong)UILabel *xianLabel;


@property(nonatomic,strong)Doctor *doctor;

@end
