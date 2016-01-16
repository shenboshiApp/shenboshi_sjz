//
//  homePageViewController.m
//  shenBoShi
//
//  Created by 开发3 on 15/12/23.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import "homePageViewController.h"

@interface homePageViewController ()

@end

@implementation homePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView * imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 20)];
    imageView.image=[UIImage imageNamed:@"logo"];
    self.navigationItem.titleView=imageView;
    
    
    
    UILabel * navLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 62.67, 37.3)];
    navLabel.text=@"肾博士";
    navLabel.font=[UIFont fontWithName:@"Arial-BoldMT" size:18];
    navLabel.textColor=[UIColor whiteColor];
    self.navigationItem.titleView=navLabel;

    [self.view addSubview:self.homePageView];

}
-(homePageView *)homePageView
{
    if (_homePageView == nil) {
        _homePageView = [[homePageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        
    }
    return _homePageView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
