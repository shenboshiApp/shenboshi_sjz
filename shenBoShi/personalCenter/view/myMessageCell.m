//
//  myMessageAndDoctorCell.m
//  shenBoShi
//
//  Created by 开发2 on 15/12/27.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import "myMessageCell.h"

@implementation myMessageCell
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
    UIImageView * hImageView=[[UIImageView alloc]initWithFrame:CGRectMake((93.0/960)*KDEVICEWIDTH,(49.0/200)*(KDEVICEHEIGHT-KDEVICEHEIGHT*(926.0/1704))*(200.0/650) , (90/200.0)*(KDEVICEHEIGHT-KDEVICEHEIGHT*(926.0/1704))*(200.0/650), (90/200.0)*(KDEVICEHEIGHT-KDEVICEHEIGHT*(926.0/1704))*(200.0/650))];
    self.headImageView=hImageView;
    [self.contentView addSubview:self.headImageView];
    
    //我的消息
    UILabel * messLabel=[[UILabel alloc]initWithFrame:CGRectMake((350.0/960)*KDEVICEWIDTH, (86.0/200)*(KDEVICEHEIGHT-KDEVICEHEIGHT*(926.0/1704))*(200.0/650), (310.0/960)*KDEVICEWIDTH, (28.0/200)*(KDEVICEHEIGHT-KDEVICEHEIGHT*(926.0/1704))*(200.0/650))];
    messLabel.font = [UIFont fontWithName:@"Helvetica-light" size:14];
//    messLabel.backgroundColor=[UIColor redColor];
    messLabel.text=@"个人信息";
    self.mineLabel=messLabel;
    [self.contentView addSubview:self.mineLabel];
    
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
