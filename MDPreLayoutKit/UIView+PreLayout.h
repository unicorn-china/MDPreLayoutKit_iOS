//
//  UIView+PreLayout.h
//  Demo
//
//  Created by 李永杰 on 2019/8/12.
//  Copyright © 2019 muheda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDPreLayoutConfig.h"

@interface UIView (PreLayout)
// 子layer
@property (nonatomic, strong) NSMutableArray    *subLayers;
// 配置项
@property (nonatomic, strong) MDPreLayoutConfig *preLayoutConfig;
// 预加载背景
@property (nonatomic, strong) CALayer           *backgroundLayer;

- (void)beginPreLayout;

- (void)endPreLayout;

@end
