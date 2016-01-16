//
//  NSString+Extension.m
//  GSUser
//
//  Created by greenstone on 14-12-20.
//  Copyright (c) 2014年 greenStone. All rights reserved.
//

#import "UIViewController+Extension.h"

@implementation UIView (Extension)



-(id)getExtValue:(NSString *)key
{
    return [[self getExtData] objectForKey:key];
}

-(void)setExtValue:(NSString *)key value:(id)value
{
    [[self getExtData] setObject:value forKey:key];
}

-(NSMutableDictionary *)getExtData
{
    if (self.extData == nil) {
        self.extData = [NSMutableDictionary dictionary];
    }
    
    return self.extData;
}

-(void)setExpertId:(int)expertId
{
    NSLog(@"not impl");
}
- (void)setExpertType:(int)expertype{
    NSLog(@"not impl");
}
-(void)setViewController:(UIViewController *)viewController{
    NSLog(@"not impl");
}



@end
