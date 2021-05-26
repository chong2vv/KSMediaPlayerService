//
//  KSPlayerControlView.h
//  ArtVideoWB
//
//  Created by yinli on 2018/9/7.
//  Copyright © 2018年 雷华. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KSPlayerPortraitControlView.h"
#import "KSPlayerLandScapeControlView.h"
#import <ArtCommon/ZFPlayerMediaControl.h>
#import <ArtCommon/ZFSpeedLoadingView.h>

@interface KSPlayerControlView : UIView <ZFPlayerMediaControl>
/// 竖屏控制层的View
@property (nonatomic, strong, readonly) KSPlayerPortraitControlView *portraitControlView;
/// 横屏控制层的View
@property (nonatomic, strong, readonly) KSPlayerLandScapeControlView *landScapeControlView;
/// 加载loading
@property (nonatomic, strong, readonly) ZFSpeedLoadingView *activity;
/// 快进快退View
@property (nonatomic, strong, readonly) UIView *fastView;
/// 快进快退进度progress
@property (nonatomic, strong, readonly) ZFSliderView *fastProgressView;
/// 快进快退时间
@property (nonatomic, strong, readonly) UILabel *fastTimeLabel;
/// 快进快退ImageView
@property (nonatomic, strong, readonly) UIImageView *fastImageView;
/// 加载失败按钮
@property (nonatomic, strong, readonly) UIButton *failBtn;
/// 关闭播放按钮
@property (nonatomic, strong, readonly) UIButton *closeBtn;
/// 底部播放进度
@property (nonatomic, strong, readonly) ZFSliderView *bottomPgrogress;
/// 封面图
@property (nonatomic, strong, readonly) UIImageView *coverImageView;
/// 占位图，默认是灰色
@property (nonatomic, strong) UIImage *placeholderImage;
/// user control player enable
@property (nonatomic, assign) BOOL isUserControlEnable;
/// 控制层play or pause
@property (nonatomic, copy, nullable) void(^controlPlayOrPause)(BOOL isPlaying);
/// 控制层拖动播放进度
@property (nonatomic, copy, nullable) void(^controlSeekto)(NSTimeInterval time);

/// 设置标题、封面、全屏模式
- (void)showTitle:(NSString *)title coverURLString:(NSString *)coverUrl fullScreenMode:(ZFFullScreenMode)fullScreenMode;
/// 重置控制层
- (void)resetControlView;

@end
