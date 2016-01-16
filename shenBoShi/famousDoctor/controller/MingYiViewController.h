//
//  MingYiViewController.h
//  shenBoShi
//
//  Created by 开发3 on 15/12/25.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Doctor.h"
#import "TheDoctorListCell.h"
#import "DiseaseView.h"
@interface MingYiViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tab;
    NSMutableArray *dataArray;
//  病种的view
    DiseaseView *diseaseView;
}

@end
