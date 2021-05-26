//
//  KSLightweightPlayerManger.h
//  ArtVideoWB
//
//  Created by yinli on 2019/7/10.
//  Copyright © 2019 美术宝. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, KSLwPlayerState) {
    KSLwPlayerStateUnknown = 0,
    KSLwPlayerStatePlaying,
    KSLwPlayerStatePaused,
    KSLwPlayerStatePlayFailed,
    KSLwPlayerStatePlayStopped
};

@interface KSLightweightPlayerManger : NSObject

/// The player current play time.
@property (nonatomic, readonly) NSTimeInterval currentTime;

/// The player total time.
@property (nonatomic, readonly) NSTimeInterval totalTime;

/// The player buffer time.
@property (nonatomic, readonly) NSTimeInterval bufferTime;

/// Playback speed,0.5...2
@property (nonatomic, assign) float rate;

/// The playback state.
@property (nonatomic, readonly) KSLwPlayerState playState;

/**
 @abstract Check whether video preparation is complete.
 @discussion isPreparedToPlay processing logic
 
 * Returns YES if prepared for playback.
 */
@property (nonatomic, readonly) BOOL isPreparedToPlay;

/// The play asset URL.
@property (nonatomic) NSURL *assetURL;

/// The view contain player.view
@property (nonatomic, weak) UIView *containerView;


@property (nonatomic, copy, nullable) void(^playerPlayTimeChanged)(KSLightweightPlayerManger *asset, NSTimeInterval currentTime, NSTimeInterval duration);
@property (nonatomic, copy, nullable) void(^playerDidToEnd)(KSLightweightPlayerManger * _Nullable asset);
@property (nonatomic, copy, nullable) void(^playerPlayFailed)(KSLightweightPlayerManger * _Nullable asset, id _Nullable error);

/// Prepares the current queue for playback, interrupting any active (non-mixible) audio sessions.
- (void)prepareToPlay;

/// Play playback.
- (void)play;

/// Pauses playback.
- (void)pause;

/// Replay playback.
- (void)replay;

/// Stop playback.
- (void)stop;

/// Use this method to seek to a specified time for the current player and to be notified when the seek operation is complete.
- (void)seekToTime:(NSTimeInterval)time completionHandler:(void (^ __nullable)(BOOL finished))completionHandler;

@end
