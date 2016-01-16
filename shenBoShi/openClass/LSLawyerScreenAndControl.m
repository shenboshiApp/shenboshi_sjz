//
//  LSLawyerScreenAndControl.m
//  lawyerUI
//
//  Created by greenstone on 14-12-7.
//  Copyright (c) 2014年 greenStone. All rights reserved.
//

#import "LSLawyerScreenAndControl.h"

@implementation LSLawyerScreenAndControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}

//屏幕适配控件的高度
- (void)controlHeight:(UIView *)view mask:(BOOL)mask height:(CGFloat)height{
    //屏幕适配
    if (KDEVICEHEIGHT < 568) {
        height *= 480.0/568;
    }
    NSLayoutConstraint *controlHeight = [NSLayoutConstraint
                                         constraintWithItem:view
                                         attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil
                                         attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0
                                         constant:height];
    view.translatesAutoresizingMaskIntoConstraints = mask;
    [view addConstraint:controlHeight];
}
//屏幕适配控件的顶部，左边和右边
- (void)controlTop:(UIView *)view mask:(BOOL)mask view1:(UIView *)view1 top:(CGFloat)top left:(CGFloat)left right:(CGFloat)right{
    //屏幕适配
    if (KDEVICEHEIGHT < 568) {
        if (view1 == self && top > 64) {
            top *= 1;
        }
        else{
        
            top *= 480.0/568;
        }
    }
    NSLayoutConstraint *controlTop = [NSLayoutConstraint
                                      constraintWithItem:view
                                      attribute:NSLayoutAttributeTop
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:view1
                                      attribute:NSLayoutAttributeTop
                                      multiplier:1.0
                                      constant:top];
    
    NSLayoutConstraint *controlLeft = [NSLayoutConstraint
                                       constraintWithItem:view
                                       attribute:NSLayoutAttributeLeft
                                       relatedBy:NSLayoutRelationEqual
                                       toItem:view1
                                       attribute:NSLayoutAttributeLeft
                                       multiplier:1.0
                                       constant:left];
    
    NSLayoutConstraint *controlRight = [NSLayoutConstraint
                                        constraintWithItem:view
                                        attribute:NSLayoutAttributeRight
                                        relatedBy:NSLayoutRelationEqual
                                        toItem:view1
                                        attribute:NSLayoutAttributeRight
                                        multiplier:1.0
                                        constant:right];

    [self addConstraint:controlRight];
    [self addConstraint:controlLeft];
    [self addConstraint:controlTop];
    view.translatesAutoresizingMaskIntoConstraints = mask;
}


//封装textfield的方法
- (void)textField:(UITextField *)textField placeholder:(NSString *)placeholder SecureText:(BOOL)SecureText fontSize:(CGFloat)fontSize title:(NSString *)title borderWidth:(int)borderWidth{
    
    textField.secureTextEntry = SecureText;
    textField.placeholder = placeholder;
    textField.text = title;
    textField.font = [UIFont systemFontOfSize:fontSize];
    textField.delegate = self;
    textField.clearButtonMode = UITextFieldViewModeAlways;
    textField.layer.borderWidth = borderWidth;//边框宽度
    
   // NSLog(@"%@------%f%f",textField,textField.bounds.size.width,textField.bounds.size.height);
}
//allocField
- (UITextField *)superviewField:(UIView *)superviewField{

    UITextField *textField = [[UITextField alloc]init];
    [superviewField addSubview:textField];
    return textField;
}

//封装lable的方法
- (void)label:(UILabel *)label fontSize:(CGFloat)fontSize title:(NSString *)title numberLines:(int)numberLines borderWidth:(int)borderWidth{
    
    label.font = [UIFont systemFontOfSize:fontSize];
    label.text = title;
    label.layer.borderColor = [UIColor lightGrayColor].CGColor;//边框颜色,要为CGColor
    label.layer.borderWidth = borderWidth;//边框宽度
    label.numberOfLines = numberLines;
//    label.backgroundColor = [UIColor whiteColor];
//    label.textAlignment = NSTextAlignmentCenter;
    
    //NSLog(@"%@-------%f%f",label,label.bounds.size.width,label.bounds.size.height);
}
//allocLabel
- (UILabel *)superviewLabel:(UIView *)superviewLabel{

    UILabel *label = [[UILabel alloc]init];
    [superviewLabel addSubview:label];
    return label;
}
//封装button的方法(button上面有字体)
- (void)button:(UIButton *)button title:(NSString *)title fontSize:(CGFloat)fontSize corner:(int)corner borderWidth:(int)borderWidth{
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    button.layer.cornerRadius = corner;
    button.layer.masksToBounds = YES;
    button.layer.borderWidth = borderWidth;//边框宽度
    //button.backgroundColor = [UIColor blueColor];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];

     //NSLog(@"%@------%f%f",button,button.bounds.size.width,button.bounds.size.height);
}
//(button上面有图片)
- (void)buttonImage:(UIButton *)button imageID:(NSString *)imageID fontSize:(CGFloat)fontSize corner:(int)corner borderWidth:(int)borderWidth{

    [button setBackgroundImage:[UIImage imageNamed:imageID] forState:UIControlStateNormal];
    
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    button.layer.cornerRadius = corner;
    button.layer.borderWidth = borderWidth;//边框宽度
    button.layer.masksToBounds = YES;
    
    //NSLog(@"%@------%f%f",button,button.bounds.size.width,button.bounds.size.height);
}
//allcoBtn
- (UIButton *)superviewBtn:(UIView *)superviewBtn{

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [superviewBtn addSubview:btn];
    //btn.highlighted = YES;
    return btn;
}
//封装imageView的方法
- (UIImageView *)superviewImageView:(UIView *)superviewImageView imageID:(NSString *)imageID{
    
     UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageID]];
    [superviewImageView addSubview:imageView];
    return imageView;
}
//allocimageView的方法
//- (UIImageView *)superviewImageView:(UIView *)superviewImageView {
//
//    UIImageView *imageView = [[UIImageView alloc]init];
//    [superviewImageView addSubview:imageView];
//    return imageView;
//}
//allocuiview的方法
- (UIView *)superviewView:(UIView *)superviewView{

    UIView *view = [[UIView alloc]init];
    [superviewView addSubview:view];
    return view;
}
//封装uiview的方法
- (void)view:(UIView *)view boderWidth:(int)boderWidth{

    view.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    view.layer.borderWidth = boderWidth;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
