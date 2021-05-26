//
//  KSLightweightPlayerManger.m
//  ArtVideoWB
//
//  Created by yinli on 2019/7/10.
//  Copyright © 2019 美术宝. All rights reserved.
//

#import "KSLightweightPlayerManger.h"
#import "ArtUIUtils.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#if TARGET_OS_SIMULATOR
@implementation KSLightweightPlayerManger
@end
#else
#import <KSYMediaPlayer/KSYMediaPlayer.h>

@interface KSLightweightPlayerManger ()

@property (nonatomic, strong) KSYMoviePlayerController *player;

@property (nonatomic, assign) NSTimeInterval currentTime;
@property (nonatomic, assign) NSTimeInterval totalTime;
@property (nonatomic, assign) NSTimeInterval bufferTime;

@property (nonatomic, assign) KSLwPlayerState playState;

@end

@implementation KSLightweightPlayerManger

@synthesize rate                           = _rate;

#pragma mark - public method
- (void)prepareToPlay {
    NSLog(@"KSLwPlayerManger_Player PrepareToPlay");
    if (!_assetURL) return;
    if (!_containerView) return;
    _isPreparedToPlay = YES;
    _player = [[KSYMoviePlayerController alloc] initWithContentURL:_assetURL];
    _player.shouldAutoplay = YES;
    [self _addPlayerNotification];
    
    [_containerView addSubview:self.player.view];
    [_containerView sendSubviewToBack:self.player.view];
    _player.view.backgroundColor = [UIColor clearColor];
    _player.view.frame = _containerView.bounds;
    _player.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _player.scalingMode = MPMovieScalingModeAspectFit;
    _player.controlStyle = MPMovieControlStyleNone;
    _player.logBlock = ^(NSString *logJson) {
        NSLog(@"KSLwPlayerManger_log: %@",logJson);
    };
    //    [_player setTimeout:30. readTimeout:60.];
    [_player prepareToPlay];
}

- (void)play {
    NSLog(@"KSLwPlayerManger_Player PLay");
    if (!_isPreparedToPlay) {
        [self prepareToPlay];
    } else {
        [self.player play];
        self.player.playbackSpeed = self.rate;
        self.playState = KSLwPlayerStatePlaying;
    }
}

- (void)pause {
    NSLog(@"KSLwPlayerManger_Player Pause");
    [self.player pause];
    self.playState = KSLwPlayerStatePaused;
}

- (void)stop {
    NSLog(@"KSLwPlayerManger_Player Stop");
    self.playState = KSLwPlayerStatePlayStopped;
    [self.player stop];
    [self.player.view removeFromSuperview];
    [self _destory];
    self.player = nil;
    self->_currentTime = 0;
    self->_totalTime = 0;
    self->_bufferTime = 0;
}

- (void)seekToTime:(NSTimeInterval)time completionHandler:(void (^ __nullable)(BOOL finished))completionHandler {
    NSLog(@"seekToTime %lf",time);
    [self.player seekTo:time accurate:YES];
    if (completionHandler) completionHandler(YES);
}

#pragma mark - private method
- (void)dealloc {
    [self _destory];
}

- (void)_destory {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_player removeObserver:self forKeyPath:@"currentPlaybackTime"];
    _isPreparedToPlay = NO;
}

- (void)_addPlayerNotification {
    /// 准备开始播放了
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(videoPrepared:)
                                                 name:MPMediaPlaybackIsPreparedToPlayDidChangeNotification
                                               object:self.player];
    /// 播放完成
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(videoFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:self.player];
    [_player addObserver:self forKeyPath:@"currentPlaybackTime" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    dispatch_async(dispatch_get_main_queue(), ^{
        if ([keyPath isEqualToString:@"currentPlaybackTime"]) {
            self->_currentTime = self.player.currentPlaybackTime;
            self->_totalTime = self.player.duration;
            self->_bufferTime = self.player.playableDuration;
            if (self.playerPlayTimeChanged) self.playerPlayTimeChanged(self, self->_currentTime, self->_totalTime);
        }
    });
}

/// 播放器初始化视频文件完成通知
- (void)videoPrepared:(NSNotification *)notify {
    [self play];
}

/// 播放完成通知。视频正常播放完成时触发。
- (void)videoFinish:(NSNotification *)notify {
    WEAKSELF(weakSelf);
    NSInteger reason = [[notify.userInfo valueForKey:MPMoviePlayerPlaybackDidFinishReasonUserInfoKey] integerValue];
    if (reason == MPMovieFinishReasonPlaybackEnded) {
        self.playState = KSLwPlayerStatePlayStopped;
        if (self.playerDidToEnd) self.playerDidToEnd(weakSelf);
    } else if (reason == MPMovieFinishReasonPlaybackError) {
        self.playState = KSLwPlayerStatePlayFailed;
        _isPreparedToPlay = NO;
        NSString *error = [notify.userInfo valueForKey:@"error"];
        NSLog(@"player Error : %@", error);
        if (self.playerPlayFailed) self.playerPlayFailed(weakSelf, error);
    } else if (reason == MPMovieFinishReasonUserExited){
        /// player userExited
    }
}

/// 播放器Seek完成后发送该通知。
- (void)seekDone:(NSNotification *)notify {
    [self play];
}

- (void)replay {
    if (!self.player) {
        return;
    }
    @weakify(self)
    [self seekToTime:0 completionHandler:^(BOOL finished) {
        @strongify(self)
        [self play];
    }];
}

#pragma mark - setter
- (void)setRate:(float)rate {
    _rate = rate;
    self.player.playbackSpeed = rate;
}

#pragma mark - getter
- (float)rate {
    return _rate == 0 ?1:_rate;
}

@end
#endif
