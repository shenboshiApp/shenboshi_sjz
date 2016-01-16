//
//  ClientConsultViewController.h
//  shenBoShi
//
//  Created by 开发4 on 15/12/30.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ClientConsultViewController : UIViewController
{
    NSArray *dataArray;
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UISearchBar *searchBar;
@end
