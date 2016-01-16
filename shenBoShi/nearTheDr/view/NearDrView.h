//
//  NearDrView.h
//  shenBoShi
//
//  Created by 开发3 on 15/12/25.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import "LSLawyerScreenAndControl.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapLocationKit/AMapLocationKit.h>
@interface NearDrView : LSLawyerScreenAndControl<MAMapViewDelegate,AMapLocationManagerDelegate>{
//地图的视图
    MAMapView *_mapView;
    
}
@property (nonatomic,strong) AMapLocationManager *locationManager;

@end
