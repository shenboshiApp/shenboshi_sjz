//
//  NearDrViewController.m
//  shenBoShi
//
//  Created by 开发3 on 15/12/25.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import "NearDrViewController.h"

@interface NearDrViewController ()

@end

@implementation NearDrViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.nearDrView];
    
}

-(NearDrView *)nearDrView
{
    if (_nearDrView == nil) {
        _nearDrView = [[NearDrView alloc] initWithFrame:CGRectMake(0, 64, KDEVICEWIDTH, KDEVICEHEIGHT - 64)];
    }
    return _nearDrView;
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
