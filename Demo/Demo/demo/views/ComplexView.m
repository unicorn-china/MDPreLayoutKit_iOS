//
//  ComplexView.m
//  Demo
//
//  Created by 李永杰 on 2019/8/13.
//  Copyright © 2019 muheda. All rights reserved.
//

#import "ComplexView.h"
#import "MDPreLayoutKit.h"

@interface HeaderView : UIView <MDPreLayoutProtocol>

@property (nonatomic, strong) UIImageView *avatorImageView;
@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.avatorImageView];
        [self addSubview:self.nameLabel];
    }
    return self;
}

- (NSArray<CALayer *> *)preLayout {

    CALayer *oneLayer        = [CALayer layer];
    oneLayer.frame           = CGRectMake(10, 10, 80, 80);
    oneLayer.backgroundColor = [UIColor colorWithRed:153 / 255.0 green:50 / 255.0 blue:204 / 255.0 alpha:1].CGColor;
    oneLayer.cornerRadius    = 40;
    oneLayer.masksToBounds   = YES;
    [oneLayer addAnimation:[self avatorAnimationWithLayer:oneLayer] forKey:@"avatorAnimation1"];

    CALayer *twoLayer        = [CALayer layer];
    twoLayer.frame           = CGRectMake(100, 10, 100, 20);
    twoLayer.backgroundColor = [UIColor colorWithRed:240 / 255.0 green:215 / 255.0 blue:0 / 255.0 alpha:1].CGColor;
    twoLayer.cornerRadius    = 10;
    [twoLayer addAnimation:[self avatorAnimationWithLayer:twoLayer] forKey:@"avatorAnimation2"];

    CALayer *threeLayer        = [CALayer layer];
    threeLayer.frame           = CGRectMake(100, 50, 160, 20);
    threeLayer.backgroundColor = [UIColor colorWithRed:240 / 255.0 green:215 / 255.0 blue:0 / 255.0 alpha:1].CGColor;
    threeLayer.cornerRadius    = 10;
    [threeLayer addAnimation:[self avatorAnimationWithLayer:twoLayer] forKey:@"avatorAnimation3"];

    return @[ oneLayer, twoLayer, threeLayer ];
}
#pragma mark 动画
- (CAKeyframeAnimation *)avatorAnimationWithLayer:(CALayer *)layer {

    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"backgroundColor"];
    UIColor *deepColor             = [UIColor colorWithRed:0.88 green:0.88 blue:0.88 alpha:1];
    animation.values               = @[ (id) deepColor.CGColor, (id) layer.backgroundColor, (id) layer.backgroundColor, (id) deepColor.CGColor ];
    animation.duration             = 1.48;
    animation.removedOnCompletion  = NO;
    animation.repeatCount          = HUGE_VALF;
    animation.fillMode             = kCAFillModeForwards;
    animation.timingFunction       = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    return animation;
}
- (UIImageView *)avatorImageView {
    if (!_avatorImageView) {
        _avatorImageView                     = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
        _avatorImageView.image               = [UIImage imageNamed:@"apple"];
        _avatorImageView.layer.cornerRadius  = 40;
        _avatorImageView.layer.masksToBounds = YES;
    }
    return _avatorImageView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel      = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 160, 30)];
        _nameLabel.font = [UIFont systemFontOfSize:13];
        _nameLabel.text = @"酷狗music";
    }
    return _nameLabel;
}
@end

@interface InfoView : UIView <MDPreLayoutProtocol>

@property (nonatomic, strong) UIButton *choosePhotoButton;

@end

@implementation InfoView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.choosePhotoButton];
    }
    return self;
}

- (NSArray<CALayer *> *)preLayout {

    CALayer *oneLayer        = [CALayer layer];
    oneLayer.frame           = CGRectMake(20, 20, 140, 20);
    oneLayer.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:1].CGColor;
    oneLayer.cornerRadius    = 10;
    oneLayer.masksToBounds   = YES;
    [oneLayer addAnimation:[self lengthAnimation:oneLayer.frame.origin.x layer:oneLayer] forKey:@"lengthAnimation1"];

    CALayer *twoLayer        = [CALayer layer];
    twoLayer.frame           = CGRectMake(20, 60, 200, 20);
    twoLayer.backgroundColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:1].CGColor;
    twoLayer.cornerRadius    = 10;
    twoLayer.masksToBounds   = YES;
    [twoLayer addAnimation:[self lengthAnimation:twoLayer.frame.origin.x layer:twoLayer] forKey:@"lengthAnimation2"];

    return @[ oneLayer, twoLayer ];
}

- (CABasicAnimation *)lengthAnimation:(CGFloat)x layer:(CALayer *)layer {

    CGRect bounds          = layer.bounds;
    layer.position         = CGPointMake(x, layer.frame.origin.y);
    layer.anchorPoint      = CGPointMake(0, 0);
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"bounds"];
    anim.duration          = 1.f;
    anim.toValue           = [NSValue valueWithCGRect:bounds];
    bounds.size.width      = bounds.size.width - 40;
    anim.fromValue         = [NSValue valueWithCGRect:bounds];

    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.repeatCount    = CGFLOAT_MAX;
    anim.autoreverses   = YES;
    return anim;
}

- (UIButton *)choosePhotoButton {
    if (!_choosePhotoButton) {
        _choosePhotoButton       = [UIButton buttonWithType:UIButtonTypeCustom];
        _choosePhotoButton.frame = CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.height - 40);
        [_choosePhotoButton setTitle:@"选择图片" forState:UIControlStateNormal];
        [_choosePhotoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _choosePhotoButton.backgroundColor = [UIColor yellowColor];
    }
    return _choosePhotoButton;
}

@end

@interface IndicatorView : UIView <MDPreLayoutProtocol>

@property (nonatomic, strong) UILabel *loadingLabel;

@property (nonatomic, strong) CAShapeLayer *shapeLayer;

@end

@implementation IndicatorView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.loadingLabel];
    }
    return self;
}
- (NSArray<CALayer *> *)preLayout {

    self.shapeLayer.strokeColor = [UIColor redColor].CGColor;
    self.shapeLayer.fillColor   = [UIColor clearColor].CGColor;
    self.shapeLayer.lineWidth   = 5.0f;
    [self.shapeLayer addAnimation:[self loadingAnimation] forKey:@"loadingAnimation"];

    return @[ self.shapeLayer ];
}
- (UILabel *)loadingLabel {
    if (!_loadingLabel) {
        _loadingLabel               = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, self.frame.size.width - 40, 20)];
        _loadingLabel.text          = @"加载完成";
        _loadingLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _loadingLabel;
}
- (CAShapeLayer *)shapeLayer {
    if (!_shapeLayer) {
        _shapeLayer       = [CAShapeLayer layer];
        _shapeLayer.frame = CGRectMake(self.frame.size.width / 2 - 50, 0, 100, 100);
    }
    return _shapeLayer;
}
- (CAAnimationGroup *)loadingAnimation {

    UIBezierPath *storkePath    = [UIBezierPath bezierPathWithOvalInRect:self.shapeLayer.bounds];
    self.shapeLayer.path        = storkePath.CGPath;
    self.shapeLayer.strokeStart = 0;
    self.shapeLayer.strokeEnd   = 0.1;

    //旋转动画
    CABasicAnimation *rotateAnimaiton   = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAnimaiton.duration            = 1.f;
    rotateAnimaiton.repeatCount         = CGFLOAT_MAX;
    rotateAnimaiton.removedOnCompletion = NO;
    rotateAnimaiton.fillMode            = kCAFillModeForwards;
    rotateAnimaiton.toValue             = @(M_PI * 2);

    // stroke动画
    CABasicAnimation *storkeAnimation   = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    storkeAnimation.duration            = 2.f;
    storkeAnimation.repeatCount         = CGFLOAT_MAX;
    storkeAnimation.fillMode            = kCAFillModeForwards;
    storkeAnimation.removedOnCompletion = NO;
    storkeAnimation.toValue             = @(1);

    CAAnimationGroup *animationGroup   = [CAAnimationGroup animation];
    animationGroup.duration            = 2.f;
    animationGroup.repeatCount         = CGFLOAT_MAX;
    animationGroup.fillMode            = kCAFillModeForwards;
    animationGroup.removedOnCompletion = NO;
    animationGroup.animations          = @[ rotateAnimaiton, storkeAnimation ];
    animationGroup.timingFunction      = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];

    return animationGroup;
}
@end

@interface ComplexView ()

@property (nonatomic, strong) HeaderView *headerView;
@property (nonatomic, strong) InfoView *infoView;
@property (nonatomic, strong) IndicatorView *indicatorView;

@end

@implementation ComplexView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.headerView];
        [self addSubview:self.infoView];
        [self addSubview:self.indicatorView];
    }
    return self;
}

- (void)setLoaded:(BOOL)loaded {
    _loaded = loaded;
    if (loaded) {

        [self.headerView endPreLayout];
        [self.infoView endPreLayout];
        [self.indicatorView endPreLayout];
    } else {
        [self.headerView beginPreLayout];

        MDPreLayoutConfig *config     = [[MDPreLayoutConfig alloc] init];
        config.backgroundColor        = [UIColor colorWithRed:211 / 255.0 green:211 / 255.0 blue:211 / 255.0 alpha:1];
        self.infoView.preLayoutConfig = config;
        [self.infoView beginPreLayout];
        [self.indicatorView beginPreLayout];
    }
}

- (HeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[HeaderView alloc] initWithFrame:CGRectMake(0, 100, self.frame.size.width, 100)];
    }
    return _headerView;
}

- (InfoView *)infoView {
    if (!_infoView) {
        _infoView = [[InfoView alloc] initWithFrame:CGRectMake(0, 220, self.frame.size.width, 100)];
    }
    return _infoView;
}
- (IndicatorView *)indicatorView {
    if (!_indicatorView) {
        _indicatorView = [[IndicatorView alloc] initWithFrame:CGRectMake(0, 340, self.frame.size.width, 100)];
    }
    return _indicatorView;
}
@end
