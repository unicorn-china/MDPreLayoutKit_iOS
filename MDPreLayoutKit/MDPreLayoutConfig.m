//
//  MDPreLayoutConfig.m
//  Demo
//
//  Created by 李永杰 on 2019/8/12.
//  Copyright © 2019 muheda. All rights reserved.
//

#import "MDPreLayoutConfig.h"

@implementation MDPreLayoutConfig

- (instancetype)init {

    if (self = [super init]) {
        [self config];
    };
    return self;
}

- (void)config {

    self.preItemColor    = [UIColor redColor];
    self.backgroundColor = [UIColor whiteColor];
    self.cornerRadius    = 5;
    self.isAnimation     = YES;
    self.animation       = [CABasicAnimation animationWithKeyPath:@"opacity"];
    [self configAnimation];
}

- (void)configAnimation {

    _animation.fromValue           = [NSNumber numberWithFloat:1.1f];
    _animation.toValue             = [NSNumber numberWithFloat:0.6f];
    _animation.autoreverses        = YES;
    _animation.duration            = 1;
    _animation.repeatCount         = HUGE_VALF;
    _animation.removedOnCompletion = NO;
    _animation.fillMode            = kCAFillModeForwards;
    _animation.timingFunction      = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
}

@end
