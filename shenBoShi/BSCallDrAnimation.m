//
//  BSCallDrAnimation.m
//  shenBoShi
//
//  Created by 开发3 on 15/12/22.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import "BSCallDrAnimation.h"

@implementation BSCallDrAnimation
- (id)init {
    self = [super init];
        if (self) {

        self.contentsScale = [UIScreen mainScreen].scale;
        self.opacity = 0;

        // default
        self.radius = 121.25;
        self.animationDuration = 2.5;
        self.pulseInterval = 0;
        self.backgroundColor = [[UIColor colorWithRed:102/255.0 green:222/255.0 blue:224/255.0 alpha:1] CGColor];

        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
            
            [self setupAnimationGroup];
            
            if(self.pulseInterval != INFINITY) {
                
                dispatch_async(dispatch_get_main_queue(), ^(void) {
                    
                    [self addAnimation:self.animationGroup forKey:@"pulse"];
                    
                });
                
//                shdhakshdkjahsdkjahskjdhjkhskjahkjdhsajk
                
                
//                sadhahdkjashkjdhakjhdkjh
                
//                asdakjsdkjakjsdkl
            }
        });
    }
    return self;
}

- (void)setRadius:(CGFloat)radius {
    
    _radius = radius;
    
    CGPoint tempPos = self.position;
    
    CGFloat diameter = self.radius * 2;
    
    self.bounds = CGRectMake(0, 0, diameter, diameter);
    self.cornerRadius = self.radius;
    self.position = tempPos;
}

- (void)setupAnimationGroup {
    
    CAMediaTimingFunction *defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    self.animationGroup = [CAAnimationGroup animation];
    self.animationGroup.duration = self.animationDuration + self.pulseInterval;
    self.animationGroup.repeatCount = INFINITY;
    self.animationGroup.removedOnCompletion = NO;
    self.animationGroup.timingFunction = defaultCurve;
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.xy"];
    scaleAnimation.fromValue = @0.0;
    scaleAnimation.toValue = @1.0;
    scaleAnimation.duration = self.animationDuration;
    
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = self.animationDuration;
    opacityAnimation.values = @[@0.45, @0.45, @0];
    opacityAnimation.keyTimes = @[@0, @0.2, @1];
    opacityAnimation.removedOnCompletion = NO;
    
    NSArray *animations = @[scaleAnimation, opacityAnimation];
    
    self.animationGroup.animations = animations;
    
    
}


@end
