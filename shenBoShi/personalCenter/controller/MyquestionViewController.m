//
//  MyquestionViewController.m
//  shenBoShi
//
//  Created by 开发5 on 15/12/31.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import "MyquestionViewController.h"

@interface MyquestionViewController ()

@end

@implementation MyquestionViewController


-(void)viewWillAppear:(BOOL)animated
{
    [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated: YES];
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [MBProgressHUD hideAllHUDsForView:[UIApplication sharedApplication].keyWindow animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    UIImage *image = [UIImage imageNamed:@"background"];
    [imageView setImage:image];
    
    //标题
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 44)];
    label.text = @"我咨询过的问题";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"Arial-BoldMT" size:18];
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = label;

    tab = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KDEVICEWIDTH, KDEVICEHEIGHT) style:(UITableViewStylePlain)];
    [self.view addSubview:tab];
    [tab setBackgroundView:imageView];
    
    tab.dataSource = self;
    tab.delegate = self;
    
    tab.separatorStyle = UITableViewCellEditingStyleNone;
    
    //导航栏左侧返回按钮
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage *backImage = [UIImage imageNamed:@"back@3x"];
    backImage = [backImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:backImage style:(UIBarButtonItemStylePlain) target:self action:@selector(backButton:)];
    
    
    
//   添加下拉加载
    
    MJRefreshNormalHeader *normalHeader = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(normalHeaderAction:)];
    tab.mj_header = normalHeader;
    

    
//    添加上提加载
//    tab.mj_footer =
// footerWithRefreshingBlock:^{
//    
//}];
    
    
    
    // Do any additional setup after loading the view.
    //上提加载
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerAction:)];
    
    tab.mj_footer = footer;
}

- (void)footerAction: (MJRefreshAutoNormalFooter *)aFooter
{
    aFooter.state = MJRefreshStateIdle;
}

- (void)normalHeaderAction: (MJRefreshNormalHeader *)header
{
    header.state = MJRefreshStateIdle;
}
- (void)backButton:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 158;
}

-(QuestionTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indentifier = @"cell";
    QuestionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell == nil) {
        cell = [[QuestionTableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:indentifier];
    }
    Question *question = [[Question alloc] init];
    cell.question  = question;
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
