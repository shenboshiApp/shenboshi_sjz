//
//  addressCell.h
//  shenBoShi
//
//  Created by 开发2 on 15/12/29.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMCityChoose.h"
@interface addressCell : UITableViewCell<EMCityChooseDelegate>
{
   EMCityChoose *_cityChooseViewController;
}
@property (nonatomic,strong)UILabel * addressLabel;
//@property (nonatomic,strong)UIButton * addressButton;
@property (nonatomic,strong)UIView * lineView;

@end
