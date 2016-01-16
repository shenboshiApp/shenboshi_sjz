//
//  headerCell.m
//  shenBoShi
//
//  Created by 开发2 on 15/12/29.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import "headerCell.h"

@implementation headerCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        [self createCell];
        
    }
    
    return self;
    
    
}
-(void)createCell
{
//    UIImageView * hImageView=[[UIImageView alloc]initWithFrame:CGRectMake(235, 10, 60, 60)];
//    hImageView.image=[UIImage imageNamed:@"flower"];
//    self.headerImageView=hImageView;
//    [self.contentView addSubview:self.headerImageView];
//    self.portraitImageView = [[UIImageView alloc] initWithFrame:CGRectMake(230, 10, 60, 60)];
//    self.portraitImageView.layer.cornerRadius = 30;
//    self.portraitImageView.image = [UIImage imageNamed:@"flower"];
//    [self.contentView addSubview:self.portraitImageView];

    
    UILabel * hLabel=[[UILabel alloc]initWithFrame:CGRectMake(26, 33, 26, 12)];
    hLabel.text=@"头像";
    hLabel.font=[UIFont fontWithName:@"Helvetica-light" size:13];
    self.headerLabel=hLabel;
    [self.contentView addSubview:self.headerLabel];
    
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
