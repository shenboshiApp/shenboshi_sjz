//
//  informationViewController.m
//  shenBoShi
//
//  Created by 开发2 on 15/12/28.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import "informationDetailViewController.h"
#import "headerCell.h"
#import "informationCell.h"
#import "addressCell.h"
#import "pathologyCell.h"
#import "symptomCell.h"
#import <MobileCoreServices/MobileCoreServices.h>
#define ORIGINAL_MAX_WIDTH 180.0f
//[MAMapServices sharedServices].apiKey = @"用户Key";
//bc4a48e7d9e6ce97d7f713d276a8c68e
@interface informationDetailViewController ()<UIImagePickerControllerDelegate,UIActionSheetDelegate,NJImageCropperDelegate,UINavigationControllerDelegate,UITextViewDelegate>
@property(nonatomic,strong)UIImageView * portraitImageView;
@end

@implementation informationDetailViewController
{
    UITableView * _tableView;
     EMCityChoose *_cityChooseViewController;
    UIButton * _adButton;
    UIButton * _pButton;
    UITextField * _nameText;
    UITextField * _telText;
    
    UIImage *headImage;
    CGFloat cell_height;
    UITextView *_textView;
    
//    记录键盘的高度
    CGFloat keyboard_height;
    
}




-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"mapLocation" object:nil];
    
    
}


- (void)keyboardWasShown: (NSNotification *)aNotification
{
    
    //获取键盘的高度
    NSDictionary *info = [aNotification userInfo];
    NSValue *avaule = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [self.view convertRect:[avaule CGRectValue] fromView:nil];
//
//    NSDictionary *info = [aNotification userInfo];
//    NSValue *value = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
//    CGSize keyboardSize = [value CGRectValue].size;

    keyboard_height = keyboardRect.size.height;
    
//    CGFloat _height = CGRectGetMaxY(_textView.frame);
    
//[UIView animateWithDuration:0.5 animations:^{
//   
//    _tableView.transform = CGAffineTransformMakeTranslation(0, -height+1);
//
////    _tableView.frame = CGRectMake(0, -height + 64, KDEVICEWIDTH, KDEVICEHEIGHT - 64);
//    
//}];

    
}
- (void)keyboardWasHidden: (NSNotification *)aNotification
{
//    [UIView animateWithDuration:0 animations:^{
//    
////    }];
//    [UIView animateWithDuration:0.5 animations:^{
//        _tableView.transform = CGAffineTransformIdentity;
//    }];

    
_tableView.frame = CGRectMake(0,64, KDEVICEWIDTH, KDEVICEHEIGHT - 64);

    
}




- (void)mapLocation
{
    [self.mapLocationManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
        
        if (error)
        {
            NSLog(@"locError:{%ld - sdsdsdsdsd%@};", (long)error.code, error.localizedDescription);
            
            if (error.code == AMapLocationErrorLocateFailed)
            {
                return;
            }
        }
        
        NSLog(@"location:%@", location);
        
        if (regeocode)
        {
            NSLog(@"reGeocode:sdsdsdsdsdsdsdsdsd%@", regeocode);
            
            
            
            
            [EMCityChoose_CurrentCity getCurrentCity:regeocode.city];
            [_adButton setTitle:regeocode.city forState:UIControlStateNormal];

            NSLog(@"---------%@",regeocode.city);
        }
    }];
    

}


- (void)mapLocationAction: (NSNotification *)aNotification
{
    [self mapLocation];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [AMapLocationServices sharedServices].apiKey =@"bc4a48e7d9e6ce97d7f713d276a8c68e";
    
    self.mapLocationManager = [[AMapLocationManager alloc] init];
//         .delegate = self;
    [self.mapLocationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    self.mapLocationManager.delegate = self;
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(mapLocationAction:) name:@"mapLocation" object:nil];
    
    [self mapLocation];
    
    
    
    
    
    
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(keyboardWasHidden:) name:UIKeyboardWillHideNotification object:nil];

    
    
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(26 , 2, KDEVICEWIDTH - 52, 400)];
    
    _textView.contentSize = CGSizeMake(KDEVICEWIDTH - 52, 800);
//    _textView.layoutManager.allowsNonContiguousLayout=NO;
    
    //    [symCell.contentView addSubview:_textView];
    
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 22;// 字体的行间距
    
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName:[UIFont systemFontOfSize:13],
                                 NSParagraphStyleAttributeName:paragraphStyle
                                 };
    _textView.attributedText = [[NSAttributedString alloc] initWithString:@"肾炎综合征是指血尿、蛋白尿、高血压、水肿为表现的一组综合征，有时亦可以见到肌酐升高、少尿等，常见于急性肾小球肾炎、急进型肾小球肾炎等。主要是以肾小球炎性病变、基底膜及足细胞结构紊乱为特点的一组疾病，肾炎综合征并不等于肾病综合征，一般而言肾炎综合征以血尿为主要表现，蛋白尿一般小于3.5g/天，高血压，水肿可以不明显。而肾病综合征主要大量蛋白尿、低蛋白血症、高血脂，水肿为主要表现，可无血尿或血尿表现轻微。" attributes:attributes];
    
    _textView.delegate = self;
    
    //                    textView.backgroundColor = [UIColor grayColor];
    
    CGSize textSize = [self boundingRectWithSize:CGSizeMake(KDEVICEWIDTH - 52, 200) TextViewString:_textView.text];
    
    //        [textView sizeToFit];
    
    CGFloat width = textSize.width;
    CGFloat h_height = textSize.height;
    int numbers = h_height/13;
    
    _textView.frame = CGRectMake(26, 2, width, h_height + 22 * numbers + 11);
    NSLog(@"++++++++++++++%@",NSStringFromCGRect(_textView.frame));
    //
    if (cell_height == 0) {
        cell_height = h_height + 22 * numbers + 11;
        [_tableView reloadData];
        
    }
    

    
    
    
    UILabel * navLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 62.67, 37.3)];
    if (self.is_fromHomePage == YES) {
        navLabel.text = @"预约专家";
    }else{
        navLabel.text=@"咨询者个人资料";
  
    }
    navLabel.font=[UIFont fontWithName:@"Arial-BoldMT" size:18];
    navLabel.textColor=[UIColor whiteColor];
    self.navigationItem.titleView=navLabel;
    
    UIImage *backImage = [UIImage imageNamed:@"back@3x"];
    backImage = [backImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:backImage style:(UIBarButtonItemStylePlain) target:self action:@selector(backButton)];
    
       self.automaticallyAdjustsScrollViewInsets=NO;
   
    [self.view addSubview:self.bottomView];
    [self createTableView];
    

}

#pragma mark ---pop页面
-(void)backButton
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark ---创建tableView
-(void)createTableView{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, KDEVICEWIDTH,KDEVICEHEIGHT-64) style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.separatorColor=[UIColor clearColor];
    _tableView.backgroundColor=[UIColor clearColor];
    _tableView.userInteractionEnabled = YES;

    [self.view addSubview:_tableView];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   if(section==0){
        return 4;
   }else{
       return 3;
   }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section==0){
        return 13;
    }
    if(section==1){
        return 20;
    }
    return 0;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 79;
        }else{
            return 38;
        }
        
    }else if(indexPath.section == 1){
        if (indexPath.row == 0) {
            return 40;
        }else if(indexPath.row == 1){
            
//            if (cell_height == 0.0) {
//                return 400;
//            }else{
//                return 400;
//            }
            
            return cell_height;
        
        }else if(indexPath.row == 2){
            return 70;
        }
    }
    return 0;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            
            headerCell * headCell=[tableView dequeueReusableCellWithIdentifier:@"headerCell"];
                    headCell.userInteractionEnabled = YES;
                if(!headCell){
                    headCell=[[headerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"headerCell"];
                }
            
                    _portraitImageView=[[UIImageView alloc]initWithFrame:CGRectMake(235 * A_WIDTH, 10, 60, 60)];
                    _portraitImageView.image=[UIImage imageNamed:@"flower"];
                    _portraitImageView.userInteractionEnabled=YES;
                    _portraitImageView.layer.cornerRadius=30;
                    _portraitImageView.layer.masksToBounds=YES;
            
                    UITapGestureRecognizer *portraitTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(editPortrait)];
                    [_portraitImageView addGestureRecognizer:portraitTap];
                    [headCell.contentView addSubview:_portraitImageView];
                headCell.selectionStyle=UITableViewCellSelectionStyleNone;
                headCell.backgroundColor=[UIColor whiteColor];
//                [headCell setSelectionStyle:UITableViewCellSelectionStyleNone];
            

                    return headCell;
  
            
        }else if(indexPath.row > 0 && indexPath.row < 3){
            informationCell * inforCell=[tableView dequeueReusableCellWithIdentifier:@"informatinCell"];
            //        inforCell.userInteractionEnabled = YES;
                    if(!inforCell){
                        inforCell=[[informationCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"informatinCell"];
                    }
            
                     inforCell.selectionStyle=UITableViewCellSelectionStyleNone;
                    if(indexPath.row==1){
                        _nameText=[[UITextField alloc]initWithFrame:CGRectMake(60, 2, KDEVICEWIDTH - 120, 34)];
                        _nameText.font=[UIFont fontWithName:@"Helvetica-light" size:13];
                        _nameText.placeholder = @"请输入名字";
                        _nameText.delegate=self;
                      _nameText.tintColor=[UIColor blackColor];
                        _nameText.returnKeyType=UIReturnKeyDefault;
            //            [_nameText becomeFirstResponder];
                        [inforCell.contentView addSubview:_nameText];
                    }
                    if(indexPath.row==2){
                        _telText=[[UITextField alloc]initWithFrame:CGRectMake(60, 2, KDEVICEWIDTH - 120, 34)];
                        _telText.font=[UIFont fontWithName:@"Helvetica-light" size:13];
                        _telText.placeholder=@"请输入电话";
                        _telText.tintColor=[UIColor blackColor];
                        _telText.delegate=self;
            //            [_telText becomeFirstResponder];
                        [inforCell.contentView addSubview:_telText];
                    }
            
                    NSArray * informationArr=@[@"姓名",@"电话"];
                    inforCell.informationLabel.text=informationArr[indexPath.row - 1];
            
            
            return inforCell;

            

        }else if (indexPath.row == 3) {
                addressCell * addCell=[tableView dequeueReusableCellWithIdentifier:@"addCell"];
                        if(!addCell){
                            addCell=[[addressCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"addCell"];
                        }
                        addCell.selectionStyle=UITableViewCellSelectionStyleNone;
                        if(_adButton==nil){
                      _adButton=[[UIButton alloc]initWithFrame:CGRectMake(54, 1, 216 * A_WIDTH, 34)];
                        [_adButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                        _adButton.titleLabel.font=[UIFont fontWithName:@"Helvetica-light" size:13];
                        _adButton.contentHorizontalAlignment=UIControlContentHorizontalAlignmentRight;
                
                
                        [addCell.contentView addSubview:_adButton];
                        
                         [_adButton addTarget:self action:@selector(buttonClickMethod:) forControlEvents:UIControlEventTouchUpInside];
                        }
                        
                        return addCell;

            }


    
    }else if(indexPath.section == 1){
        if (indexPath.row == 0) {
            pathologyCell * pathCell=[tableView dequeueReusableCellWithIdentifier:@"pathCell"];
                    if(!pathCell){
                        pathCell=[[pathologyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"pathCell"];
                    }
                    pathCell.selectionStyle=UITableViewCellSelectionStyleNone;
                    if(_pButton==nil){
                    _pButton=[[UIButton alloc]initWithFrame:CGRectMake(110 * A_WIDTH, 14, 156, 12)];
                    [_pButton setTitle:@"肾炎综合征" forState:UIControlStateNormal];
            //        _pButton.backgroundColor=[UIColor redColor];
                    [_pButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    _pButton.titleLabel.font=[UIFont fontWithName:@"Helvetica-light" size:13];
                    _pButton.contentHorizontalAlignment=UIControlContentHorizontalAlignmentRight;
                    [pathCell.contentView addSubview:_pButton];
                    [_pButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
                    }
                    return pathCell;

        }
        if (indexPath.row == 1) {
            symptomCell * symCell=[tableView dequeueReusableCellWithIdentifier:@"symCell"];
                if(!symCell){
                    symCell=[[symptomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"symCell"];
                }
            [symCell setSelectionStyle:UITableViewCellSelectionStyleNone];

//            }
            
            [symCell.contentView addSubview:_textView];
                    return symCell;

        }
        if (indexPath.row == 2) {
            
            UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
                if(!cell){
                    cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
                }
            
//                UIImageView * commit=[[UIImageView alloc]initWithFrame:CGRectMake(69, 12, 177, 30)];
//                commit.image=[UIImage imageNamed:@"tijiao"];
//                [cell.contentView addSubview:commit];
//            //    cell.backgroundColor=[UIColor yellowColor];
//            
            
                
            
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

            UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeSystem];
            submitButton.frame = CGRectMake(KDEVICEWIDTH/2 - 88.5, 12, 177, 30);
            [submitButton addTarget:self action:@selector(submitButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            [submitButton setTitle:@"提交" forState:UIControlStateNormal];
            submitButton.layer.masksToBounds = YES;
            submitButton.layer.cornerRadius = 5.0;
            submitButton.layer.borderWidth = 1;
            submitButton.layer.borderColor = [UIColor colorWithRed:102/255.0 green:222/255.0 blue:224/255.0 alpha:1].CGColor;
            
//            CGColorSpaceRef *ref = CGColorSpaceCreateDeviceRGB();
//            CGColorRef *colorRef = CGColorCreate(colorSpaceRef, (CGFloat[]){1,0,0,1});
            
            [cell.contentView addSubview:submitButton];
            
            
            
            
            
            
            
            
                return cell;

            
        }
    }
    

    
    
    return nil;
    
}




-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1 && indexPath.row == 2) {
        [_textView resignFirstResponder];
    }
}
- (void)submitButtonAction: (UIButton *)sender
{
    [_textView resignFirstResponder];
    _tableView.frame = CGRectMake(0, 64, KDEVICEWIDTH, KDEVICEHEIGHT - 64);
//    [_textView becomeFirstResponder];
    NSLog(@"提交个人信息");
    if (self.is_fromHomePage == YES) {
//        _textView.userInteractionEnabled = NO;
        _textView.editable = NO;

        UIAlertView *ale = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请等待客服与您沟通" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [ale show];

        
        
        
        
    }else{
        UIAlertView *ale = [[UIAlertView alloc] initWithTitle:@"提示" message:@"已经提交个人信息" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [ale show];
    }


}







//    if(indexPath.section==0){
//    headerCell * headCell=[tableView dequeueReusableCellWithIdentifier:@"headerCell"];
//        headCell.userInteractionEnabled = YES;
//    if(!headCell){
//        headCell=[[headerCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"headerCell"];
//    }
//        
//        _portraitImageView=[[UIImageView alloc]initWithFrame:CGRectMake(235, 10, 60, 60)];
//        _portraitImageView.image=[UIImage imageNamed:@"flower"];
//        _portraitImageView.userInteractionEnabled=YES;
//        _portraitImageView.layer.cornerRadius=30;
//        _portraitImageView.layer.masksToBounds=YES;
//       
//        UITapGestureRecognizer *portraitTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(editPortrait)];
//        [_portraitImageView addGestureRecognizer:portraitTap];
//        [headCell.contentView addSubview:_portraitImageView];
//    headCell.selectionStyle=UITableViewCellSelectionStyleNone;
//    headCell.backgroundColor=[UIColor whiteColor];
//        return headCell;
//    }
//    if(indexPath.section==1){
//        informationCell * inforCell=[tableView dequeueReusableCellWithIdentifier:@"informatinCell"];
////        inforCell.userInteractionEnabled = YES;
//        if(!inforCell){
//            inforCell=[[informationCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"informatinCell"];
//        }
//         inforCell.selectionStyle=UITableViewCellSelectionStyleNone;
//        if(indexPath.row==0){
//            _nameText=[[UITextField alloc]initWithFrame:CGRectMake(54, 2, 240, 34)];
//            _nameText.font=[UIFont fontWithName:@"Helvetica-light" size:13];
//            _nameText.text=@"                                                 ";
//            _nameText.delegate=self;
//          _nameText.tintColor=[UIColor blackColor];
//            _nameText.returnKeyType=UIReturnKeyDefault;
////            [_nameText becomeFirstResponder];
//            [inforCell.contentView addSubview:_nameText];
//        }
//        if(indexPath.row==1){
//            _telText=[[UITextField alloc]initWithFrame:CGRectMake(54, 2, 240, 34)];
//            _telText.font=[UIFont fontWithName:@"Helvetica-light" size:13];
//            _telText.text=@"                                          ";
//            _telText.tintColor=[UIColor blackColor];
//            _telText.delegate=self;
////            [_telText becomeFirstResponder];
//            [inforCell.contentView addSubview:_telText];
//        }
//        NSArray * informationArr=@[@"姓名",@"电话"];
//        inforCell.informationLabel.text=informationArr[indexPath.row];
//        
//        return inforCell;
//    }
//    if(indexPath.section==2){
//        addressCell * addCell=[tableView dequeueReusableCellWithIdentifier:@"addCell"];
//        if(!addCell){
//            addCell=[[addressCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"addCell"];
//        }
//        [EMCityChoose_CurrentCity getCurrentCity:@"石家庄"];
//        addCell.selectionStyle=UITableViewCellSelectionStyleNone;
//        if(_adButton==nil){
//      _adButton=[[UIButton alloc]initWithFrame:CGRectMake(54, 1, 216, 34)];
//        [_adButton setTitle:@"石家庄" forState:UIControlStateNormal];
//        [_adButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        _adButton.titleLabel.font=[UIFont fontWithName:@"Helvetica-light" size:13];
//        _adButton.contentHorizontalAlignment=UIControlContentHorizontalAlignmentRight;
//       
//       
//        [addCell.contentView addSubview:_adButton];
//        
//         [_adButton addTarget:self action:@selector(buttonClickMethod:) forControlEvents:UIControlEventTouchUpInside];
//        }
//        
//        return addCell;
//    }
//    if(indexPath.section==3){
//        pathologyCell * pathCell=[tableView dequeueReusableCellWithIdentifier:@"pathCell"];
//        if(!pathCell){
//            pathCell=[[pathologyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"pathCell"];
//        }
//        pathCell.selectionStyle=UITableViewCellSelectionStyleNone;
//        if(_pButton==nil){
//        _pButton=[[UIButton alloc]initWithFrame:CGRectMake(115, 14, 156, 12)];
//        [_pButton setTitle:@"肾炎综合征" forState:UIControlStateNormal];
////        _pButton.backgroundColor=[UIColor redColor];
//        [_pButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        _pButton.titleLabel.font=[UIFont fontWithName:@"Helvetica-light" size:13];
//        _pButton.contentHorizontalAlignment=UIControlContentHorizontalAlignmentRight;
//        [pathCell.contentView addSubview:_pButton];
//        [_pButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
//        }
//        return pathCell;
//    }
//    if(indexPath.section==4){
//    symptomCell * symCell=[tableView dequeueReusableCellWithIdentifier:@"symCell"];
//    if(!symCell){
//        symCell=[[symptomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"symCell"];
//    }
//        
//        UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(26, 2, KDEVICEWIDTH - 52, 400)];
//        
//        
//        [symCell.contentView addSubview:textView];
//        
//        
//        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//        paragraphStyle.lineSpacing = 22;// 字体的行间距
//        
//        
//        NSDictionary *attributes = @{
//                                     NSFontAttributeName:[UIFont systemFontOfSize:13],
//                                     NSParagraphStyleAttributeName:paragraphStyle
//                                     };
//        textView.attributedText = [[NSAttributedString alloc] initWithString:@"肾炎综合征是指血尿、蛋白尿、高血压、水肿为表现的一组综合征，有时亦可以见到肌酐升高、少尿等，常见于急性肾小球肾炎、急进型肾小球肾炎等。主要是以肾小球炎性病变、基底膜及足细胞结构紊乱为特点的一组疾病，肾炎综合征并不等于肾病综合征，一般而言肾炎综合征以血尿为主要表现，蛋白尿一般小于3.5g/天，高血压，水肿可以不明显。而肾病综合征主要大量蛋白尿、低蛋白血症、高血脂，水肿为主要表现，可无血尿或血尿表现轻微。" attributes:attributes];
//        
//        textView.delegate = self;
//        
//        textView.backgroundColor = [UIColor grayColor];
//        
//        CGSize textSize = [self boundingRectWithSize:CGSizeMake(KDEVICEWIDTH - 52, 200) TextViewString:textView.text];
//        
////        [textView sizeToFit];
//        
//        CGFloat width = textSize.width;
//        CGFloat height = textSize.height;
//        int numbers = height/13;
//
//        textView.frame = CGRectMake(26, 2, width, height + 22 * numbers + 11);
//        NSLog(@"++++++++++++++%@",NSStringFromCGRect(textView.frame));
//        return symCell;
//    }
//    
//    
//    
//    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
//    if(!cell){
//        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//    }
//    
//    UIImageView * commit=[[UIImageView alloc]initWithFrame:CGRectMake(69, 12, 177, 30)];
//    commit.image=[UIImage imageNamed:@"tijiao"];
//    [cell.contentView addSubview:commit];
////    cell.backgroundColor=[UIColor yellowColor];
//
//    
//    
//
//    
//    
//    
//    return cell;

#pragma mark ---城市按钮点击方法
- (void)buttonClickMethod:(UIButton *)sender {
    if (!_cityChooseViewController.isShow) {
        _cityChooseViewController = [[EMCityChoose alloc]initWithPointY:64 buttonTitleCityName:sender.titleLabel.text hotCity:nil cityType:(cityListType)cityListTypeShortType hideSearchBar:NO];
        _cityChooseViewController.delegate = self;
        [self addChildViewController:_cityChooseViewController];
        [self.view addSubview:_cityChooseViewController.view];
    }else {
        [_cityChooseViewController closeView];
    }
    
}
#pragma mark  ---选择城市的代理方法
- (void)startDisplay:(EMCityChoose *)aCityChooseViewController {
    NSLog(@"列表出现了");
}

- (void)stopDisplay:(EMCityChoose *)aCityChooseViewController {
    NSLog(@"列表消失了");
    NSLog(@"选择城市为:%@",[aCityChooseViewController getCityName]);
    [_adButton setTitle:[aCityChooseViewController getCityName] forState:UIControlStateNormal];
}

- (void)refreshCurrentCity:(EMCityChoose *)aCityChooseViewController {
    NSLog(@"刷新位置。");
}
#pragma mark ---病理类型的点击按钮
-(void)buttonClick
{
    pathologyTypeController * type=[[pathologyTypeController alloc]init];
    type.delegate=self;
    [self.navigationController pushViewController:type animated:YES];

}
#pragma mark ---背景图
-(UIImageView *)bottomView
{
    if (_bottomView == nil) {
        _bottomView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-64)];
        [_bottomView setImage:[UIImage imageNamed:@"background"]];
        
        _bottomView.userInteractionEnabled = YES;
    }
    return _bottomView;
}
#pragma mark ---病情的反向传值的代理方法
-(void)sendWithString:(NSString *)senderString
{
    [_pButton setTitle:senderString forState:UIControlStateNormal];
}

#pragma mark ---键盘消失

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [_nameText resignFirstResponder];
    [_telText resignFirstResponder];
//    [_textView resignFirstResponder];
    

}


#pragma mark ---添加的手势以及头像的修改
- (void)editPortrait {
    UIActionSheet *choiceSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"拍照", @"从相册中选取", nil];
    [choiceSheet showInView:self.view];
}
#pragma mark VPImageCropperDelegate
- (void)imageCropper:(NJImageCropperViewController *)cropperViewController didFinished:(UIImage *)editedImage {
    self.portraitImageView.image = editedImage;
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
            [self presentViewController:controller
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
            [self presentViewController:controller
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
    NJImageCropperViewController *imgEditorVC = [[NJImageCropperViewController alloc] initWithImage:portraitImg cropFrame:CGRectMake(0, 100.0f, self.view.frame.size.width, self.view.frame.size.width) limitScaleRatio:3.0];
    imgEditorVC.delegate = self;

    [self presentViewController:imgEditorVC animated:NO completion:^{
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
- (CGSize)boundingRectWithSize:(CGSize)size
                TextViewString:(NSString *)TextViewString
{
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:13]};
    
    CGSize retSize = [TextViewString boundingRectWithSize:size
                                             options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    
    return retSize;
}




-(void)textViewDidChange:(UITextView *)textView
{
//    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//    paragraphStyle.lineSpacing = 22;// 字体的行间距
//    
//    
//    NSDictionary *attributes = @{
//                                 NSFontAttributeName:[UIFont systemFontOfSize:13],
//                                 NSParagraphStyleAttributeName:paragraphStyle
//                                 };
//    
//    
//    textView.attributedText = [[NSAttributedString alloc] initWithString:textView.text attributes:attributes];
//    
//    CGSize textSize = [self boundingRectWithSize:CGSizeMake(KDEVICEWIDTH - 52, 200) TextViewString:textView.text];
//    
////    [textView sizeToFit];
//    
//    CGFloat width = textSize.width;
//    CGFloat height = textSize.height;
//    int numbers = height/13;
//    
//    textView.frame = CGRectMake(26, 2, KDEVICEWIDTH - 52, height + 22 * numbers);
//    
//    cell_height = height + 22 * numbers + 11;
//    
//    [_tableView reloadData];

}
//


//-(void)textViewDidBeginEditing:(UITextView *)textView
//{
////
//}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{ //其实你可以加在这个代理方法中。当你将要编辑的时候。先执行这个代理方法的时候就可以改变间距了。这样之后输入的内容也就有了行间距。
    
    
    
    
    
        if (textView.text.length < 1) {
            textView.text = @"间距";
        }
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        
        paragraphStyle.lineSpacing = 22;// 字体的行间距
        
        NSDictionary *attributes = @{
                                     
                                     NSFontAttributeName:[UIFont systemFontOfSize:13],
                                     
                                     NSParagraphStyleAttributeName:paragraphStyle
                                     
                                     };
        
        textView.attributedText = [[NSAttributedString alloc] initWithString:textView.text attributes:attributes];
        if ([textView.text isEqualToString:@"间距"]) { //之所以加这个判断是因为再次编辑的时候还会进入这个代理方法，如果不加，会把你之前输入的内容清空。你也可以取消看看效果。
            textView.attributedText = [[NSAttributedString alloc] initWithString:@"" attributes:attributes];//主要是把“间距”两个字给去了。
        }
        return YES;
  

    
}

//-(void)textViewDidEndEditing:(UITextView *)textView
//{
//    [textView resignFirstResponder];
//}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [_textView resignFirstResponder];
//}

//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    [_textView resignFirstResponder];
//}
//


-(void)textViewDidBeginEditing:(UITextView *)textView
{
    
//    [_textView scrollRectToVisible:CGRectMake(0, _textView.contentSize.height, _textView.contentSize.width, 0) animated:YES];
    if (textView == _textView) {
                [UIView animateWithDuration:0.5 animations:^{
        
                    if (keyboard_height != 0) {
                        _tableView.frame = CGRectMake(0, 64 - keyboard_height, KDEVICEWIDTH, KDEVICEHEIGHT- 64);
        
                        NSIndexPath *index = [NSIndexPath indexPathForRow:2 inSection:1];
                        
                        
                        
                        [_tableView scrollToRowAtIndexPath:index atScrollPosition:UITableViewScrollPositionBottom animated:YES];
        
                    }
                    //            _tableView.transform = CGAffineTransformMakeTranslation(0, keyboard_height+1);
                    //    _tableView.frame = CGRectMake(0, -height + 64, KDEVICEWIDTH, KDEVICEHEIGHT - 64);
        
                    
                }];
                
                
            }

    
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [_nameText resignFirstResponder];
    [_telText resignFirstResponder];
    return YES;
}




//-(void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
//{
//    [_textView resignFirstResponder];
//}
//

//-(BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    [_nameText resignFirstResponder];
//    [_telText resignFirstResponder];
//    return YES;
//
//}
@end
