//
//  homePageView.m
//  shenBoShi
//
//  Created by 开发3 on 15/12/23.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import "homePageView.h"
#import "UIView+UIViewController.h"
#import "NearDrViewController.h"
#import "MingYiViewController.h"
#import "personCentreController.h"
#import "ClientConsultViewController.h"
#import "DengluViewController.h"
//#import "HuanZheViewController.h"
#import "ClientConsultViewController.h"
#import "LoginViewController.h"
@implementation homePageView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame] ) {
        
        [self addSubview:self.bottomView];
        [self addSubview:self.firstImageView];
//        [self addSubview:self.secondImageView];
        [self addSubview:self.centerCircleView];
        [self addSubview:self.centerImageView];
        
        
    }
    return self;

}

//中间的logo

-(UIImageView *)logoImageView
{
    if (_logoImageView == nil) {
        _logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 20,286.5, 40, 40)];
        [_logoImageView setImage:[UIImage imageNamed:@"小博士"]];
        _logoImageView.layer.masksToBounds = YES;
        _logoImageView.layer.cornerRadius = 20;
        
        
        
    }
    return _logoImageView;
}

//最底下的大圆
-(UIImageView *)firstImageView
{
    if (_firstImageView == nil) {
        _firstImageView = [[UIImageView alloc] initWithFrame:CGRectMake(KDEVICEWIDTH/2 -121.25,KDEVICEHEIGHT - 40 - 242.5,242.5, 242.5)];
        [_firstImageView setImage:[UIImage imageNamed:@"third-circle"]];
        _firstImageView.layer.masksToBounds = YES;
        _firstImageView.layer.cornerRadius = 121.25;
        [_firstImageView addSubview:self.secondImageView];
        
    }
    return _firstImageView;
}




//中心园
-(UIImageView *)centerCircleView
{
    if (_centerCircleView == nil) {
        _centerCircleView = [[UIImageView alloc] initWithFrame:CGRectMake(KDEVICEWIDTH/2 - 35.25, KDEVICEHEIGHT - 196.5, 71, 71)];
//        UIPanGestureRecognizer *panImageView = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewPan:)];
//        _centerImageView.userInteractionEnabled = YES;
//        [_centerImageView addGestureRecognizer:panImageView];
        [_centerCircleView setImage:[UIImage imageNamed:@"中心园"]];
        _centerCircleView.layer.masksToBounds = YES;
        _centerCircleView.layer.cornerRadius = 35.25;
        [self addSubview:self.centerCircleView];
//        self.halo = [BSCallDrAnimation layer];
//        self.halo.position = _centerImageView.center;
//        [self.layer insertSublayer:self.halo below:_centerImageView.layer];
        
        
//        [self performSelector:@selector(aaa:) onThread:  withObject:<#(nullable id)#> waitUntilDone:<#(BOOL)#>]
//        []
        
    }
    return _centerCircleView;
}



//二层圆

-(UIImageView *)secondImageView
{
    if (_secondImageView == nil) {
        _secondImageView = [[UIImageView alloc] initWithFrame:CGRectMake((242.5 -157.5)/2,(242.5 - 157.5)/2, 157.5, 157.5)];
        [_secondImageView setImage:[UIImage imageNamed:@"erceng"]];
        
        _secondImageView.layer.masksToBounds = YES;
        _secondImageView.layer.cornerRadius = 78.75;
        
    }
    return _secondImageView;
}


-(UIImageView *)bottomView
{
    if (_bottomView == nil) {
        _bottomView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64)];
        [_bottomView setImage:[UIImage imageNamed:@"banner"]];
    }
    return _bottomView;
}
-(UIImageView *)centerImageView
{
    if (_centerImageView == nil) {
        _centerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(KDEVICEWIDTH/2 - 17.625, KDEVICEHEIGHT - 196.5+ 35.5/2, 35.5, 35.5)];
        UIPanGestureRecognizer *panImageView = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewPan:)];
        _centerImageView.userInteractionEnabled = YES;
        [_centerImageView addGestureRecognizer:panImageView];
        [_centerImageView setImage:[UIImage imageNamed:@"doctor"]];
        _centerImageView.layer.masksToBounds = YES;
        _centerImageView.layer.cornerRadius = 17.65;
        [self addSubview:_centerImageView];
        self.halo = [BSCallDrAnimation layer];
        self.halo.position = _centerImageView.center;
        [self.layer insertSublayer:self.halo below:_centerImageView.layer];
        

    }
    return _centerImageView;
}

- (void)imageViewPan: (UIPanGestureRecognizer *)panGesture
{
    
    if (panGesture.state != UIGestureRecognizerStateEnded){
        
        if ((panGesture.view.center.x - KDEVICEWIDTH/2 )*(panGesture.view.center.x - KDEVICEWIDTH/2) + (panGesture.view.center.y - KDEVICEHEIGHT+196.5 - 35.5 - 35.25) * (panGesture.view.center.y - KDEVICEHEIGHT+196.5 - 35.25 *2) < 100 * 100 && flag == 0) {
            
            x = 0;
            y = 0;
            CGPoint point = [panGesture translationInView:self];
            NSLog(@"---%f,---%f",point.x,point.y);
            panGesture.view.center = CGPointMake(panGesture.view.center.x + point.x, panGesture.view.center.y + point.y);
            [panGesture setTranslation:CGPointMake(0, 0) inView:self];
            NSLog(@"xxxxxxxxx=====%f=======yyyy===%f",x,y);
            
            x = panGesture.view.center.x + point.x;
            y = panGesture.view.center.y + point.y;
            
            
        }else if((panGesture.view.center.x - KDEVICEWIDTH/2 )*(panGesture.view.center.x - KDEVICEWIDTH/2 ) + (panGesture.view.center.y - KDEVICEHEIGHT + 196.5-35.25) * (panGesture.view.center.y - KDEVICEHEIGHT + 196.5 - 35.25 * 2) >  100 * 100){
            flag = 1;
            
            NSLog(@"+++++++++%f=====%f",x,y);
            
            self.centerImageView.frame =  CGRectMake(KDEVICEWIDTH/2 - 17.65, KDEVICEHEIGHT - 196.5 + 35.5/2, 35.5,35.5 );
            
        }

    }else{
        NSLog(@"========%f,=======%f",x,y);
        [self rockerValueChanged];

        flag = 0;
        self.centerImageView.frame =  CGRectMake(KDEVICEWIDTH/2 - 17.65, KDEVICEHEIGHT - 196.5 + 35.5/2, 35.5,35.5 );
        
    }



}



//
//if ([userDefaults objectForKey:@"phone"] != nil && [userDefaults objectForKey:@"passWord"] != nil) {
//    
//    phoneNumberString =[userDefaults objectForKey:@"phone"];
//    passWordString = [userDefaults objectForKey:@"passWord"];
//    
//    phoneTextField.text = phoneNumberString;
//    passwordTextField.text = passWordString;
//    
//}


- (void)rockerValueChanged
{
    x =  x - KDEVICEWIDTH/2;
    y =  KDEVICEHEIGHT - 161.25 - y;
    float arc = atan2f(y,x);
    if ((arc > (2.0f/4.0f)*M_PI &&  arc < M_PI) || (arc < -(5.0f/6.0f)*M_PI &&  arc > -M_PI)) {
        NSLog(@"-------left");
        
        NSUserDefaults *stand = [NSUserDefaults standardUserDefaults];
        
        
        
        if ([stand boolForKey:@"_isLogIn"] && [stand objectForKey:@"phone"] == nil && [stand objectForKey:@"passWord"] == nil) {
            personCentreController * person=[[personCentreController alloc]init];
            [self.viewController.navigationController pushViewController:person animated:YES];

        }else{
//            personCentreController *dengluVC = [[personCentreController alloc] init];
////            dengluVC._isFromDr = YES;
//            [self.viewController.navigationController pushViewController:dengluVC animated:YES];
            
            
            if([stand boolForKey:@"_isLogIn"] ) {
                personCentreController * person=[[personCentreController alloc]init];
                [self.viewController.navigationController pushViewController:person animated:YES];

            }else{
                    LoginViewController *loginVC = [[LoginViewController alloc] init];
                    [self.viewController.navigationController pushViewController:loginVC animated:YES];
            }

        }
        

        
        
//        MingYiViewController *mingVC = [[MingYiViewController alloc] init];
//
//        [self.viewController.navigationController pushViewController:mingVC animated:YES];
        
        
        
        
    }else if (arc > -(1.0f/6.0f)*M_PI || (arc < (3.0f/4.0f)*M_PI && arc > 0)) {
        NSLog(@"-------right，附近医生");
//        ClientConsultViewController *clientVC = [[ClientConsultViewController alloc] init];
//        [self.viewController.navigationController pushViewController:clientVC animated:YES];
       
        DengluViewController *dengluClient = [[DengluViewController alloc] init];
        [self.viewController.navigationController pushViewController:dengluClient animated:YES];
        
        
    }else if (arc < -(1.0f/6.0f)*M_PI &&  arc > -(5.0f/6.0f)*M_PI) {
        NSLog(@"-------down");
        NSLog(@"-------down");
//        personCentreController * person=[[personCentreController alloc]init];
//        [self.viewController.navigationController pushViewController:person animated:YES];
        ClientConsultViewController *client = [[ClientConsultViewController alloc] init];
        [self.viewController.navigationController pushViewController:client animated:YES];

        
    }
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/




@end
