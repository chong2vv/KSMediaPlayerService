//
//  KSPlayerLandScapeControlView.h
//  ArtVideoWB
//
//  Created by yinli on 2018/9/7.
//  Copyright © 2018年 雷华. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ArtCommon/ZFPlayerController.h>
#import <ArtCommon/ZFSliderView.h>

NS_ASSUME_NONNULL_BEGIN

@interface KSPlayerLandScapeControlView : UIView
/// 顶部工具栏
@property (nonatomic, strong, readonly) UIView *topToolView;
/// 返回按钮
@property (nonatomic, strong, readonly) UIButton *backBtn;
/// 标题
@property (nonatomic, strong, readonly) UILabel *titleLabel;
/// 底部工具栏
@property (nonatomic, strong, readonly) UIView *bottomToolView;
/// 播放或暂停按钮 
@property (nonatomic, strong, readonly) UIButton *playOrPauseBtn;
/// 播放的当前时间
@property (nonatomic, strong, readonly) UILabel *currentTimeLabel;
/// 滑杆
@property (nonatomic, strong, readonly) ZFSliderView *slider;
/// 视频总时间
@property (nonatomic, strong, readonly) UILabel *totalTimeLabel;
/// 锁定屏幕按钮
@property (nonatomic, strong, readonly) UIButton *lockBtn;
/// user control player enable
@property (nonatomic, assign) BOOL isUserControlEnable;
/// 播放器
@property (nonatomic, weak) ZFPlayerController *player;
/// 控制层play or pause
@property (nonatomic, copy, nullable) void(^controlPlayOrPause)(BOOL isPlaying);
/// slider滑动中
@property (nonatomic, copy, nullable) void(^sliderValueChanging)(CGFloat value,BOOL forward);
/// slider滑动结束
@property (nonatomic, copy, nullable) void(^sliderValueChanged)(CGFloat value);

/// 重置控制层
- (void)resetControlView;
/// 显示控制层
- (void)showControlView;
/// 隐藏控制层
- (void)hideControlView;
/// 设置播放时间
- (void)videoPlayer:(ZFPlayerController *)videoPlayer currentTime:(NSTimeInterval)currentTime totalTime:(NSTimeInterval)totalTime;
/// 设置缓冲时间
- (void)videoPlayer:(ZFPlayerController *)videoPlayer bufferTime:(NSTimeInterval)bufferTime;
/// 是否响应该手势
- (BOOL)shouldResponseGestureWithPoint:(CGPoint)point withGestureType:(ZFPlayerGestureType)type touch:(nonnull UITouch *)touch;
/// 标题和全屏模式
- (void)showTitle:(NSString *_Nullable)title fullScreenMode:(ZFFullScreenMode)fullScreenMode;
/// 根据当前播放状态取反
- (void)playOrPause;
/// 播放按钮状态
- (void)playBtnSelectedState:(BOOL)selected;

@end

NS_ASSUME_NONNULL_END
