//
//  BingZhongViewController.m
//  shenBoShi
//
//  Created by 开发5 on 15/12/29.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import "BingZhongViewController.h"

@interface BingZhongViewController ()

@end

@implementation BingZhongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //导航栏题目
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 80, 10)];
    label.text = @"病种";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"Arial-BoldMT" size:20];
    label.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = label;

    
    //导航栏右侧按钮
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"list@3x"] forState:UIControlStateNormal];
    [rightButton setTitle:@"病种" forState:UIControlStateNormal];
    rightButton.frame = CGRectMake(KDEVICEWIDTH-36, 35.5, 50, 10);
    [rightButton setImageEdgeInsets:UIEdgeInsetsMake(0, 60, 0, 0)]; //距离左边多少  要是向左移动 是负数
    [rightButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightItem;
    [rightButton addTarget:self action:@selector(backMingYiButton) forControlEvents:(UIControlEventTouchUpInside)];

    
    //确定是水平滚动，还是垂直滚动
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    flowLayout.minimumInteritemSpacing = 10;
    
    self.collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, KDEVICEWIDTH - 40, KDEVICEHEIGHT) collectionViewLayout:flowLayout];
    self.collectionView.dataSource=self;
    self.collectionView.delegate=self;
    [self.collectionView setBackgroundColor:[UIColor clearColor]];
    //去掉右侧划线
    self.collectionView.showsVerticalScrollIndicator = NO;
    
    //注册Cell
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    
    [self.view addSubview:self.collectionView];
    
    array = [NSArray array];
    array = [NSArray arrayWithObjects:@"原发性：",@"继发性：",@"IgA肾病",@"高血压肾病",@"微小病变性肾病",@"糖尿病肾病",@"间质性肾炎",@"狼疮性肾炎",@"淀粉样变性肾病",@"紫癜性肾炎",@"多囊肾",@"高尿酸肾病",@"急性肾小球肾炎",@"肥胖性肾病",@"急进性肾小球肾炎",@"乙肝病毒相关性肾病",@"局灶节段性肾小球硬化",@"",@"膜性肾病",@"",@"系膜增生性肾小球肾炎",@"",@"膜增生性肾小球肾炎",@"",@"隐匿性肾炎",@"", nil];

    // Do any additional setup after loading the view.
}

-(void)backMingYiButton
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [array count];
}

//定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * CellIdentifier = @"UICollectionViewCell";
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 9, (KDEVICEWIDTH - 30)/2, 30)];
    //    label.textColor = [UIColor redColor];
    //    label.backgroundColor = [UIColor redColor];
//    label.text = @"石家庄肾病医院";
    label.text = [array objectAtIndex:indexPath.row];
    label.font = [UIFont systemFontOfSize:12];
    
    for (id subView in cell.contentView.subviews) {
        [subView removeFromSuperview];
    }
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(15, 45, KDEVICEWIDTH-40, 1)];
    label1.backgroundColor = [UIColor colorWithRed:53/255.0 green:170/255.0 blue:170/255.0 alpha:1];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(KDEVICEWIDTH/2-10, 16, 1, 20)];
    label2.backgroundColor = [UIColor colorWithRed:53/255.0 green:170/255.0 blue:170/255.0 alpha:1];
    
    [cell.contentView addSubview:label];
    [cell.contentView addSubview:label1];
    [cell.contentView addSubview:label2];
    return cell;
}

#pragma mark --UICollectionViewDelegateFlowLayout

//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(KDEVICEWIDTH/2 - 30, 35);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

//点击方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
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
