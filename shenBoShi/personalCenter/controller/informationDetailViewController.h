//
//  informationViewController.h
//  shenBoShi
//
//  Created by 开发2 on 15/12/28.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EMCityChoose.h"
#import "pathologyTypeController.h"
#import "NJImageCropperViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapLocationKit/AMapLocationKit.h>
@interface informationDetailViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,EMCityChooseDelegate,typeDelegate,UITextFieldDelegate,AMapLocationManagerDelegate>
@property (nonatomic,strong)UIImageView * bottomView;
//是否从主页传递过来
@property (nonatomic,assign) BOOL is_fromHomePage;
//
@property (nonatomic,strong) AMapLocationManager *mapLocationManager;
@end
