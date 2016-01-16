//
//  informationCell.m
//  shenBoShi
//
//  Created by 开发2 on 15/12/29.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import "informationCell.h"

@implementation informationCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        [self createCell];
        
    }
    
    return self;
    
    
}
-(void)createCell
{
    UILabel * iLabel=[[UILabel alloc]initWithFrame:CGRectMake(26, 13, 26, 12)];
    iLabel.font=[UIFont fontWithName:@"Helvetica-light" size:13];
    self.informationLabel=iLabel;
    [self.contentView addSubview:self.informationLabel];
    
//    UITextField * iText=[[UITextField alloc]initWithFrame:CGRectMake(54, 2, 240, 34)];
//    iText.font=[UIFont fontWithName:@"Helvetica-light" size:13];
//    iText.text=@"                                                 ";
//    iText.tintColor=[UIColor blackColor];
//    [iText becomeFirstResponder];
//    self.informationText=iText;
//    [self.contentView addSubview:self.informationText];
    
    
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
