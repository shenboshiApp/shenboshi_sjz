//
//  MingYIDetailView.m
//  shenBoShi
//
//  Created by 开发3 on 15/12/28.
//  Copyright © 2015年 开发3-lyp. All rights reserved.
//

#import "MingYIDetailView.h"
#import "UIView+UIViewController.h"
#import "informationDetailViewController.h"
@implementation MingYIDetailView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {

        [self addSubview:self.mainScrollView];
        [self setupUI];
//        [self.player play];

    }
    return self;
}

-(void)dealloc{
    [self removeObserverFromPlayerItem:self.player.currentItem];
    [self removeNotification];
}


-(UIScrollView *)mainScrollView
{
    if (!_mainScrollView) {
        
        _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KDEVICEWIDTH, KDEVICEHEIGHT - 64)];
        [_mainScrollView addSubview:self.AVPlayerView];
        [_mainScrollView addSubview:self.DrDetailView];
        _mainScrollView.backgroundColor = [UIColor whiteColor];
//        _mainScrollView.bounces = NO;

        
        
        _mainScrollView.contentSize = CGSizeMake(KDEVICEWIDTH, CGRectGetHeight(self.AVPlayerView.frame) + CGRectGetHeight(self.DrDetailView.frame));
        _mainScrollView.showsVerticalScrollIndicator = NO;
    }
    return _mainScrollView;
}
#pragma mark - 私有方法
-(void)setupUI{
    //创建播放器层
    AVPlayerLayer *playerLayer=[AVPlayerLayer playerLayerWithPlayer:self.player];
    playerLayer.frame= CGRectMake(0, 0, KDEVICEWIDTH, 184 * B_HIGHT);
    //playerLayer.videoGravity=AVLayerVideoGravityResizeAspect;//视频填充模式
    [self.AVPlayerView.layer addSublayer:playerLayer];
    
    
//   parogress
    self.progress = [[UIProgressView alloc] initWithFrame:CGRectMake(0,163 * B_HIGHT, KDEVICEWIDTH, 20)];
//    self.progress.progressTintColor = [UIColor blueColor];
    self.progress.progressViewStyle = UIProgressViewStyleDefault;
    self.progress.progressTintColor = [UIColor grayColor];
    [self.AVPlayerView addSubview:self.progress];
    
    self.playOrPause = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.playOrPause addTarget:self action:@selector(playOrPauseAction:) forControlEvents:UIControlEventTouchUpInside];
//    [self.playOrPause setTitle:@"" forState:UIControlStateNormal];
    [self.playOrPause setImage : [UIImage imageNamed:@"kaishi"] forState:UIControlStateNormal];
    self.playOrPause.frame = CGRectMake(5, 145.5* B_HIGHT, 35 * A_WIDTH , 35 * B_HIGHT
                                        );
//    self.playOrPause.layer.masksToBounds = YES;
//    self.playOrPause.layer.cornerRadius = 15;
    [self.AVPlayerView addSubview:self.playOrPause];
    
    beginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    beginBtn.backgroundColor = [UIColor redColor];
    [beginBtn addTarget:self action:@selector(beginAction:) forControlEvents:UIControlEventTouchUpInside];
//    beginBtn.frame = CGRectMake(KDEVICEWIDTH/2 - 82.5 * A_WIDTH, 92.65 * B_HIGHT - 67 * B_HIGHT, 165 * A_WIDTH, 114 * B_HIGHT);
    beginBtn.frame = self.AVPlayerView.bounds;
    [beginBtn setImage:[UIImage imageNamed:@"video"] forState:UIControlStateNormal];
    [self.AVPlayerView addSubview:beginBtn];
    

    
    
//    166/101
    
    
    
    
}

- (void)beginAction: (UIButton *)sender
{
    NSLog(@"点击了开始");
    beginBtn.hidden = YES;
    [self.player play];
    
    
    [self.playOrPause setImage:[UIImage imageNamed:@"zanting"] forState:UIControlStateNormal];
    self.player.rate = 1;
    
//    if(self.player.rate==0){ //说明时暂停
//        [sender setImage:[UIImage imageNamed:@"zanting"] forState:UIControlStateNormal];
//        [self.player play];
//    }else if(self.player.rate==1){//正在播放
//        [self.player pause];
//        [sender setImage:[UIImage imageNamed:@"kaishi"] forState:UIControlStateNormal];
//    }
    

}





-(AVPlayer *)player{
    if (!_player) {
        AVPlayerItem *playerItem=[self getPlayItem:0];
        _player=[AVPlayer playerWithPlayerItem:playerItem];
        [self addProgressObserver];
        [self addObserverToPlayerItem:playerItem];
    }
    return _player;
}

/**
 *  根据视频索引取得AVPlayerItem对象
 *
 *  @param videoIndex 视频顺序索引
 *
 *  @return AVPlayerItem对象
 */
-(AVPlayerItem *)getPlayItem:(int)videoIndex{
//    NSString *urlStr=[NSString stringWithFormat:@"http://192.168.1.161/%i.mp4",videoIndex];
    
            NSString *path = [[NSBundle mainBundle] pathForResource:@"肾脏液体潴留" ofType:@"mp4"];

//    urlStr =[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url=[NSURL fileURLWithPath:path];
    
    AVPlayerItem *playerItem=[AVPlayerItem playerItemWithURL:url];
    return playerItem;
}
#pragma mark - 通知
/**
 *  添加播放器通知
 */
-(void)addNotification{
    //给AVPlayerItem添加播放完成通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.player.currentItem];
}

-(void)removeNotification{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
/**
 *  播放完成通知
 *
 *  @param notification 通知对象
 */
-(void)playbackFinished:(NSNotification *)notification{
    NSLog(@"视频播放完成.");
    beginBtn.hidden = NO;
}
#pragma mark - 监控
/**
 *  给播放器添加进度更新
 */
-(void)addProgressObserver{
    AVPlayerItem *playerItem=self.player.currentItem;
    __weak MingYIDetailView *weakSelf = self;
    //这里设置每秒执行一次
    [self.player addPeriodicTimeObserverForInterval:CMTimeMake(1.0, 1.0) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        float current=CMTimeGetSeconds(time);
        float total=CMTimeGetSeconds([playerItem duration]);
        NSLog(@"当前已经播放%.2fs.",current);
        if (current) {
            [weakSelf.progress setProgress:(current/total) animated:YES];
        }
    }];
}

/**
 *  给AVPlayerItem添加监控
 *
 *  @param playerItem AVPlayerItem对象
 */
-(void)addObserverToPlayerItem:(AVPlayerItem *)playerItem{
    //监控状态属性，注意AVPlayer也有一个status属性，通过监控它的status也可以获得播放状态
    [playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    //监控网络加载情况属性
    [playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
}
-(void)removeObserverFromPlayerItem:(AVPlayerItem *)playerItem{
    [playerItem removeObserver:self forKeyPath:@"status"];
    [playerItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
}
/**
 *  通过KVO监控播放器状态
 *
 *  @param keyPath 监控属性
 *  @param object  监视器
 *  @param change  状态改变
 *  @param context 上下文
 */
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    AVPlayerItem *playerItem=object;
    if ([keyPath isEqualToString:@"status"]) {
        AVPlayerStatus status= [[change objectForKey:@"new"] intValue];
        if(status==AVPlayerStatusReadyToPlay){
            NSLog(@"正在播放...，视频总长度:%.2f",CMTimeGetSeconds(playerItem.duration));
        }
    }else if([keyPath isEqualToString:@"loadedTimeRanges"]){
        NSArray *array=playerItem.loadedTimeRanges;
        CMTimeRange timeRange = [array.firstObject CMTimeRangeValue];//本次缓冲时间范围
        float startSeconds = CMTimeGetSeconds(timeRange.start);
        float durationSeconds = CMTimeGetSeconds(timeRange.duration);
        NSTimeInterval totalBuffer = startSeconds + durationSeconds;//缓冲总长度
        NSLog(@"共缓冲：%.2f",totalBuffer);
        //
    }
}
#pragma mark - UI事件
///**
// *  点击播放/暂停按钮
// *
// *  @param sender 播放/暂停按钮
// */
//- (IBAction)playClick:(UIButton *)sender {
//    //    AVPlayerItemDidPlayToEndTimeNotification
//    //AVPlayerItem *playerItem= self.player.currentItem;
//    if(self.player.rate==0){ //说明时暂停
//        [sender setImage:[UIImage imageNamed:@"player_pause"] forState:UIControlStateNormal];
//        [self.player play];
//    }else if(self.player.rate==1){//正在播放
//        [self.player pause];
//        [sender setImage:[UIImage imageNamed:@"player_play"] forState:UIControlStateNormal];
//    }
//}
//
//
///**
// *  切换选集，这里使用按钮的tag代表视频名称
// *
// *  @param sender 点击按钮对象
// */
//- (IBAction)navigationButtonClick:(UIButton *)sender {
//    [self removeNotification];
//    [self removeObserverFromPlayerItem:self.player.currentItem];
//    AVPlayerItem *playerItem=[self getPlayItem:sender.tag];
//    [self addObserverToPlayerItem:playerItem];
//    //切换视频
//    [self.player replaceCurrentItemWithPlayerItem:playerItem];
//    [self addNotification];
//}
//


- (UIView *)AVPlayerView
{
    if (_AVPlayerView == nil) {
        _AVPlayerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KDEVICEWIDTH, 184 * B_HIGHT)];
        _AVPlayerView.backgroundColor = [UIColor blackColor];
    }
    return _AVPlayerView;
}


- (void)playOrPauseAction: (UIButton *)sender
{
    beginBtn.hidden = YES;
    
    
   if(self.player.rate==0){ //说明时暂停
        [sender setImage:[UIImage imageNamed:@"zanting"] forState:UIControlStateNormal];
        [self.player play];
    }else if(self.player.rate==1){//正在播放
        [self.player pause];
        [sender setImage:[UIImage imageNamed:@"kaishi"] forState:UIControlStateNormal];
    }
    
}
- (UIView *)DrDetailView
{
    if (_DrDetailView == nil) {
        
        
        
        _DrDetailView = [[UIView alloc] initWithFrame:CGRectMake(0, 184 * B_HIGHT, KDEVICEWIDTH, KDEVICEHEIGHT - 184 * B_HIGHT)];
        _DrDetailView.backgroundColor = [UIColor whiteColor];
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(20, 56, 87, 87)];
        [image setImage:[UIImage imageNamed:@"photo"]];
        image.layer.masksToBounds = YES;
        image.layer.cornerRadius = 87/2;
        [_DrDetailView addSubview:image];
        
        
        //分割线3
        UIView *breakLineView = [[UIView alloc] initWithFrame:CGRectMake(15, 35 * B_HIGHT, KDEVICEWIDTH - 30, 1)];
        breakLineView.backgroundColor = [UIColor colorWithRed:102/255.0 green:222/255.0 blue:224/255.0 alpha:1];
        [_DrDetailView addSubview:breakLineView];
        

        
        
        UILabel *nameLable = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(image.frame) + 15, 67, KDEVICEWIDTH - 19-20-87-15,69)];
        nameLable.text = @"穆大力\n职称：主任医师\n所属医院:\n诊金:￥";
        nameLable.numberOfLines = 0;
        nameLable.textAlignment  = NSTextAlignmentNatural;
//        [nameLable sizeThatFits:CGSizeMake(0, 0)         ];
        nameLable.font = [UIFont systemFontOfSize:11];
        [_DrDetailView addSubview:nameLable];
        
        
        UILabel *detailLable = [[UILabel alloc] initWithFrame:CGRectMake(22, CGRectGetMaxY(image.frame), KDEVICEWIDTH - 46,100)];
        detailLable.text = @"简介：穆大力，男，河北省优秀中医临床人才\n在国家十一五重点肾病专科临床验证工作中，负责慢性肾衰的临床验证。病例总结，数据处理和资料上报工作，受到了慢性肾衰协作组组长单位的好评。中西医理论功底扎实，应用中药系列方药治疗肾性血尿,蛋白尿效果良好。主治急慢性肾小球肾炎肾功能衰竭，各种全身性系统疾病的肾损害。";
        detailLable.numberOfLines = 0;
        detailLable.font = [UIFont systemFontOfSize:10];
        [_DrDetailView addSubview:detailLable];
        

        UIButton *YuYuebutton = [UIButton buttonWithType:UIButtonTypeCustom];
        YuYuebutton.frame = CGRectMake(70 * A_WIDTH, CGRectGetMaxY(detailLable.frame) + 15, KDEVICEWIDTH - 70 * A_WIDTH* 2, 32);
        [YuYuebutton addTarget:self action:@selector(YuYuebuttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [YuYuebutton setTitle:@"预约就诊" forState:UIControlStateNormal];
        [self.DrDetailView addSubview:YuYuebutton];
        YuYuebutton.titleLabel.font = [UIFont systemFontOfSize:14];
        YuYuebutton.backgroundColor = [UIColor colorWithRed:93/255.0 green:201/255.0 blue:200/255.0 alpha:1];
        YuYuebutton.layer.masksToBounds = YES;
        YuYuebutton.layer.cornerRadius = 5.0;
        
        [self.DrDetailView addSubview:YuYuebutton];
        
        
    }
    return _DrDetailView;
}

- (void)YuYuebuttonAction: (UIButton *)sender
{
    informationDetailViewController *infomationVC = [[informationDetailViewController alloc] init];
    infomationVC.is_fromHomePage = YES;
    [self.viewController.navigationController pushViewController:infomationVC animated:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
