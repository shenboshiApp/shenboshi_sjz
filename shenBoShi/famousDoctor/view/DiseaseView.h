//
//  DiseaseView.h
//  shenBoShi
//
//  Created by 开发3 on 15/12/29.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DiseaseViewDelegate <NSObject>
- (void)buttonActionSendTitle: (NSString *)title;
@end
@interface DiseaseView : UIView<UICollectionViewDataSource,UICollectionViewDelegate>
{
    
}
//主页面显示的集合视图
@property (nonatomic,strong)UICollectionView *mainCollectionView;
@property (nonatomic,strong) UIImageView *bottomView;

//毛玻璃效果
@property (nonatomic,strong) UIVisualEffectView *blurView;

//代理方法
@property (nonatomic,weak) id<DiseaseViewDelegate>delegate;

@end
