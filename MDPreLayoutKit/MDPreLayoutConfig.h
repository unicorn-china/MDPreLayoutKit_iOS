//
//  MDPreLayoutConfig.h
//  Demo
//
//  Created by 李永杰 on 2019/8/12.
//  Copyright © 2019 muheda. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface MDPreLayoutConfig : NSObject
// 是否动画
@property (nonatomic, assign) BOOL isAnimation;
// item圆角
@property (nonatomic, assign) CGFloat cornerRadius;
// 预加载item颜色
@property (nonatomic, strong) UIColor *preItemColor;
// 预加载背景颜色
@property (nonatomic, strong) UIColor *backgroundColor;
// 动画
@property (nonatomic, strong) CABasicAnimation *animation;

@end
