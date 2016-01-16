//
//  addressCell.m
//  shenBoShi
//
//  Created by 开发2 on 15/12/29.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import "addressCell.h"

@implementation addressCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        [self createCell];
        
    }
    
    return self;
    
    
}
-(void)createCell
{
    UILabel * adLabel=[[UILabel alloc]initWithFrame:CGRectMake(26,2,26 , 34)];
    adLabel.text=@"住址";
    adLabel.font=[UIFont fontWithName:@"Helvetica-light" size:13];
    self.addressLabel=adLabel;
    [self.contentView addSubview:self.addressLabel];

    UIView * line1=[[UIView alloc]initWithFrame:CGRectMake(26, 0, KDEVICEWIDTH - 52, 1)];
    line1.backgroundColor=RGB(179, 179, 179, 0.5);
    self.lineView=line1;
    [self.contentView addSubview:self.lineView];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
