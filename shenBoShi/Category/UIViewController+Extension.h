//
//  NSString+Extension.h
//  GSUser
//
//  Created by greenstone on 14-12-20.
//  Copyright (c) 2014年 greenStone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIView (Extension)

@property (nonatomic,strong)NSMutableDictionary *extData;


-(id)getExtValue:(NSString*)key;
-(void)setExtValue:(NSString*)key
             value:(id)value;

-(void)setExpertId:(int)expertId;

- (void)setExpertType:(int)expertype;

-(void)setViewController:(UIViewController *)viewController;

@end
