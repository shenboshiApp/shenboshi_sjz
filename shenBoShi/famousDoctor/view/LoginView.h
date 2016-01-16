//
//  LoginView.h
//  shenBoShi
//
//  Created by 开发3 on 16/1/10.
//  Copyright © 2016年 开发3-lyp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIView<UITextFieldDelegate>
{
//    登陆页面肾的图片
    UIImageView *kidneyImageView;
//    填写用户名的底图
    UIImageView *inputNameImageView;
    
    //填写密码的底图
    UIImageView *inputWordImageView;
    
//    选择记住我的对勾
    UIButton *remmenberMeBtn;

//记住我按钮上的图片
    UIImageView *buttonImageview;
    
    //手机号testField
    UITextField *phoneTextField;
    
    //密码textField
    UITextField *passwordTextField;
    
    
//忘记密码
    UIButton *forgotPassword;
    
//登陆按钮
    UIButton *loginButton;
    
    //没有账号
    UILabel *noPasswordLabel;
    
    //立即注册
    UIButton *registrationButton;
    
    
}

@property (nonatomic,assign) BOOL _isFromDr;

//底图的view
@property (nonatomic,strong) UIImageView *bottomImageView;
@end
