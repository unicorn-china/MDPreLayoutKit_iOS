//
//  TestView.h
//  Demo
//
//  Created by 李永杰 on 2019/8/12.
//  Copyright © 2019 muheda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDPreLayoutProtocol.h"

@interface TestView : UIView <MDPreLayoutProtocol>

@property (nonatomic, strong) UIImageView   *leftView;

@property (nonatomic, strong) UILabel       *titleLabel;

@property (nonatomic, strong) UILabel       *detailLabel;

@end
