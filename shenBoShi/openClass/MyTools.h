//
//  MyTools.h
//  UI-10-自定义cell
//
//  Created by lanou3g on 15/8/17.
//  Copyright (c) 2015年 lichao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MyTools : NSObject

//声明一个方法计算label的高度
-(CGFloat)getLabelHeight:(CGFloat)fontSize width:(CGFloat)width content:(NSString *)content;

@end
