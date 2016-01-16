//
//  MingYIDetailView.h
//  shenBoShi
//
//  Created by 开发3 on 15/12/28.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVKit/AVKit.h>
@interface MingYIDetailView : UIView<AVPlayerViewControllerDelegate>
{
    UIButton *beginBtn;
}
//视频播放的view
@property (nonatomic,strong) UIView *AVPlayerView;
//医生信息的view
@property (nonatomic,strong) UIView *DrDetailView;


@property (nonatomic,strong) AVPlayerViewController *AVPlayer;

//播放器对象
@property (nonatomic,strong) AVPlayer *player;

//播放暂停按钮
@property (nonatomic,strong) UIButton *playOrPause;

@property (nonatomic,strong) AVPlayerLayer *avPlayerLayer;



@property (nonatomic ,strong) AVPlayerItem *playerItem;



@property (nonatomic,strong) UIProgressView *progress;//播放进度

//底层view
@property (nonatomic,strong) UIScrollView *mainScrollView;
@end
