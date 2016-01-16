//
//  BingZhongViewController.h
//  shenBoShi
//
//  Created by 开发5 on 15/12/29.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MingYiViewController.h"

@interface BingZhongViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    NSArray *array;
}
@property(nonatomic,strong)UICollectionView *collectionView;
@property(nonatomic,strong)NSArray *_array;

@end
