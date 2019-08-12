//
//  UIView+PreLayout.m
//  Demo
//
//  Created by 李永杰 on 2019/8/12.
//  Copyright © 2019 muheda. All rights reserved.
//
#import <objc/runtime.h>
#import "UIView+PreLayout.h"
#import "MDPreLayoutProtocol.h"

static void *kMDConfigKey          = &kMDConfigKey;
static void *kMDSubLayersKey       = &kMDSubLayersKey;
static void *kMDBackgroundLayerKey = &kMDBackgroundLayerKey;

@implementation UIView (PreLayout)

#pragma mark - 关联属性

- (MDPreLayoutConfig *)preLayoutConfig {
    return objc_getAssociatedObject(self, kMDConfigKey);
}

- (void)setPreLayoutConfig:(MDPreLayoutConfig *)config {
    if (config) {
        objc_setAssociatedObject(self, kMDConfigKey, config, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (NSMutableArray *)subLayers {
    return objc_getAssociatedObject(self, kMDSubLayersKey);
}

- (void)setSubLayers:(NSMutableArray *)subLayers {
    if (subLayers) {
        objc_setAssociatedObject(self, kMDSubLayersKey, subLayers, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (CALayer *)backgroundLayer {
    return objc_getAssociatedObject(self, kMDBackgroundLayerKey);
}

- (void)setBackgroundLayer:(CALayer *)backgroundLayer {
    if (backgroundLayer) {
        objc_setAssociatedObject(self, kMDBackgroundLayerKey, backgroundLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

#pragma mark - 扩展方法
- (void)beginPreLayout {
    if (self.preLayoutConfig == nil) {
        self.preLayoutConfig = [[MDPreLayoutConfig alloc] init];
    }

    self.subLayers                  = [NSMutableArray array];
    CALayer *backgroundLayer        = [CALayer layer];
    backgroundLayer.frame           = self.bounds;
    backgroundLayer.backgroundColor = self.preLayoutConfig.backgroundColor.CGColor;
    [self.layer addSublayer:backgroundLayer];
    self.backgroundLayer = backgroundLayer;

    if ([self conformsToProtocol:@protocol(MDPreLayoutProtocol)] && [self respondsToSelector:@selector(preLayout)]) {
        NSArray<CALayer *> *layers = [(CALayer<MDPreLayoutProtocol> *) self preLayout];
        [self manualPreLayersWithLayers:layers];
    } else {
        NSArray *subviews = [self subviews];
        [self autoPreLayersWithLayers:subviews];
    }
}

- (void)manualPreLayersWithLayers:(NSArray<CALayer *> *)layers {

    for (CALayer *layer in layers) {
        [self.layer addSublayer:layer];
        [self.subLayers addObject:layer];
    }
}

- (void)autoPreLayersWithLayers:(NSArray<UIView *> *)subviews {

    for (UIView *view in subviews) {
        CALayer *layer = [CALayer layer];
        [self.layer addSublayer:layer];
        layer.frame           = view.frame;
        layer.backgroundColor = self.preLayoutConfig.preItemColor.CGColor;
        layer.cornerRadius    = self.preLayoutConfig.cornerRadius;
        [self.subLayers addObject:layer];
        if (self.preLayoutConfig.isAnimation) {
            [layer addAnimation:self.preLayoutConfig.animation forKey:@"BinAnimation"];
        }
    }
}

- (void)endPreLayout {

    [self.backgroundLayer removeFromSuperlayer];
    for (CALayer *layer in self.subLayers) {
        [layer removeFromSuperlayer];
        [layer removeAllAnimations];
    }
    [self.subLayers removeAllObjects];
}

@end
