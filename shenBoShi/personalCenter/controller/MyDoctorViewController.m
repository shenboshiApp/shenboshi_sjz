//
//  MyDoctorViewController.m
//  shenBoShi
//
//  Created by 开发5 on 16/1/1.
//  Copyright © 2016年 开发3-lyp. All rights reserved.
//

#import "MyDoctorViewController.h"

@interface MyDoctorViewController ()

@end

@implementation MyDoctorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    UIImage *image = [UIImage imageNamed:@"background"];
    [imageView setImage:image];
    
    //标题
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    label.text = @"我咨询过的医生";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"Arial-BoldMT" size:14];
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = label;
    
    tab = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KDEVICEWIDTH, KDEVICEHEIGHT) style:(UITableViewStylePlain)];
    [self.view addSubview:tab];
    [tab setBackgroundView:imageView];
    
    tab.dataSource = self;
    tab.delegate = self;
    
    tab.separatorStyle = UITableViewCellEditingStyleNone;
    
    UIImage *backImage = [UIImage imageNamed:@"back@3x"];
    backImage = [backImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:backImage style:(UIBarButtonItemStylePlain) target:self action:@selector(backButton:)];
    


    // Do any additional setup after loading the view.
}

- (void)backButton: (UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 78;
}

-(DoctorTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indentifier = @"cell";
    DoctorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell == nil) {
        cell = [[DoctorTableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:indentifier];
    }
    Doctor *doctor = [[Doctor alloc] init];
    cell.doctor  = doctor;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
    
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
