//
//  RegisterClientView.h
//  RegisterProject
//
//  Created by 开发4 on 16/1/10.
//  Copyright © 2016年 开发4. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterClientView : UIView<UITextFieldDelegate>
{
    BOOL isSelected;
}
//Lable
@property (nonatomic, strong) UILabel *realNameL;//真实姓名
@property (nonatomic, strong) UILabel *ageL;//年龄
@property (nonatomic, strong) UILabel *sexL;//性别
@property (nonatomic, strong) UIButton *manBtn;
@property (nonatomic, strong) UILabel *manL;
@property (nonatomic, strong) UIButton *womanBtn;
@property (nonatomic, strong) UILabel *womanL;
@property (nonatomic, strong) UILabel *idNumL;//身份证号
@property (nonatomic, strong) UILabel *companyNameL;//单位名称
@property (nonatomic, strong) UILabel *departmentNameL;//科室名称
@property (nonatomic, strong) UILabel *positionSituationL;//职称情况
@property (nonatomic, strong) UILabel *phoneNumberL;//手机号码
@property (nonatomic, strong) UILabel *testCodeL;//验证码
@property (nonatomic, strong) UILabel *doctorLicenseL;//医师执照
@property (nonatomic, strong) UILabel *uploadDoctorLicenseL;//上传医师执照

//TextField
@property (nonatomic, strong) UITextField *realNameT;//真实姓名
@property (nonatomic, strong) UITextField *ageT;//年龄
@property (nonatomic, strong) UITextField *sexT;//性别
@property (nonatomic, strong) UITextField *idNumT;//身份证号
@property (nonatomic, strong) UITextField *companyNameT;//单位名称
@property (nonatomic, strong) UITextField *departmentNameT;//科室名称
@property (nonatomic, strong) UITextField *positionSituationT;//职称情况
@property (nonatomic, strong) UITextField *phoneNumberT;//手机号码
@property (nonatomic, strong) UITextField *testCodeT;//验证码
@property (nonatomic, strong) UITextField *doctorLicenseT;//医师执照
@property (nonatomic, strong) UIButton *photo;
//UIButton
@property (nonatomic, strong) UIButton *getTestCode;

//
@property (nonatomic,assign,getter=_isFinished) BOOL finsh;

@end
