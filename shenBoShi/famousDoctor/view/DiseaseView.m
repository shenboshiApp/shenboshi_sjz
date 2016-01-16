//
//  DiseaseView.m
//  shenBoShi
//
//  Created by 开发3 on 15/12/29.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import "DiseaseView.h"

@implementation DiseaseView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self addSubview:self.blurView];
    }
    return self;
}

-(UIVisualEffectView *)blurView
{
      if (_blurView == nil) {
          
      UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
        
        _blurView = [[UIVisualEffectView alloc] initWithEffect:effect];
          
          _blurView.frame = CGRectMake(0, 0, KDEVICEWIDTH, KDEVICEHEIGHT);
          [_blurView addSubview:self.mainCollectionView];
    }
    return _blurView;
}


-(UICollectionView *)mainCollectionView
{
    
    
    if (_mainCollectionView == nil) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(5, 10, 5, 10);
        layout.itemSize = CGSizeMake(KDEVICEWIDTH/2 - 30* A_WIDTH, 30);
        layout.minimumInteritemSpacing = 20;
        layout.minimumLineSpacing = 20;
        

        _mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(10, 64, KDEVICEWIDTH - 20, KDEVICEHEIGHT) collectionViewLayout:layout];
        [_mainCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collection"];
        _mainCollectionView.backgroundColor = [UIColor clearColor];
        _mainCollectionView.dataSource = self;
        _mainCollectionView.delegate = self;
        
    }
    return _mainCollectionView;
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 14;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"collection";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button setTitleColor:[UIColor colorWithRed:230/255.0 green:84/255.0 blue:49/255.0 alpha:1] forState:UIControlStateNormal];
    
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 15;
    button.layer.borderWidth = 1.0;
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    
    CGColorRef color = CGColorCreate(colorSpaceRef, (CGFloat[]){230/255.0,84/255.0,49/255.0,1});
    
    [button.layer setBorderColor:color];
    
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
//    [button addTarget:self action:@selector(buttonActionTwo:) forControlEvents:UIControlEventTouchDown];
    
//230 84 49
    button.frame = CGRectMake(0, 0, cell.contentView.frame.size.width, cell.contentView.frame.size.height);
    [cell.contentView addSubview:button];
    button.tag = 1000 + indexPath.row;
    
    [button setTitle:@"石家庄肾病医院" forState:UIControlStateNormal];
    return cell;
}



//- (void)buttonActionTwo: (UIButton *)sender
//{
//    for (int i = 0; i < 14 ; i++) {
//        
//        UIButton *button = [self.mainCollectionView viewWithTag:1000 + i];
//        button.selected = NO;
//        [button setBackgroundColor:[UIColor clearColor]];
//        [button setTitleColor:[UIColor colorWithRed:230/255.0 green:84/255.0 blue:49/255.0 alpha:1] forState:UIControlStateNormal];
//        
//    }
//    
//    
//    sender.selected = !sender.selected;
//    if (sender.selected) {
//        
//        [sender setBackgroundColor:[UIColor colorWithRed:230/255.0 green:84/255.0 blue:49/255.0 alpha:1]];
//        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        
//    }else{
//        [sender setBackgroundColor:[UIColor clearColor]];
//        [sender setTitleColor:[UIColor colorWithRed:230/255.0 green:84/255.0 blue:49/255.0 alpha:1] forState:UIControlStateNormal];
//        
//    }
// 
//}

- (void)buttonAction:(UIButton *)sender
{

    for (int i = 0; i < 14 ; i++) {
        
        UIButton *button = [self.mainCollectionView viewWithTag:1000 + i];
        button.selected = NO;
        [button setBackgroundColor:[UIColor clearColor]];
        [button setTitleColor:[UIColor colorWithRed:230/255.0 green:84/255.0 blue:49/255.0 alpha:1] forState:UIControlStateNormal];

    }
    
    
    sender.selected = !sender.selected;
    if (sender.selected) {
        
        [sender setBackgroundColor:[UIColor colorWithRed:230/255.0 green:84/255.0 blue:49/255.0 alpha:1]];
        [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    }else{
        [sender setBackgroundColor:[UIColor clearColor]];
        [sender setTitleColor:[UIColor colorWithRed:230/255.0 green:84/255.0 blue:49/255.0 alpha:1] forState:UIControlStateNormal];

    }

    if ([self.delegate respondsToSelector:@selector(buttonActionSendTitle:)]) {
        
        [self.delegate buttonActionSendTitle:sender.titleLabel.text];
    
    }
    
    
}
//
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
