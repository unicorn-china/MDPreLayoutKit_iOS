//
//  TestView.m
//  Demo
//
//  Created by 李永杰 on 2019/8/12.
//  Copyright © 2019 muheda. All rights reserved.
//

#import "CommonView.h"

@implementation CommonView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame: frame]) {
        
        [self addSubview:self.leftView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.detailLabel];
    }
    return self;
}

- (UIImageView *)leftView {
    if (!_leftView) {
        _leftView = [[UIImageView alloc]initWithFrame:CGRectMake(25, 25, 50, 50)];
        _leftView.image = [UIImage imageNamed:@"Shiba"];
    }
    return _leftView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 10, 50, 20)];
        _titleLabel.text = @"小鲁班";
        _titleLabel.font = [UIFont systemFontOfSize:10];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 50, 80, 30)];
        _detailLabel.text = @"王者峡谷敌方野区红buff旁边";
        _detailLabel.font = [UIFont systemFontOfSize:10];
        _detailLabel.numberOfLines = 0;
    }
    return _detailLabel;
}

@end
