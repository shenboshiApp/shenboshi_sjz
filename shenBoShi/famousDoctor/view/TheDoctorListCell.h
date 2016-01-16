//
//  TheDoctorListCell.h
//  shenBoShi
//
//  Created by 开发5 on 15/12/26.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Doctor.h"

@interface TheDoctorListCell : UITableViewCell

@property(nonatomic,strong)UIImageView *imagelabel;
@property(nonatomic,strong)UILabel *namelabel1;
@property(nonatomic,strong)UILabel *zhiChengLabel;
@property(nonatomic,strong)UILabel *jianJieLabel;
@property(nonatomic,strong)UILabel *nameLabel2;
@property(nonatomic,strong)UIImageView *buttonImage;
@property(nonatomic,strong)UILabel *xianLabel;

@property(nonatomic,strong)Doctor *doctor;

@end
