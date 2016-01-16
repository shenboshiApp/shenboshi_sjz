//
//  RegisterClientView.m
//  RegisterProject
//
//  Created by 开发4 on 16/1/10.
//  Copyright © 2016年 开发4. All rights reserved.
//

#import "RegisterClientView.h"

#import "UIView+UIViewController.h"
#import "NJImageCropperViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#define ORIGINAL_MAX_WIDTH 180.0f

#define LeftMarginSpace 10
#define TopMarginSpace 15
#define NavHeight 64


@interface RegisterClientView ()<UIImagePickerControllerDelegate,UIActionSheetDelegate,NJImageCropperDelegate,UINavigationControllerDelegate>
{
    CGFloat keyBoardHeight;
    UITextField *activityTextField;
}
//控制器点完成
@property (nonatomic,strong) UIScrollView *mainScrollView;
@end
@implementation RegisterClientView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self addNotification];
        [self addSubview:self.mainScrollView];
    }
    return self;
}



- (void)setFinsh:(BOOL)finsh
{
    if (_finsh != finsh) {
        _finsh = finsh;
        
        if (self._isFinished == YES) {
//            activityTextField = nil;
            
//            [self textFieldDidEndEditing:activityTextField];
            [activityTextField endEditing:YES];
        }
        
    }
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];

}

- (void)addNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillHiden:) name:UIKeyboardWillHideNotification object:nil];
    

    
}

- (void)keyBoardWillShow: (NSNotification *)aNotification
{
    
    NSLog(@"键盘即将出现");
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    //
    
    
    NSLog(@"%@",NSStringFromCGSize(kbSize));
    
    keyBoardHeight = kbSize.height;

    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    self.mainScrollView.contentInset = contentInsets;
    self.mainScrollView.scrollIndicatorInsets = contentInsets;

    CGRect aRect = self.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, activityTextField.frame.origin) ) {
        CGPoint scrollPoint = CGPointMake(0.0, activityTextField.frame.origin.y-kbSize.height);
        [self.mainScrollView setContentOffset:scrollPoint animated:YES];
        

    }
    
    
}


- (void)keyBoardWillHiden: (NSNotification *)aNotification
{
    
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.mainScrollView.contentInset = contentInsets;
    self.mainScrollView.scrollIndicatorInsets = contentInsets;

}


-(UIScrollView *)mainScrollView
{
    if (!_mainScrollView) {
        _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KDEVICEWIDTH, KDEVICEHEIGHT)];
        _mainScrollView.backgroundColor = [UIColor whiteColor];
        
        _mainScrollView.contentSize = CGSizeMake(KDEVICEWIDTH, KDEVICEHEIGHT);
        
        
        [_mainScrollView addSubview:self.realNameL];//真实姓名
        [_mainScrollView addSubview:self.realNameT];
        [_mainScrollView addSubview:self.ageL];//年龄
        [_mainScrollView addSubview:self.ageT];
        [_mainScrollView addSubview:self.sexL];//性别
        [_mainScrollView addSubview:self.manBtn];
        [_mainScrollView addSubview:self.manL];
        [_mainScrollView addSubview:self.womanBtn];
        [_mainScrollView addSubview:self.womanL];
        
        [_mainScrollView addSubview:self.idNumL];//身份证号
        [_mainScrollView addSubview:self.idNumT];
        [_mainScrollView addSubview:self.companyNameL];//单位名称
        [_mainScrollView addSubview:self.companyNameT];
        [_mainScrollView addSubview:self.departmentNameL];//科室名称
        [_mainScrollView addSubview:self.departmentNameT];
        [_mainScrollView addSubview:self.positionSituationL];//职称情况
        [_mainScrollView addSubview:self.positionSituationT];
        [_mainScrollView addSubview:self.phoneNumberL];//手机号码
        [_mainScrollView addSubview:self.phoneNumberT];
        [_mainScrollView addSubview:self.testCodeL];//验证码
        [_mainScrollView addSubview:self.testCodeT];
        [_mainScrollView addSubview:self.doctorLicenseL];//医师执照
        [_mainScrollView addSubview:self.doctorLicenseT];
        [_mainScrollView addSubview:self.getTestCode];//获取手机验证码
        [_mainScrollView addSubview:self.uploadDoctorLicenseL];//上传医师执照照片
        [_mainScrollView addSubview:self.photo];//上传照片按钮
        

        
        
    }
    return _mainScrollView;
}



- (UILabel *)realNameL
{
    if (_realNameL == nil) {
        _realNameL = [[UILabel alloc]initWithFrame:CGRectMake(LeftMarginSpace, TopMarginSpace +8 +NavHeight, 60, 14)];
        _realNameL.text = @"真实姓名";
        _realNameL.font = [UIFont systemFontOfSize:15.0];
        
    }
    return _realNameL;
}
- (UITextField *)realNameT
{
    if (_realNameT == nil) {
        _realNameT = [[UITextField alloc]initWithFrame:CGRectMake(90, TopMarginSpace +NavHeight, 220 * A_WIDTH, 30)];
        //_realNameT.borderStyle = UITextBorderStyleRoundedRect;
        _realNameT.layer.cornerRadius = 5.0f;
        _realNameT.layer.masksToBounds = YES;
        _realNameT.layer.borderColor = [UIColor colorWithRed:93/255.0 green:187/255.0 blue:187/255.0 alpha:1.0].CGColor; // set color as you want.
        _realNameT.layer.borderWidth = 1.0; // set borderWidth as you want.
        
        _realNameT.delegate = self;

        
    }
    return _realNameT;
}
- (UILabel *)ageL
{
    if (_ageL == nil) {
        _ageL = [[UILabel alloc]initWithFrame:CGRectMake(LeftMarginSpace, _realNameL.frame.origin.y +14+26, 30, 14)];
        _ageL.text = @"年龄";
        _ageL.font = [UIFont systemFontOfSize:15.0];
    }
    return _ageL;
}
- (UITextField *)ageT
{
    if (_ageT == nil) {
        _ageT = [[UITextField alloc]initWithFrame:CGRectMake(90, _realNameT.frame.origin.y +40, 220 * A_WIDTH, 30)];
        //_realNameT.borderStyle = UITextBorderStyleRoundedRect;
        _ageT.layer.cornerRadius = 5.0f;
        _ageT.layer.masksToBounds = YES;
        _ageT.layer.borderColor = [UIColor colorWithRed:93/255.0 green:187/255.0 blue:187/255.0 alpha:1.0].CGColor; // set color as you want.
        _ageT.layer.borderWidth = 1.0; // set borderWidth as you want.
        
        _ageT.delegate = self;
    }
    return _ageT;
}
- (UILabel *)sexL
{
    if (_sexL == nil) {
        _sexL = [[UILabel alloc]initWithFrame:CGRectMake(LeftMarginSpace, _ageL.frame.origin.y +14+26, 30, 14)];
        _sexL.text = @"性别";
        _sexL.font = [UIFont systemFontOfSize:15.0];
    }
    return _sexL;
}

- (UIButton *)manBtn
{
    if (_manBtn == nil) {
        _manBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _manBtn.frame = CGRectMake(90, _ageT.frame.origin.y +30 +10, 18, 18);
        [_manBtn setBackgroundImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
        [_manBtn addTarget:self action:@selector(manClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _manBtn;
}
- (UILabel *)manL
{
    if (_manL == nil) {
        _manL = [[UILabel alloc]initWithFrame:CGRectMake(90 +19, _ageT.frame.origin.y +30 +12, 16, 15)];
        _manL.text = @"男";
        _manL.font = [UIFont systemFontOfSize:15.0];
    }
    return _manL;
}
- (UIButton *)womanBtn
{
    if (_womanBtn == nil) {
        _womanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _womanBtn.frame = CGRectMake(135 +18, _ageT.frame.origin.y +30 +10, 18, 18);
        [_womanBtn setBackgroundImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
        [_womanBtn addTarget:self action:@selector(womanClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _womanBtn;
}
- (UILabel *)womanL
{
    if (_womanL == nil) {
        _womanL = [[UILabel alloc]initWithFrame:CGRectMake(135+18+19, _ageT.frame.origin.y +30 +12, 16, 15)];
        _womanL.text = @"女";
        _womanL.font = [UIFont systemFontOfSize:15.0];
    }
    return _womanL;
}
//身份证号
- (UILabel *)idNumL
{
    if (_idNumL == nil) {
        _idNumL = [[UILabel alloc]initWithFrame:CGRectMake(LeftMarginSpace, _sexL.frame.origin.y +14+20, 60, 14)];
        _idNumL.text = @"身份证号";
        _idNumL.font = [UIFont systemFontOfSize:15.0];
    }
    return _idNumL;
}
- (UITextField *)idNumT
{
    if (_idNumT == nil) {
        _idNumT = [[UITextField alloc]initWithFrame:CGRectMake(90, _ageT.frame.origin.y +30 +42, 220 * A_WIDTH, 30)];
        //_realNameT.borderStyle = UITextBorderStyleRoundedRect;
        _idNumT.layer.cornerRadius = 5.0f;
        _idNumT.layer.masksToBounds = YES;
        _idNumT.layer.borderColor = [UIColor colorWithRed:93/255.0 green:187/255.0 blue:187/255.0 alpha:1.0].CGColor; // set color as you want.
        _idNumT.layer.borderWidth = 1.0; // set borderWidth as you want.
        
        _idNumT.delegate = self;
    }
    return _idNumT;
}
//单位名称
- (UILabel *)companyNameL
{
    if (_companyNameL == nil) {
        _companyNameL = [[UILabel alloc]initWithFrame:CGRectMake(LeftMarginSpace, _idNumL.frame.origin.y +14+26, 60, 14)];
        _companyNameL.text = @"单位名称";
        _companyNameL.font = [UIFont systemFontOfSize:15.0];
    }
    return _companyNameL;
}
- (UITextField *)companyNameT
{
    if (_companyNameT == nil) {
        _companyNameT = [[UITextField alloc]initWithFrame:CGRectMake(90, _idNumT.frame.origin.y +40, 220 * A_WIDTH, 30)];
        //_realNameT.borderStyle = UITextBorderStyleRoundedRect;
        _companyNameT.layer.cornerRadius = 5.0f;
        _companyNameT.layer.masksToBounds = YES;
        _companyNameT.layer.borderColor = [UIColor colorWithRed:93/255.0 green:187/255.0 blue:187/255.0 alpha:1.0].CGColor; // set color as you want.
        _companyNameT.layer.borderWidth = 1.0; // set borderWidth as you want.
        
        _companyNameT.delegate = self;
    }
    return _companyNameT;
}

//科室名称
- (UILabel *)departmentNameL
{
    if (_departmentNameL == nil) {
        _departmentNameL = [[UILabel alloc]initWithFrame:CGRectMake(LeftMarginSpace, _companyNameL.frame.origin.y +14+26, 60, 14)];
        _departmentNameL.text = @"科室名称";
        _departmentNameL.font = [UIFont systemFontOfSize:15.0];
    }
    return _departmentNameL;
}


- (UITextField *)departmentNameT
{
    if (_departmentNameT == nil) {
        _departmentNameT = [[UITextField alloc]initWithFrame:CGRectMake(90, _companyNameT.frame.origin.y +40, 220 * A_WIDTH, 30)];
        //_realNameT.borderStyle = UITextBorderStyleRoundedRect;
        _departmentNameT.layer.cornerRadius = 5.0f;
        _departmentNameT.layer.masksToBounds = YES;
        _departmentNameT.layer.borderColor = [UIColor colorWithRed:93/255.0 green:187/255.0 blue:187/255.0 alpha:1.0].CGColor; // set color as you want.
        _departmentNameT.layer.borderWidth = 1.0; // set borderWidth as you want.
        
        _departmentNameT.delegate = self;
    }
    return _departmentNameT;
}



//职称情况
- (UILabel *)positionSituationL
{
    if (_positionSituationL == nil) {
        _positionSituationL = [[UILabel alloc]initWithFrame:CGRectMake(LeftMarginSpace, _departmentNameL.frame.origin.y +14+26, 60, 14)];
        _positionSituationL.text = @"职称情况";
        _positionSituationL.font = [UIFont systemFontOfSize:15.0];
    }
    return _positionSituationL;
}
- (UITextField *)positionSituationT
{
    if (_positionSituationT == nil) {
        _positionSituationT = [[UITextField alloc]initWithFrame:CGRectMake(90, _departmentNameT.frame.origin.y +40, 220 * A_WIDTH, 30)];
        //_realNameT.borderStyle = UITextBorderStyleRoundedRect;
        _positionSituationT.layer.cornerRadius = 5.0f;
        _positionSituationT.layer.masksToBounds = YES;
        _positionSituationT.layer.borderColor = [UIColor colorWithRed:93/255.0 green:187/255.0 blue:187/255.0 alpha:1.0].CGColor; // set color as you want.
        _positionSituationT.layer.borderWidth = 1.0; // set borderWidth as you want.
        
        _positionSituationT.delegate = self;
    }
    return _positionSituationT;
}
//手机号码
- (UILabel *)phoneNumberL
{
    if (_phoneNumberL == nil) {
        _phoneNumberL = [[UILabel alloc]initWithFrame:CGRectMake(LeftMarginSpace, _positionSituationL.frame.origin.y +14+26, 60, 14)];
        _phoneNumberL.text = @"手机号码";
        _phoneNumberL.font = [UIFont systemFontOfSize:15.0];
    }
    return _phoneNumberL;
}
- (UITextField *)phoneNumberT
{
    if (_phoneNumberT == nil) {
        _phoneNumberT = [[UITextField alloc]initWithFrame:CGRectMake(90, _positionSituationT.frame.origin.y +40, 130 *A_WIDTH, 30)];
        //_realNameT.borderStyle = UITextBorderStyleRoundedRect;
        _phoneNumberT.layer.cornerRadius = 5.0f;
        _phoneNumberT.layer.masksToBounds = YES;
        _phoneNumberT.layer.borderColor = [UIColor colorWithRed:93/255.0 green:187/255.0 blue:187/255.0 alpha:1.0].CGColor; // set color as you want.
        _phoneNumberT.layer.borderWidth = 1.0; // set borderWidth as you want.
        
        _phoneNumberT.delegate = self;
    }
    return _phoneNumberT;
}
//获取验证码
- (UIButton *)getTestCode
{
    if (_getTestCode == nil) {
        _getTestCode = [UIButton buttonWithType:UIButtonTypeCustom];
        _getTestCode.frame = CGRectMake(_phoneNumberT.frame.origin.x +140 * A_WIDTH, _positionSituationT.frame.origin.y +40, 79, 30);
        _getTestCode.layer.cornerRadius = 5.0f;
        _getTestCode.backgroundColor = [UIColor colorWithRed:210/225.0 green:210/225.0 blue:210/225.0 alpha:1.0];
        _getTestCode.titleLabel.font = [UIFont systemFontOfSize:10.0];
        [_getTestCode setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_getTestCode setTitle:@"获取手机验证码" forState:UIControlStateNormal];
        [_getTestCode.layer setCornerRadius:5.0f];
        [_getTestCode.layer setBorderWidth:1.0];
        [_getTestCode.layer setBorderColor:[UIColor colorWithRed:93/255.0 green:187/255.0 blue:187/255.0 alpha:1.0].CGColor];
        [_getTestCode addTarget:self action:@selector(testButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _getTestCode;
}
//验证码
- (UILabel *)testCodeL
{
    if (_testCodeL == nil) {
        _testCodeL = [[UILabel alloc]initWithFrame:CGRectMake(LeftMarginSpace, _phoneNumberL.frame.origin.y +14+26, 60, 14)];
        _testCodeL.text = @"验证码";
        _testCodeL.font = [UIFont systemFontOfSize:15.0];
    }
    return _testCodeL;
}
- (UITextField *)testCodeT
{
    if (_testCodeT == nil) {
        _testCodeT = [[UITextField alloc]initWithFrame:CGRectMake(90, _phoneNumberT.frame.origin.y +40, 220 * A_WIDTH, 30)];
        //_realNameT.borderStyle = UITextBorderStyleRoundedRect;
        _testCodeT.layer.cornerRadius = 5.0f;
        _testCodeT.layer.masksToBounds = YES;
        _testCodeT.layer.borderColor = [UIColor colorWithRed:93/255.0 green:187/255.0 blue:187/255.0 alpha:1.0].CGColor; // set color as you want.
        _testCodeT.layer.borderWidth = 1.0; // set borderWidth as you want.
        
        _testCodeT.delegate = self;
    }
    return _testCodeT;
}
//医生执照
- (UILabel *)doctorLicenseL
{
    if (_doctorLicenseL == nil) {
        _doctorLicenseL = [[UILabel alloc]initWithFrame:CGRectMake(LeftMarginSpace, _testCodeL.frame.origin.y +14+26, 60, 14)];
        _doctorLicenseL.text = @"医师执照";
        _doctorLicenseL.font = [UIFont systemFontOfSize:15.0];
    }
    return _doctorLicenseL;
}
- (UITextField *)doctorLicenseT
{
    if (_doctorLicenseT == nil) {
        _doctorLicenseT = [[UITextField alloc]initWithFrame:CGRectMake(90, _testCodeT.frame.origin.y +40, 220 * A_WIDTH, 30)];
        //_realNameT.borderStyle = UITextBorderStyleRoundedRect;
        _doctorLicenseT.layer.cornerRadius = 5.0f;
        _doctorLicenseT.layer.masksToBounds = YES;
        _doctorLicenseT.layer.borderColor = [UIColor colorWithRed:93/255.0 green:187/255.0 blue:187/255.0 alpha:1.0].CGColor; // set color as you want.
        _doctorLicenseT.layer.borderWidth = 1.0; // set borderWidth as you want.
        
        _doctorLicenseT.delegate = self;
    }
    return _doctorLicenseT;
}
- (UILabel *)uploadDoctorLicenseL
{
    if (_uploadDoctorLicenseL == nil) {
        _uploadDoctorLicenseL = [[UILabel alloc]initWithFrame:CGRectMake(LeftMarginSpace, _doctorLicenseL.frame.origin.y +14 +26, 124, 14)];
        _uploadDoctorLicenseL.text = @"上传医师执照照片";
        _uploadDoctorLicenseL.font = [UIFont systemFontOfSize:15.0];
    }
    return _uploadDoctorLicenseL;
}
//上传医生执照照片
- (UIButton *)photo
{
    if (_photo == nil) {
        _photo = [UIButton buttonWithType:UIButtonTypeCustom];
        _photo.frame = CGRectMake(_uploadDoctorLicenseL.frame.origin.x +123 +57, _doctorLicenseT.frame.origin.y +30 +21, 80, 80);
        [_photo setBackgroundImage:[UIImage imageNamed:@"上传照片"] forState:UIControlStateNormal];
        [_photo addTarget:self action:@selector(photoClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _photo;
}
//textfield的代理方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_realNameT resignFirstResponder];
    [_ageT resignFirstResponder];
    [_idNumT resignFirstResponder];
    [_companyNameT resignFirstResponder];
    [_departmentNameT resignFirstResponder];
    [_positionSituationT resignFirstResponder];
    [_phoneNumberT resignFirstResponder];
    [_testCodeT resignFirstResponder];
    [_doctorLicenseT resignFirstResponder];
    
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    activityTextField = textField;
    if ([textField.text isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
    }
//    CGRect textFrame = _departmentNameT.frame;
//    CGPoint textPoint = [textField convertPoint:CGPointMake(0, textField.frame.size.height) toView:self];     //这个必须写,一定要转换
//    float offset = textPoint.y +textFrame.size.height - (self.frame.size.height +64) +290;
//    NSTimeInterval animationDuration = 0.30f;
//    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
//    [UIView setAnimationDuration:animationDuration];
//    if (offset > 0) {
//        self.frame = CGRectMake(0, -200, self.frame.size.width, self.frame.size.height);
//    }
//    [UIView commitAnimations];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    activityTextField = nil;
//    self.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}


//按钮点击事件
- (void)testButtonClick:(UIButton *)button
{

    
}
- (void)photoClick:(UIButton *)button
{

    
    
    
    UIActionSheet *choiceSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"拍照", @"从相册中选取", nil];
    [choiceSheet showInView:self];

    
    NSLog(@"添加zhaopian");
}
- (void)manClick:(UIButton *)button
{
    
    _womanBtn.selected = NO;
    button.selected = !button.selected;
//    isSelected = !isSelected;
    if (_womanBtn.selected) {
        [_womanBtn setBackgroundImage:[UIImage imageNamed:@"point"] forState:UIControlStateNormal];
    }else{
        [_womanBtn setBackgroundImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
    }

    
    if (button.selected) {
        [_manBtn setBackgroundImage:[UIImage imageNamed:@"point"] forState:UIControlStateNormal];
    }else{
        [_manBtn setBackgroundImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];

    }
    
}
- (void)womanClick:(UIButton *)button
{
//    isSelected = !isSelected;
    button.selected = !button.selected;
    _manBtn.selected = NO;
    
    if (_manBtn.selected) {
        [_manBtn setBackgroundImage:[UIImage imageNamed:@"point"] forState:UIControlStateNormal];
    }else{
        [_manBtn setBackgroundImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
        
    }

    
    if (button.selected) {
        [_womanBtn setBackgroundImage:[UIImage imageNamed:@"point"] forState:UIControlStateNormal];
    }else{
        [_womanBtn setBackgroundImage:[UIImage imageNamed:@"circle"] forState:UIControlStateNormal];
    }
}






#pragma mark ---添加的手势以及头像的修改
//- (void)editPortrait {
//}
#pragma mark VPImageCropperDelegate
- (void)imageCropper:(NJImageCropperViewController *)cropperViewController didFinished:(UIImage *)editedImage {
//    self.portraitImageView.image = editedImage;
    
    
    
    [_photo setImage:editedImage forState:UIControlStateNormal];
    
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
        // TO DO
    }];
}

- (void)imageCropperDidCancel:(NJImageCropperViewController *)cropperViewController {
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
    }];
}

#pragma mark UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        // 拍照
        if ([self isCameraAvailable] && [self doesCameraSupportTakingPhotos]) {
            UIImagePickerController *controller = [[UIImagePickerController alloc] init];
            controller.sourceType = UIImagePickerControllerSourceTypeCamera;
            if ([self isFrontCameraAvailable]) {
                controller.cameraDevice = UIImagePickerControllerCameraDeviceFront;
            }
            NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
            [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
            controller.mediaTypes = mediaTypes;
            controller.delegate = self;
            [self.viewController presentViewController:controller
                               animated:YES
                             completion:^(void){
                                 NSLog(@"Picker View Controller is presented");
                             }];
        }
        
    } else if (buttonIndex == 1) {
        // 从相册中选取
        if ([self isPhotoLibraryAvailable]) {
            UIImagePickerController *controller = [[UIImagePickerController alloc] init];
            controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
            [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
            controller.mediaTypes = mediaTypes;
            controller.delegate = self;
            [self.viewController presentViewController:controller
                               animated:YES
                             completion:^(void){
                                 NSLog(@"Picker View Controller is presented");
                             }];
        }
    }
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    [picker dismissViewControllerAnimated:NO completion:^() {
        
        
        
        UIImage *portraitImg = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        portraitImg = [self imageByScalingToMaxSize:portraitImg];
        
        
        
        // 裁剪
        NJImageCropperViewController *imgEditorVC = [[NJImageCropperViewController alloc] initWithImage:portraitImg cropFrame:CGRectMake(0, 100.0f, self.frame.size.width, self.frame.size.width) limitScaleRatio:3.0];
        imgEditorVC.delegate = self;
        
        
        
        [self.viewController presentViewController:imgEditorVC animated:NO completion:^{
            // TO DO
            //
        }];
        
        
        
    }];
    
    
}



- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^(){
    }];
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
}

#pragma mark camera utility
- (BOOL) isCameraAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL) isRearCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}

- (BOOL) isFrontCameraAvailable {
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}

- (BOOL) doesCameraSupportTakingPhotos {
    return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL) isPhotoLibraryAvailable{
    return [UIImagePickerController isSourceTypeAvailable:
            UIImagePickerControllerSourceTypePhotoLibrary];
}
- (BOOL) canUserPickVideosFromPhotoLibrary{
    return [self
            cameraSupportsMedia:(__bridge NSString *)kUTTypeMovie sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}
- (BOOL) canUserPickPhotosFromPhotoLibrary{
    return [self
            cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (BOOL) cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType{
    __block BOOL result = NO;
    if ([paramMediaType length] == 0) {
        return NO;
    }
    NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:paramMediaType]){
            result = YES;
            *stop= YES;
        }
    }];
    return result;
}

#pragma mark image scale utility
- (UIImage *)imageByScalingToMaxSize:(UIImage *)sourceImage {
    if (sourceImage.size.width < ORIGINAL_MAX_WIDTH) return sourceImage;
    CGFloat btWidth = 0.0f;
    CGFloat btHeight = 0.0f;
    if (sourceImage.size.width > sourceImage.size.height) {
        btHeight = ORIGINAL_MAX_WIDTH;
        btWidth = sourceImage.size.width * (ORIGINAL_MAX_WIDTH / sourceImage.size.height);
    } else {
        btWidth = ORIGINAL_MAX_WIDTH;
        btHeight = sourceImage.size.height * (ORIGINAL_MAX_WIDTH / sourceImage.size.width);
    }
    CGSize targetSize = CGSizeMake(btWidth, btHeight);
    return [self imageByScalingAndCroppingForSourceImage:sourceImage targetSize:targetSize];
}

- (UIImage *)imageByScalingAndCroppingForSourceImage:(UIImage *)sourceImage targetSize:(CGSize)targetSize {
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor > heightFactor)
            scaleFactor = widthFactor; // scale to fit height
        else
            scaleFactor = heightFactor; // scale to fit width
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else
            if (widthFactor < heightFactor)
            {
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
            }
    }
    UIGraphicsBeginImageContext(targetSize); // this will crop
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil) NSLog(@"could not scale image");
    
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    return newImage;
}


@end
