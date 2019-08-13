//
//  CustomTableViewCell.m
//  Demo
//
//  Created by 李永杰 on 2019/8/13.
//  Copyright © 2019 muheda. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "MDPreLayoutKit.h"

@interface TableStyleView : UIView

@property (nonatomic, strong) UIImageView   *avatorImageView;
@property (nonatomic, strong) UILabel       *titleLabel;
@property (nonatomic, strong) UILabel       *detailLabel;

@property (nonatomic, strong) TableModel    *model;

@end

@implementation TableStyleView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.avatorImageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.detailLabel];
    }
    return self;
}

- (void)setModel:(TableModel *)model {
    _model = model;
    self.avatorImageView.image = [UIImage imageNamed:model.avator];
    self.titleLabel.text = model.title;
    self.detailLabel.text = model.detail;
}

- (UIImageView *)avatorImageView {
    if (!_avatorImageView) {
        _avatorImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
    }
    return _avatorImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 10, 160, 20)];
        _titleLabel.font = [UIFont systemFontOfSize:13];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 40, 200, 40)];
        _detailLabel.numberOfLines = 0;
        _detailLabel.font = [UIFont systemFontOfSize:11];
    }
    return _detailLabel;
}
@end

@interface CustomTableViewCell ()

@property (nonatomic, strong) TableStyleView    *styleView;

@end

@implementation CustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.styleView];
    }
    return self;
}

- (void)setIsLoaded:(BOOL)isLoaded {
    _isLoaded = isLoaded;
    if (isLoaded) {
        [self.styleView endPreLayout];
    } else {
        [self.styleView beginPreLayout];
    }
}

- (void)setModel:(TableModel *)model {
    _model = model;
    self.styleView.model = model;
}

- (TableStyleView *)styleView {
    if (!_styleView) {
        _styleView = [[TableStyleView alloc]initWithFrame:self.contentView.bounds];
    }
    return _styleView;
}

@end
