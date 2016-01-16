

//
//  MingYiViewController.m
//  shenBoShi
//
//  Created by 开发3 on 15/12/25.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import "MingYiViewController.h"
#import "DetailViewController.h"
#import "BingZhongViewController.h"
@interface MingYiViewController ()<DiseaseViewDelegate>
{
    
}
@end

@implementation MingYiViewController


-(void)viewWillAppear:(BOOL)animated
{
    
    [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
    [MBProgressHUD hideHUDForView:[UIApplication sharedApplication].keyWindow animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KDEVICEWIDTH, 21)];
    topView.backgroundColor = [UIColor redColor];
    [tab addSubview:topView];
    
    
    //导航栏左侧返回按钮
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage *backImage = [UIImage imageNamed:@"back@3x"];
    backImage = [backImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:backImage style:(UIBarButtonItemStylePlain) target:self action:@selector(backButton)];
    
    
    
    
    //导航栏右侧按钮
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"list@3x"] forState:UIControlStateNormal];
    [rightButton setTitle:@"病种" forState:UIControlStateNormal];
    rightButton.frame = CGRectMake(KDEVICEWIDTH-36, 35.5, 50, 10);
    [rightButton setImageEdgeInsets:UIEdgeInsetsMake(0, 60, 0, 0)]; //距离左边多少  要是向左移动 是负数
    [rightButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    [rightButton addTarget:self action:@selector(bingZhongButton:) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    //导航栏题目
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 80, 10)];
    label.text = @"专家库";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"Arial-BoldMT" size:18];
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = label;
    
    
    tab = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KDEVICEWIDTH, KDEVICEHEIGHT) style:(UITableViewStylePlain)];
    [self.view addSubview:tab];
    
    tab.dataSource = self;
    tab.delegate = self;
    
    dataArray = [NSMutableArray array];
    
    tab.separatorStyle = UITableViewCellSelectionStyleNone;
    
//    diseaseView = [[DiseaseView alloc] initWithFrame:CGRectMake(0, 0,KDEVICEWIDTH, KDEVICEHEIGHT)];
//    diseaseView.delegate = self;
    
// 下拉刷新
    
    MJRefreshNormalHeader *normalHeader = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerAction:)];
    tab.mj_header = normalHeader;

    
//上提加载
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerAction:)];
    
    tab.mj_footer = footer;
   }

- (void)footerAction: (MJRefreshAutoNormalFooter *)aFooter
{
    aFooter.state = MJRefreshStateIdle;
}
- (void)headerAction: (MJRefreshNormalHeader *)aNormalHeader
{
    aNormalHeader.state = MJRefreshStateIdle;
    
    
    
    
    
    
    
}


//diseaseView的代理方法
-(void)buttonActionSendTitle:(NSString *)title
{
    NSLog(@"---------%@",title);
}
-(void)bingZhongButton: (UIButton *)sender
{
    self.definesPresentationContext = YES;
    
    BingZhongViewController *bingZhongVC = [[BingZhongViewController alloc] init];
    bingZhongVC.view.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.95];
    bingZhongVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:bingZhongVC];
    
    [self presentViewController:nav animated:YES completion:nil];
    

//    sender.selected = !sender.selected;
//    if (sender.selected == YES) {
//        [[UIApplication sharedApplication].keyWindow addSubview:diseaseView];
//        
//    }else{
//        [diseaseView removeFromSuperview];
//    }
    
    
        //    bingZhongCV.view.frame = CGRectMake(0, 0, KDEVICEWIDTH, KDEVICEHEIGHT);
        
        // [self presentViewController:bingZhongCV animated:YES completion:^{
        //     [[UIApplication sharedApplication].keyWindow addSubview:bingZhongCV.view];
        // }];
        
//        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] init];
//        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [rightButton setImage:[UIImage imageNamed:@"listagain@3x"] forState:UIControlStateNormal];
//        [rightButton setTitle:@"病种" forState:UIControlStateNormal];
//        rightButton.frame = CGRectMake(KDEVICEWIDTH-36, 35.5, 50, 10);
//        [rightButton setImageEdgeInsets:UIEdgeInsetsMake(0, 60, 0, 0)]; //距离左边多少  要是向左移动 是负数
//        [rightButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
//        UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
//        self.navigationItem.rightBarButtonItem = rightItem;
//        [rightButton addTarget:self action:@selector(bingZhongButton) forControlEvents:(UIControlEventTouchUpInside)];
 
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 108;
}

-(TheDoctorListCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indentifer = @"cell";
    TheDoctorListCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifer];
    if (cell == nil) {
        cell = [[TheDoctorListCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:indentifer];
    }
    Doctor *doctor = [[Doctor alloc] init];
    cell.doctor = doctor;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detail = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:detail animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

-(void)backButton
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)tapAction: (UIGestureRecognizer *)TAP
{
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
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
