//
//  LSLawyerScreenAndControl.h
//  lawyerUI
//
//  Created by greenstone on 14-12-7.
//  Copyright (c) 2014年 greenStone. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSLawyerScreenAndControl : UIView <UITextFieldDelegate>

//屏幕适配控件的高度
- (void)controlHeight:(UIView *)view mask:(BOOL)mask height:(CGFloat)height;
//屏幕适配控件的顶部，左边和右边
- (void)controlTop:(UIView *)view mask:(BOOL)mask view1:(UIView *)view1 top:(CGFloat)top left:(CGFloat)left right:(CGFloat)right;
//封装textfield的方法
- (void)textField:(UITextField *)textField placeholder:(NSString *)placeholder SecureText:(BOOL)SecureText fontSize:(CGFloat)fontSize title:(NSString *)title borderWidth:(int)borderWidth;
//封装lable的方法
- (void)label:(UILabel *)label fontSize:(CGFloat)fontSize title:(NSString *)title numberLines:(int)numberLines borderWidth:(int)borderWidth;
//封装button的方法
- (void)button:(UIButton *)button title:(NSString *)title fontSize:(CGFloat)fontSize corner:(int)corner borderWidth:(int)borderWidth;
//(button上面有图片)
- (void)buttonImage:(UIButton *)button imageID:(NSString *)imageID fontSize:(CGFloat)fontSize corner:(int)corner borderWidth:(int)borderWidth;//封装imageView的方法
- (UIImageView *)superviewImageView:(UIView *)superviewImageView imageID:(NSString *)imageID;
//allocField
- (UITextField *)superviewField:(UIView *)superviewField;
//allcoBtn
- (UIButton *)superviewBtn:(UIView *)superviewBtn;
//allocLabel
- (UILabel *)superviewLabel:(UIView *)superviewLabel;
//allocuiview的方法
- (UIView *)superviewView:(UIView *)superviewView;
//allocimageView的方法
//- (UIImageView *)superviewImageView:(UIView *)superviewImageView;

- (void)view:(UIView *)view boderWidth:(int)boderWidth;

@end
