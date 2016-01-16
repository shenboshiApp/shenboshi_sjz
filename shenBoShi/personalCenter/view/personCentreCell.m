//
//  personCentreCell.m
//  shenBoShi
//
//  Created by 开发2 on 15/12/27.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import "personCentreCell.h"

@implementation personCentreCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        [self createCell];
        
    }
    
    return self;
    
    
}

#pragma mark ---创建cell
-(void)createCell
{
    //头像
    UIImageView * hImageView=[[UIImageView alloc]initWithFrame:CGRectMake((50.0/960)*KDEVICEWIDTH,(45.0/250)*(KDEVICEHEIGHT-KDEVICEHEIGHT*(926.0/1704))*(250.0/650) , (160/250.0)*(KDEVICEHEIGHT-KDEVICEHEIGHT*(926.0/1704))*(250.0/650), (160/250.0)*(KDEVICEHEIGHT-KDEVICEHEIGHT*(926.0/1704))*(250.0/650))];
    self.headImageView=hImageView;
    [self.contentView addSubview:self.headImageView];
    
    //姓名
    UILabel * naLabel=[[UILabel alloc]initWithFrame:CGRectMake((350.0/960)*KDEVICEWIDTH, (75.0/250)*(KDEVICEHEIGHT-KDEVICEHEIGHT*(926.0/1704))*(250.0/650), (345.0/960)*KDEVICEWIDTH, (44.0/250)*(KDEVICEHEIGHT-KDEVICEHEIGHT*(926.0/1704))*(250.0/650))];
//    naLabel.backgroundColor=[UIColor greenColor];
    naLabel.text=[NSString stringWithFormat:@"%@:  %@",@"姓名",@"穆大力"];
    naLabel.font = [UIFont fontWithName:@"Helvetica-light" size:14];
    self.nameLabel=naLabel;
    [self.contentView addSubview:self.nameLabel];
    
    //电话
    UILabel * tLabel=[[UILabel alloc]initWithFrame:CGRectMake((350.0/960)*KDEVICEWIDTH, (138.0/250)*(KDEVICEHEIGHT-KDEVICEHEIGHT*(926.0/1704))*(250.0/650), (450.0/960)*KDEVICEWIDTH, (44.0/250)*(KDEVICEHEIGHT-KDEVICEHEIGHT*(926.0/1704))*(250.0/650))];
    tLabel.font = [UIFont fontWithName:@"Helvetica-light" size:14];
//    tLabel.backgroundColor=[UIColor redColor];
    tLabel.text=[NSString stringWithFormat:@"%@:  %@",@"电话",@"13722786896"];
    self.telLabel=tLabel;
    [self.contentView addSubview:self.telLabel];
}






- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
