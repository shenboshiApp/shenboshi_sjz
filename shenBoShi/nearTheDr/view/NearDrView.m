//
//  NearDrView.m
//  shenBoShi
//
//  Created by 开发3 on 15/12/25.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import "NearDrView.h"

@implementation NearDrView


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self addMapView];
        
        
    }
    return self;
}

-(void)addMapView
{
    //配置用户Key
    [MAMapServices sharedServices].apiKey = @"bc4a48e7d9e6ce97d7f713d276a8c68e";
    [AMapLocationServices sharedServices].apiKey =@"bc4a48e7d9e6ce97d7f713d276a8c68e";
    _mapView = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds))];
    _mapView.delegate = self;
    _mapView.showsUserLocation = YES;//YES 为打开定位，NO为关闭定位

    [self addSubview:_mapView];

//    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
//    pointAnnotation.coordinate = CLLocationCoordinate2DMake(39.989631, 116.481018);
//    pointAnnotation.title = @"方恒国际";
//    pointAnnotation.subtitle = @"阜通东大街6号";
//    
//    [_mapView addAnnotation:pointAnnotation];
    self.locationManager = [[AMapLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
//    // 带逆地理（返回坐标和地址信息）
//    [self.locationManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
//        
//        if (error)
//        {
//            NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
//            
//            if (error.code == AMapLocationErrorLocateFailed)
//            {
//                return;
//            }
//        }
//        
//        NSLog(@"location:%@", location);
//            MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
//        
//            pointAnnotation.coordinate = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude);
//            pointAnnotation.title = @"石家庄肾病医院";
//        
//
//        pointAnnotation.subtitle = [NSString stringWithFormat:@"%@",regeocode.formattedAddress];
//
//        if (regeocode)
//        {
//
//            NSLog(@"reGeocode:%@", regeocode);
//        }
//        [_mapView setZoomLevel:13.1 animated:YES];
//        [_mapView addAnnotation:pointAnnotation];
//        _mapView.centerCoordinate = _mapView.userLocation.location.coordinate;
//
//
//    }];
    
    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
    
                pointAnnotation.coordinate = CLLocationCoordinate2DMake(38.07410590,114.45186713);
                pointAnnotation.title = @"石家庄肾病医院";
            pointAnnotation.subtitle = @"河北省石家庄市新华区北苑街道飞翼路5号";
    

          [_mapView setZoomLevel:13.1 animated:YES];
            [_mapView addAnnotation:pointAnnotation];
    _mapView.centerCoordinate = pointAnnotation.coordinate;

    
    
    
//    [self.locationManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
//    
//        if (error)
//        {
//            NSLog(@"locError:{%ld - %@};", (long)error.code, error.localizedDescription);
//    
//            if (error.code == AMapLocationErrorLocateFailed)
//            {
//                return;
//            }
//        }
//
////        location.altitude;
////        location.coordinate;
////
////            MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
////            pointAnnotation.coordinate = CLLocationCoordinate2DMake(<#CLLocationDegrees latitude#>, CLLocationDegrees longitude);
////            pointAnnotation.title = @"方恒国际";
////            pointAnnotation.subtitle = @"阜通东大街6号";
//        
////            [_mapView setZoomLevel:13 animated:YES];
////            [_mapView addAnnotation:pointAnnotation];
////
//        NSLog(@"locationhdjshdjhhahah:%@", location);
//    
//        if (regeocode)
//        {
//            NSLog(@"reGeocode:%@", regeocode);
//        }
//    }];

}

//-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation
//updatingLocation:(BOOL)updatingLocation
//{
//    if(updatingLocation)
//    {
//        //取出当前位置的坐标
//        NSLog(@"latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
//        
//                    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
//                    pointAnnotation.coordinate = CLLocationCoordinate2DMake(userLocation.coordinate.latitude , userLocation.coordinate.longitude);
////                    pointAnnotation.title = @"方恒国际";
////                    pointAnnotation.subtitle = @"阜通东大街6号";
////        
////                    [_mapView setZoomLevel:13 animated:YES];
//                    [_mapView addAnnotation:pointAnnotation];
//
//    }
//}




- (void)dealloc
{
    _mapView.showsUserLocation = NO;
    
    [_mapView removeAnnotations:_mapView.annotations];
    _mapView.delegate = nil;
    
}




- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation

{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
        MAPinAnnotationView*annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
        if (annotationView == nil)
        {
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
        }
        annotationView.canShowCallout= YES;       //设置气泡可以弹出，默认为NO
        annotationView.animatesDrop = YES;        //设置标注动画显示，默认为NO
        annotationView.draggable = YES;        //设置标注可以拖动，默认为NO
        annotationView.pinColor = MAPinAnnotationColorPurple;
        return annotationView;
    }
    return nil;
}








//- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
//{
//    if ([annotation isKindOfClass:[MAPointAnnotation class]])
//    {
//        static NSString *reuseIndetifier = @"annotationReuseIndetifier";
//        MAAnnotationView *annotationView = (MAAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
//        if (annotationView == nil)
//        {
//            annotationView = [[MAAnnotationView alloc] initWithAnnotation:annotation
//                                                          reuseIdentifier:reuseIndetifier];
//        }
//        annotationView.image = [UIImage imageNamed:@"restaurant"];
//        //设置中心点偏移，使得标注底部中间点成为经纬度对应点
//        annotationView.centerOffset = CGPointMake(0, -18);
//
//        
//        
//        
//        return annotationView;
//    }
//    return nil;
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
