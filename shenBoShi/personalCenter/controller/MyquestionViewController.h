//
//  MyquestionViewController.h
//  shenBoShi
//
//  Created by 开发5 on 15/12/31.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h"
#import "QuestionTableViewCell.h"

@interface MyquestionViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tab;
 }


@end
