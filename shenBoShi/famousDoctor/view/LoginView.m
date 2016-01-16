//
//  LoginView.m
//  shenBoShi
//
//  Created by 开发3 on 16/1/10.
//  Copyright © 2016年 开发3-lyp. All rights reserved.
//

#import "LoginView.h"
#import "RegisterClientViewController.h"
#import "UIView+UIViewController.h"
#import "personCentreController.h"
@interface LoginView ()
{
    CGFloat keyBoardHeight;
    NSString *phoneNumberString;
    NSString *passWordString;
    UIActivityIndicatorView *textActivityView ;
    
    UIButton *autoLoginBtn;
    
    
    BOOL autoLogin;
    
    BOOL remmberMe;

}
@end

@implementation LoginView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        
        [self addKeyBoardNotification];
        [self addSubview:self.bottomImageView];
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        
        
        if ([userDefaults objectForKey:@"phone"] != nil && [userDefaults objectForKey:@"passWord"] != nil) {

            phoneNumberString =[userDefaults objectForKey:@"phone"];
            passWordString = [userDefaults objectForKey:@"passWord"];
            
            phoneTextField.text = phoneNumberString;
            passwordTextField.text = passWordString;
            
            
            remmenberMeBtn.selected = YES;
            [remmenberMeBtn setImage:[UIImage imageNamed:@"jz"] forState:UIControlStateNormal];

            
            
        }

    }
    return self;
}


-(void)dealloc
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];

}

- (void)addKeyBoardNotification
{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(kekeyBoardWillHiden:) name:UIKeyboardWillHideNotification object:nil];
    
}



- (void)keyBoardWillShow: (NSNotification *)aNotification
{
    NSLog(@"键盘即将出现");
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
//
    
    
    NSLog(@"%@",NSStringFromCGSize(kbSize));
    
    
     keyBoardHeight = kbSize.height;
    if (KDEVICEHEIGHT - 64 - inputWordImageView.frame.origin.y - 70 < keyBoardHeight) {
        [UIView animateWithDuration:0.6 animations:^{
            CGFloat y = keyBoardHeight - KDEVICEHEIGHT + 64 + inputWordImageView.frame.origin.y + 70 ;
            self.frame = CGRectMake(0, 64 - y ,KDEVICEWIDTH, KDEVICEHEIGHT - 64);
        }];
        
    }
}


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

- (void)kekeyBoardWillHiden: (NSNotification *)aNotification
{
    NSLog(@"键盘即将消失");
    [UIView animateWithDuration:0.6 animations:^{
//        CGFloat y = keyBoardHeight - KDEVICEHEIGHT + 64 + inputImageView.frame.origin.y + 70 ;
        self.frame = CGRectMake(0, 64 ,KDEVICEWIDTH, KDEVICEHEIGHT - 64);
    }];


}

//底层磨砂图
-(UIImageView *)bottomImageView
{
    if (!_bottomImageView) {
        _bottomImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [_bottomImageView setImage:[UIImage imageNamed:@"LoginBackground"]];
        
        kidneyImageView = [[UIImageView alloc] initWithFrame:CGRectMake(KDEVICEWIDTH/2 -88, 46, 148, 181)];
        [kidneyImageView setImage:[UIImage imageNamed:@"LoginShen"]];
        [_bottomImageView addSubview:kidneyImageView];
        
        
        
        inputNameImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30,CGRectGetMaxY(kidneyImageView.frame) + 36 , KDEVICEWIDTH - 60, 35)];
        
        UIEdgeInsets edge =UIEdgeInsetsMake(5.0, 30.0,5.0, 10.0);
        UIImage *  nameImage = [[UIImage imageNamed:@"yonghuming"] resizableImageWithCapInsets:edge];

        [inputNameImageView setImage:nameImage];
        [_bottomImageView addSubview:inputNameImageView];
        
        inputWordImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, CGRectGetMaxY(inputNameImageView.frame) + 10, KDEVICEWIDTH - 60, 35)];
//        UIEdgeInsets edge =UIEdgeInsetsMake(5.0, 30.0,5.0, 10.0);
        UIImage *  passImage = [[UIImage imageNamed:@"mima"] resizableImageWithCapInsets:edge];

//        UIImage *wordImage = [UIImage imageNamed:@""];
        [inputWordImageView setImage:passImage];
        [_bottomImageView addSubview:inputWordImageView];
        
        
        
        
        remmenberMeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        remmenberMeBtn.frame = CGRectMake(CGRectGetMinX(inputWordImageView.frame), CGRectGetMaxY(inputWordImageView.frame) + 20, 52, 13);
        
//        buttonImageview = [[UIImageView alloc] initWithFrame:CGRectMake(1, 1, 10,10 )];
//        buttonImageview.userInteractionEnabled = YES;
        [buttonImageview setImage:[UIImage imageNamed:@"onjz"]];
//        [remmenberMeBtn addSubview:buttonImageview];
    
        [remmenberMeBtn setImage:[UIImage imageNamed:@"onjz"] forState:UIControlStateNormal];
        [remmenberMeBtn setImageEdgeInsets:UIEdgeInsetsMake(1, 1, 1, 42)];
        
        [remmenberMeBtn setTitleEdgeInsets:UIEdgeInsetsMake(1, 0, 1, 0)];
        
//        [remmenberMeBtn setLayoutMargins:UIEdgeInsetsMake(1, 12, 1, 10)];
        [remmenberMeBtn addTarget:self action:@selector(remmenberMeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
         buttonImageview.userInteractionEnabled = YES;

        [remmenberMeBtn setTitle:@"记住我" forState:UIControlStateNormal];
        remmenberMeBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        
       [ remmenberMeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
        remmenberMeBtn.userInteractionEnabled = YES;

        _bottomImageView.userInteractionEnabled = YES;

        [_bottomImageView addSubview:remmenberMeBtn];
        
        
        
        
        
        
        autoLoginBtn = [[UIButton alloc] initWithFrame:CGRectMake(KDEVICEWIDTH - 30 - 65, CGRectGetMaxY(inputWordImageView.frame) + 20, 65, 13)];
        
        [autoLoginBtn setImage:[UIImage imageNamed:@"onjz"] forState:UIControlStateNormal];
        [autoLoginBtn setImageEdgeInsets:UIEdgeInsetsMake(1, 1, 1, 55)];

        [autoLoginBtn setTitle:@"自动登录" forState:(UIControlStateNormal)];
        autoLoginBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        
        [autoLoginBtn setTitleColor:[UIColor colorWithRed:21/255.0 green:21/255.0 blue:21/255.0 alpha:1] forState:UIControlStateNormal];
        [autoLoginBtn addTarget:self action:@selector(autoLoginBtnButton:) forControlEvents:(UIControlEventTouchUpInside)];
        [_bottomImageView addSubview:autoLoginBtn];
        
        
        loginButton = [[UIButton alloc] initWithFrame:CGRectMake(30, CGRectGetMaxY(autoLoginBtn.frame) + 20, KDEVICEWIDTH - 60, 40)];
        [loginButton setTitle:@"登录" forState:(UIControlStateNormal)];
        [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        loginButton.backgroundColor = [UIColor colorWithRed:65/255.0 green:169/255.0 blue:168/255.0 alpha:1];
        [loginButton.layer setCornerRadius:5.0];
        loginButton.showsTouchWhenHighlighted = YES;
        [loginButton addTarget:self action:@selector(loginAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_bottomImageView addSubview:loginButton];
        
        
        noPasswordLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, CGRectGetMaxY(loginButton.frame) + 7, 78, 30)];
        noPasswordLabel.text = @"还没有账号?";
        noPasswordLabel.font = [UIFont systemFontOfSize:13];
        noPasswordLabel.textColor = [UIColor colorWithRed:131/255.0 green:131/255.0 blue:131/255.0 alpha:1];
        [_bottomImageView addSubview:noPasswordLabel];
        
        
        registrationButton = [[UIButton alloc] init];
        registrationButton.frame = CGRectMake(CGRectGetMaxX(noPasswordLabel.frame), CGRectGetMinY(noPasswordLabel.frame), 52, 30);
        [registrationButton setTitle:@"立即注册" forState:(UIControlStateNormal)];
        registrationButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [registrationButton setTitleColor:[UIColor colorWithRed:21/255.0 green:21/255.0 blue:21/255.0 alpha:1] forState:UIControlStateNormal];
        [registrationButton addTarget:self action:@selector(registrationAction) forControlEvents:(UIControlEventTouchUpInside)];
        [_bottomImageView addSubview:registrationButton];
        
        
        phoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(40,0, CGRectGetWidth(inputNameImageView.frame) - 80, 35)];
        phoneTextField.placeholder = @"用户名";
        phoneTextField.clearButtonMode = UITextFieldViewModeAlways;
        phoneTextField.delegate = self;
        [inputNameImageView addSubview:phoneTextField];
        inputNameImageView.userInteractionEnabled = YES;
        
        
        
        
        passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(40,0, CGRectGetWidth(inputWordImageView.frame) - 80, 35)];
        passwordTextField.placeholder = @"密码";
        passwordTextField.clearButtonMode = UITextFieldViewModeAlways;
        [passwordTextField setSecureTextEntry:YES];
        passwordTextField.delegate = self;
        [inputWordImageView addSubview:passwordTextField];
        inputWordImageView.userInteractionEnabled = YES;

        
        
        forgotPassword = [UIButton buttonWithType:UIButtonTypeCustom];
        forgotPassword.frame =CGRectMake(KDEVICEWIDTH - 30 - 52, CGRectGetMinY(noPasswordLabel.frame), 52, 30);

        [forgotPassword addTarget:self action:@selector(forgotPasswordAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [forgotPassword setTitle:@"忘记密码" forState:UIControlStateNormal];
        forgotPassword.titleLabel.font = [UIFont systemFontOfSize:13];
        
        [forgotPassword setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        
        [_bottomImageView addSubview:forgotPassword];
        
        
        
        
        
        
        
    }
    return _bottomImageView;
}


- (void)forgotPasswordAction: (UIButton *)sender
{
    NSLog(@"-----");
    
    
    
    
    
}

- (void)remmenberMeBtnAction: (UIButton *)sender
{
    sender.selected = !sender.selected;
    
    if (sender.selected) {
//        [buttonImageview setImage:[UIImage imageNamed:@"jz"]];
        [remmenberMeBtn setImage:[UIImage imageNamed:@"jz"] forState:UIControlStateNormal];
        
        remmberMe = YES;

 
    }else{
//        [buttonImageview setImage:[UIImage imageNamed:@""]];
        [remmenberMeBtn setImage:[UIImage imageNamed:@"onjz"] forState:UIControlStateNormal];
        remmberMe = NO;


    }
    
    
    
    
}

//自动登录点击事件
-(void)autoLoginBtnButton: (UIButton *)sender
{
//    NSLog(@"真笨，竟然忘了密码");
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        //        [buttonImageview setImage:[UIImage imageNamed:@"jz"]];
        [autoLoginBtn setImage:[UIImage imageNamed:@"jz"] forState:UIControlStateNormal];
        
        autoLogin = YES;
        
//        NSUserDefaults *stand = [NSUserDefaults standardUserDefaults];
//        [stand setBool:YES forKey:@"_isLogIn"];
//        
//        
//        
        
    }else{
        //        [buttonImageview setImage:[UIImage imageNamed:@""]];
        [autoLoginBtn setImage:[UIImage imageNamed:@"onjz"] forState:UIControlStateNormal];
        
        
//        NSUserDefaults *stand = [NSUserDefaults standardUserDefaults];
//        [stand setBool:NO forKey:@"_isLogIn"];
//
        
//
        autoLogin = NO;
        
        
        
    }
    

}





//忘记密码



//立即注册点击事件
-(void)registrationAction
{
    NSLog(@"还没有密码，赶紧注册吧");
    
    RegisterClientViewController *registerVC =[[RegisterClientViewController alloc] init];
    
    [self.viewController.navigationController pushViewController:registerVC animated:YES];
    
    
}

//登陆点击事件
-(void)loginAction: (UIButton *)button
{
    NSLog(@"登陆按钮");
    
    [phoneTextField endEditing:YES];
    [passwordTextField endEditing:YES];
    
    if ([phoneNumberString isEqualToString:@"123456"] && ![phoneNumberString isEqualToString:@""]) {
        if ([passWordString isEqualToString:@"123456"] && ![passWordString isEqualToString:@""]) {
            
//            textActivityView.hidesWhenStopped = YES;
            //    button.titleLabel.t
            
            //    button.titleLabel.hidden = YES;
//            textActivityView.center = CGPointMake(button.bounds.size.width/2 , button.bounds.size.height/2);//只能设置中心，不能设置大小
//            [button addSubview:textActivityView];
            
//            [button setTitle:@"" forState:UIControlStateNormal];
            personCentreController *personVC = [[personCentreController alloc] init];
            
            [self.viewController.navigationController pushViewController:personVC animated:YES];
            

            
//            [self performSelector:@selector(delayMethod) withObject:nil afterDelay:1.5f];
            
            
//            [textActivityView startAnimating];
            NSUserDefaults *stand = [NSUserDefaults standardUserDefaults];

            if (autoLogin == YES) {
                [stand setBool:YES forKey:@"_isLogIn"];
                [stand synchronize];

                
            }else{
                [stand setBool:NO forKey:@"_isLogIn"];
                [stand synchronize];

            }
            
            if (remmberMe == YES) {
                [stand setBool:YES forKey:@"_isLogIn"];

                [stand setObject:phoneNumberString forKey:@"phone"];
                [stand setObject:passWordString forKey:@"passWord"];
                [stand synchronize];

            }else{
                if (autoLogin == NO) {
                    [stand setBool:NO forKey:@"_isLogIn"];

                }

                [stand setObject:nil forKey:@"phone"];
                [stand setObject:nil forKey:@"passWord"];
                [stand synchronize];


            }
            
            
        }else{
            UIAlertView *ale = [[UIAlertView alloc] initWithTitle:@"提示" message:@"密码错误请重新输入" delegate:self cancelButtonTitle:@"重新输入" otherButtonTitles:nil, nil];
            [ale show];
            
        }
    }else{
        
        UIAlertView *ale = [[UIAlertView alloc] initWithTitle:@"提示" message:@"账号错误请重新输入" delegate:self cancelButtonTitle:@"重新输入" otherButtonTitles:nil, nil];
        [ale show];
        
        
        
    }
    

    
    
//}else{
//    UIAlertView *ale = [[UIAlertView alloc] initWithTitle:@"提示" message:@"账号错误请重新输入" delegate:self cancelButtonTitle:@"重新输入" otherButtonTitles:nil, nil];
//    [ale show];
//    

    


}

- (void)delayMethod
{
    if (self._isFromDr == YES) {
        personCentreController *personVC = [[personCentreController alloc] init];
        
        [self.viewController.navigationController pushViewController:personVC animated:YES];
        
        
    }else{
//        UIAlertView *ale = [[UIAlertView alloc] initWithTitle:@"提示" message:@"账号错误" delegate:self cancelButtonTitle:@"重新输入" otherButtonTitles:nil, nil];
//        [ale show];
        personCentreController *personVC = [[personCentreController alloc] init];
        
        [self.viewController.navigationController pushViewController:personVC animated:YES];
        

        
        
    }
    
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [phoneTextField resignFirstResponder];
    [passwordTextField resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [phoneTextField resignFirstResponder];
    [passwordTextField resignFirstResponder];
    
    [textField endEditing:YES];

    return YES;
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
//    CGRect textFrame = _bottomImageView.frame;
//    CGPoint textPoint = [textField convertPoint:CGPointMake(0, textField.frame.size.height) toView:self];
//    float offset = textPoint.y +textFrame.size.height - (self.frame.size.height +64) +290;
//    NSTimeInterval animationDuration = 0.30f;
//    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
//    [UIView setAnimationDuration:animationDuration];
//    if (offset > 0) {
//        self.frame = CGRectMake(0, -50, self.frame.size.width, self.frame.size.height);
//    }
//    [UIView commitAnimations];
//
    NSLog(@"-------%f",KDEVICEHEIGHT - 64 - inputWordImageView.frame.origin.y);
    NSLog(@"-------%f", inputWordImageView.frame.origin.y );

    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    if (textField == phoneTextField) {
        phoneNumberString = textField.text;
    }
    if (textField == passwordTextField) {
        passWordString = textField.text;
    }
    
    self.frame = CGRectMake(0, 64, self.frame.size.width, self.frame.size.height);
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
