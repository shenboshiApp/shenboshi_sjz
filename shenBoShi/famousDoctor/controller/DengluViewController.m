//
//  DengluViewController.m
//  shenBoShi
//
//  Created by 开发3 on 16/1/4.
//  Copyright © 2016年 开发3-lyp. All rights reserved.
//

#import "DengluViewController.h"
#import "personCentreController.h"

@interface DengluViewController ()<UITextFieldDelegate>
{
        UITextField *phoneNumTextField;
        UITextField *testcode;
        UIImageView *testcodeImageView;
        UIImageView *phoneNum;
//    验证码的button
        UIButton *verifyButton;
//    点击下一步的按钮
        UIButton *nextButton;
    
    NSString *phoneNumberString;
    NSString *passWordString;
    
    
    UIActivityIndicatorView *textActivityView ;
    
    
}
@end

@implementation DengluViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *navTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 40)];
    navTitle.font=[UIFont fontWithName:@"Arial-BoldMT" size:20];
    navTitle.text = @"登录";
    navTitle.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = navTitle;
    [self addTestcodeView];
    [self addPhoneNumView];
    [self addPhoneNumTextField];
    [self addTestcodeTextField];
    [self addTestButton];
    [self addLeftBarButton];
    [self addNextButton];
   
    [self addRegisterButton];
    //点击空白处，键盘消失
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
        textActivityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];

}

- (void)dismissKeyboard
{
    [phoneNumTextField resignFirstResponder];
    [testcode resignFirstResponder];
}
- (void)addRegisterButton
{
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registerBtn.frame = CGRectMake(257, 64+97+45+35+40+17, 32+30, 14);
    [registerBtn setTitleColor:[UIColor colorWithRed:208/255.0 green:208/255.0 blue:208/255.0 alpha:1.0] forState:UIControlStateNormal];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [registerBtn addTarget:self action:@selector(registerClick:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:registerBtn];
    
}

- (void)registerClick:(UIButton *)button
{

}




- (void)addTestcodeView
{
    testcodeImageView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 64+47+50, KDEVICEWIDTH - 60, 35)];
    UIEdgeInsets edge =UIEdgeInsetsMake(5.0, 30.0,5.0, 10.0);
    UIImage *  newImage = [[UIImage imageNamed:@"yzm"] resizableImageWithCapInsets:edge];
    
    
//    [phoneNum setImage:newImage];

//    testcodeImageView.image = [UIImage imageNamed:@""];
    [testcodeImageView setImage:newImage];
    testcodeImageView.userInteractionEnabled = YES;
    [self.view addSubview:testcodeImageView];
}
- (void)addPhoneNumView
{
    phoneNum = [[UIImageView alloc]initWithFrame:CGRectMake(30, 47+64, KDEVICEWIDTH - 60, 35)];
    phoneNum.userInteractionEnabled = YES;
    UIEdgeInsets edge =UIEdgeInsetsMake(5.0, 30.0,5.0, 10.0);
    UIImage *  newImage = [[UIImage imageNamed:@"shoujihaoma"] resizableImageWithCapInsets:edge];
    
    
    [phoneNum setImage:newImage];
    
    [self.view addSubview:phoneNum];
    
}
- (void)addLeftBarButton
{
    UIImage *backImage = [UIImage imageNamed:@"back@3x"];
    backImage = [backImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:backImage style:(UIBarButtonItemStylePlain) target:self action:@selector(backButton:)];
    
}

- (void)backButton:(UIButton *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addPhoneNumTextField
{
    phoneNumTextField = [[UITextField alloc]initWithFrame:CGRectMake(11+18+11, 0, KDEVICEWIDTH - 60, 35)];
    phoneNumTextField.placeholder = @"用户名";
    //phone.layer.borderColor = [[UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0] CGColor];
    [phoneNum addSubview:phoneNumTextField];
    
    phoneNumTextField.delegate = self;
}

- (void)addTestcodeTextField
{
    testcode = [[UITextField alloc]initWithFrame:CGRectMake(11+18+11, 0, KDEVICEWIDTH - 60, 35)];
    testcode.placeholder = @"密码";
    //testcode.borderStyle = UITextBorderStyleRoundedRect;
    [testcodeImageView addSubview:testcode];
    [testcode setSecureTextEntry:YES];

    testcode.delegate = self;
}

- (void)addTestButton
{
    verifyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    verifyButton.frame = CGRectMake(168+30+6+30, 64+97, 86, 35);
    [verifyButton setBackgroundImage:[UIImage imageNamed:@"gain"] forState:UIControlStateNormal];
    [verifyButton addTarget:self action:@selector(verifyButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:verifyButton];
}
- (void)addNextButton
{
    nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nextButton.frame = CGRectMake(30+10, 64+97+45+35, KDEVICEWIDTH - 80, 40);
//    [nextButton setBackgroundImage:[UIImage imageNamed:@"next"] forState:UIControlStateNormal];
    [nextButton setTitle:@"登录" forState:UIControlStateNormal];
    nextButton.backgroundColor = RGB(53, 170, 170, 1);
    nextButton.layer.masksToBounds = YES;
    nextButton.layer.cornerRadius = 5.0;
    [self.view addSubview:nextButton];
    [nextButton addTarget:self action:@selector(nextButtonClick:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)nextButtonClick:(UIButton *)button
{
    
    
    [phoneNumTextField endEditing:YES];
    [testcode endEditing:YES];
    
    
    
    
    NSLog(@"这个是登陆对吧");
    
    
    if (self._isFromDr == YES) {

    
    
    
//    if ) {
//        <#statements#>
//    }
    
    if ([phoneNumberString isEqualToString:@"admin"] && ![phoneNumberString isEqualToString:@""]) {
        if ([passWordString isEqualToString:@"123456"] && ![passWordString isEqualToString:@""]) {

            textActivityView.hidesWhenStopped = YES;
            //    button.titleLabel.t
            
            //    button.titleLabel.hidden = YES;
            textActivityView.center = CGPointMake(button.bounds.size.width/2 , button.bounds.size.height/2);//只能设置中心，不能设置大小
            [button addSubview:textActivityView];
            
            [button setTitle:@"'" forState:UIControlStateNormal];

            
            [self performSelector:@selector(delayMethod) withObject:nil afterDelay:1.5f];

            
            [textActivityView startAnimating];

            
            NSUserDefaults *stand = [NSUserDefaults standardUserDefaults];
            
            [stand setBool:YES forKey:@"_isLogIn"];

           

        }else{
            UIAlertView *ale = [[UIAlertView alloc] initWithTitle:@"提示" message:@"密码错误请重新输入" delegate:self cancelButtonTitle:@"重新输入" otherButtonTitles:nil, nil];
            [ale show];
            
        }
    }else{
        
        UIAlertView *ale = [[UIAlertView alloc] initWithTitle:@"提示" message:@"账号错误请重新输入" delegate:self cancelButtonTitle:@"重新输入" otherButtonTitles:nil, nil];
        [ale show];

        
        
    }
    
    
    
    }else{
        UIAlertView *ale = [[UIAlertView alloc] initWithTitle:@"提示" message:@"账号错误请重新输入" delegate:self cancelButtonTitle:@"重新输入" otherButtonTitles:nil, nil];
        [ale show];

    }
    
    
}



- (void)delayMethod
{
    if (self._isFromDr == YES) {
        personCentreController *personVC = [[personCentreController alloc] init];
        
        [self.navigationController pushViewController:personVC animated:YES];
        

    }else{
        UIAlertView *ale = [[UIAlertView alloc] initWithTitle:@"提示" message:@"账号错误" delegate:self cancelButtonTitle:@"重新输入" otherButtonTitles:nil, nil];
        [ale show];
        

    }
    

}
- (void)verifyButtonClick:(UIButton *)button
{
    
    NSLog(@"这是什么？是验证码么");
//    __block int timeout=60; //倒计时时间
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
//    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
//    dispatch_source_set_event_handler(_timer, ^{
//        if(timeout<=-1){ //倒计时结束，关闭
//            dispatch_source_cancel(_timer);
//            dispatch_async(dispatch_get_main_queue(), ^{
//                
//                [verifyButton setTitle:[NSString stringWithFormat:@"重新获取"] forState:UIControlStateNormal];
//                verifyButton.userInteractionEnabled = YES;
//                [verifyButton addTarget:self action:@selector(sendSmsFail:) forControlEvents:UIControlEventTouchUpInside];
//                 verifyButton.userInteractionEnabled = YES;
//                [verifyButton setTitleColor:RGB(73.0, 178.0, 224.0, 1) forState:UIControlStateNormal];
//            });
//            
//        }else{
//            
//            int seconds = timeout % 120;
//            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
//            dispatch_async(dispatch_get_main_queue(), ^{
//                
//                [verifyButton setTitle:[NSString stringWithFormat:@"%@秒后重新获取",strTime] forState:UIControlStateNormal];
//                 verifyButton.userInteractionEnabled = NO;
//                [verifyButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//                verifyButton.userInteractionEnabled = NO;
//                [verifyButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
//            });
//            timeout--;
//        }
//    });
//    dispatch_resume(_timer);
}


//- (UIImage *)resizableImageWithCapInsets:(UIEdgeInsets)capInsets resizingMode:(UIImageResizingMode)resizingMode  ;


//- (UIImage *)getImageWithEdge : (UIEdgeInsets)Edge
//                        image : (UIImage *)image
//{
//    
//}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    if (textField == phoneNumTextField) {
        phoneNumberString = textField.text;
        
    }else if (textField == testcode){
        passWordString = textField.text;
    }
    
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [textField endEditing:YES];
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
