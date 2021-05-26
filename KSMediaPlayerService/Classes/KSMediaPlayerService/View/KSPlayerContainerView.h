//
//  KSPlayerContainerView.h
//  ArtVideoWB
//
//  Created by yinli on 2018/9/7.
//  Copyright © 2018年 雷华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSPlayerContainerView : UIView

@property (nonatomic, strong, readonly) UIButton *playBtn;
@property (nonatomic, strong, readonly) UIButton *closeBtn;
/// user control player enable
@property (nonatomic, assign) BOOL isUserControlEnable;

@end
