//
//  pathologyCell.m
//  shenBoShi
//
//  Created by 开发2 on 15/12/29.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import "pathologyCell.h"

@implementation pathologyCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        [self createCell];
        
    }
    
    return self;
    
    
}
-(void)createCell
{
    UILabel * pLabel=[[UILabel alloc]initWithFrame:CGRectMake(26, 14, 100, 12)];
    pLabel.text=@"病理类型";
    pLabel.font=[UIFont fontWithName:@"Helvetica-light" size:13];
    self.pathLabel=pLabel;
    [self.contentView addSubview:self.pathLabel];
    
//    UIButton * pButton=[[UIButton alloc]initWithFrame:CGRectMake(215, 14, 72, 12)];
//    [pButton setTitle:@"肾衰竭" forState:UIControlStateNormal];
//    [pButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    pButton.font=[UIFont fontWithName:@"Helvetica-light" size:13];
//    self.pathButton=pButton;
//    [self.contentView addSubview:self.pathButton];
    
    UIImageView * pImageView=[[UIImageView alloc] initWithFrame:CGRectMake(280 * A_WIDTH, 16, 6, 6)];
    pImageView.image=[UIImage imageNamed:@"bilileixing"];
    self.pathImageView=pImageView;
    [self.contentView addSubview:pImageView];
    
    UIView * line=[[UIView alloc]initWithFrame:CGRectMake(26, 40, KDEVICEWIDTH - 52, 0.5)];
    line.backgroundColor=RGB(179, 179, 179, 0.5);
    self.lineView=line;
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
