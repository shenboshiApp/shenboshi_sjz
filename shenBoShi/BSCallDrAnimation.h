//
//  BSCallDrAnimation.h
//  shenBoShi
//
//  Created by 开发3 on 15/12/22.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@interface BSCallDrAnimation : CALayer


@property (nonatomic, assign) CGFloat radius;                   // default:80pt
@property (nonatomic, assign) NSTimeInterval animationDuration; // default:2.5s
@property (nonatomic, assign) NSTimeInterval pulseInterval; // default is 0s
@property (nonatomic, strong) CAAnimationGroup *animationGroup;

@end
