//
//  LeadPictureViewController.m
//  shenBoShi
//
//  Created by 开发2 on 15/12/24.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import "leadPictureViewController.h"

@interface leadPictureViewController ()
@property (nonatomic, strong) ZWIntroductionViewController *introductionView;
@end

@implementation leadPictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createPic];
}
-(void)createPic{
    NSArray *coverImageNames = @[@"img_index_01txt", @"img_index_02txt", @"img_index_03txt"];
    NSArray *backgroundImageNames = @[@"img_index_01bg", @"img_index_02bg", @"img_index_03bg"];
    UIButton *enterButton = [UIButton new];
    [enterButton setTitle:@"立 即 体 验" forState:UIControlStateNormal];
    [enterButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    enterButton.backgroundColor=[UIColor yellowColor];
    enterButton.layer.cornerRadius=10;
    enterButton.layer.borderColor=[UIColor redColor].CGColor;
    enterButton.layer.borderWidth=2;
    enterButton.layer.masksToBounds=YES;
    [enterButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    self.introductionView = [[ZWIntroductionViewController alloc] initWithCoverImageNames:coverImageNames backgroundImageNames:backgroundImageNames button:enterButton];
    [self.view addSubview:self.introductionView.view];
    
}
-(void)buttonClick{
    NSUserDefaults * user=[NSUserDefaults standardUserDefaults];
    [user synchronize];
    [user setInteger:1 forKey:@"item"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"disMiss" object:nil];
    
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
