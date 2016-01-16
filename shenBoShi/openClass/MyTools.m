//
//  MyTools.m
//  UI-10-自定义cell
//
//  Created by lanou3g on 15/8/17.
//  Copyright (c) 2015年 lichao. All rights reserved.
//

#import "MyTools.h"

@implementation MyTools

-(CGFloat)getLabelHeight:(CGFloat)fontSize width:(CGFloat)width content:(NSString *)content {
    //高度尽量给大值
    CGSize size = CGSizeMake(width, 100000);
    NSDictionary *dic = [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:fontSize] forKey:NSFontAttributeName];
    
    CGRect rc = [content boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    
    return rc.size.height;
}

@end
