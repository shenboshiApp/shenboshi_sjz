//
//  MyDoctorViewController.h
//  shenBoShi
//
//  Created by 开发5 on 16/1/1.
//  Copyright © 2016年 开发3-lyp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Doctor.h"
#import "DoctorTableViewCell.h"

@interface MyDoctorViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tab;
}

@end
