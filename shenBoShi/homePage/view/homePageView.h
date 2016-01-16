//
//  homePageView.h
//  shenBoShi
//
//  Created by 开发3 on 15/12/23.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BSCallDrAnimation.h"
#import "personCentreController.h"
@interface homePageView : UIView
{
    UIButton *chatButton;
    UIButton *phoneButton;
    CGFloat x;
    CGFloat y;
    int flag;
}
//关于首页动画的类，脉冲导航图
@property (nonatomic, strong) BSCallDrAnimation *halo;
//动画导航的同心圆
@property (nonatomic, strong) UIImageView *secondImageView;
//动画导航的底层大圆
@property (nonatomic, strong) UIImageView *firstImageView;
//动画导航的中心圆
@property (nonatomic, strong) UIImageView *centerImageView;
//所有的图
@property (nonatomic, strong) UIImageView *bottomView;
//logoImage
@property (nonatomic, strong) UIImageView *logoImageView;
//中心圆
@property (nonatomic,strong) UIImageView *centerCircleView;

@end
