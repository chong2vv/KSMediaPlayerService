//
//  KSPlayerContainerView.m
//  ArtVideoWB
//
//  Created by yinli on 2018/9/7.
//  Copyright © 2018年 雷华. All rights reserved.
//

#import "KSPlayerContainerView.h"
#import "NSBundle+ArtPodBundle.h"
@interface KSPlayerContainerView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *playBtn;
@property (nonatomic, strong) UIButton *closeBtn;

@end

@implementation KSPlayerContainerView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self configUI];
        [self addAllSubViews];
    }
    return self;
}

- (void)configUI {
    self.backgroundColor = [UIColor purpleColor];
    
}

- (void)addAllSubViews {
    [self addSubview:self.imageView];
    [self addSubview:self.closeBtn];
    [self addSubview:self.playBtn];
    self.playBtn.hidden = YES;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat min_x = 0;
    CGFloat min_y = 0;
    CGFloat min_w = 0;
    CGFloat min_h = 0;
    CGFloat min_view_w = self.bounds.size.width;
    CGFloat min_view_h = self.bounds.size.height;
    
    min_w = min_view_w;
    min_h = min_view_h;
    self.imageView.frame = CGRectMake(min_x, min_y, min_w, min_h);
    
    min_w = 47.;
    min_h = 52.;
    min_x = (min_view_w - min_w) * 0.5;
    min_y = (min_view_h - min_h) * 0.5;
    self.playBtn.frame = CGRectMake(min_x, min_y, min_w, min_h);
    self.playBtn.hidden = CGRectEqualToRect(self.frame, CGRectZero) || !self.isUserControlEnable;
    
    min_w = 33;
    min_h = 33;
    min_x = min_view_w - 20. - min_w;
    min_y = 20.;
    self.closeBtn.frame = CGRectMake(min_x, min_y, min_w, min_h);
    self.closeBtn.hidden = !self.isUserControlEnable;
}

#pragma mark - lazy load
- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [[UIButton alloc] init];
        [_closeBtn setImage:[UIImage imageNamed:@"KSMediaPlayer_close" inBundle:[NSBundle bundleWithBundleName:@"KSMediaPlayerService" podName:@"KSMediaPlayerService"] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
    }
    return _closeBtn;
}

- (UIButton *)playBtn {
    if (!_playBtn) {
        _playBtn = [[UIButton alloc] init];
        
        [_playBtn setImage:[UIImage imageNamed:@"KSMediaPlayer_play" inBundle:[NSBundle bundleWithBundleName:@"KSMediaPlayerService" podName:@"KSMediaPlayerService"] compatibleWithTraitCollection:nil] forState:UIControlStateNormal];
    }
    return _playBtn;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"KSMediaPlayer_cover" inBundle:[NSBundle bundleWithBundleName:@"KSMediaPlayerService" podName:@"KSMediaPlayerService"] compatibleWithTraitCollection:nil]];
        _imageView.backgroundColor = [UIColor whiteColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

@end
