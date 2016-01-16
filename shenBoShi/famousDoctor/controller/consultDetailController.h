//
//  consultDetailController.h
//  shenBoShi
//
//  Created by 开发2 on 16/1/10.
//  Copyright © 2016年 开发3-lyp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "consult.h"
@interface consultDetailController : UIViewController
//病症详情
@property (nonatomic,strong) NSString * symString;
//姓名和类型
@property (nonatomic,strong) NSString *string;
//添加consultViewController的视图
@property (nonatomic,retain)consult * consultView;

@end
