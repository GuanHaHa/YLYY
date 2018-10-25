//
//  ButtonView.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/20.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "ButtonView.h"

@implementation ButtonView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addUI];
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickView:)];
        [self addGestureRecognizer:gesture];
        
    }
    return self;
}

- (void)clickView:(UITapGestureRecognizer *)gesture{
    if ([self.delegate respondsToSelector:@selector(seleView:)]) {
        [self.delegate seleView:gesture.view.tag];
    }
}

- (void)addUI{
    [self addSubview:self.titleLabel];
    [self addSubview:self.img];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_img autoAlignAxisToSuperviewAxis:(ALAxisHorizontal)];
    [_img autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:5];
//    [_img autoAlignAxis:ALAxisVertical toSameAxisOfView:self withOffset:-10];
//    [_titleLabel autoAlignAxisToSuperviewAxis:(ALAxisVertical)];
    [_img autoSetDimension:ALDimensionWidth toSize:20];
    [_img autoSetDimension:ALDimensionHeight toSize:20];
//    _titleLabel.layer.borderWidth = 1;
    
    [_titleLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_img];
    [_titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img withOffset:3];
    [_titleLabel autoSetDimension:ALDimensionWidth toSize:70];
    [_titleLabel autoSetDimension:ALDimensionHeight toSize:20];
    
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
//        _titleLabel.text = @"第一天 玉龙雪山";
        _titleLabel.textColor = UIColorFromRGB(0x333333);
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}

- (UIImageView *)img {
    if (!_img) {
        _img = [[UIImageView alloc] initForAutoLayout];
        _img.contentMode = UIViewContentModeScaleAspectFit;
        _img.userInteractionEnabled = YES;
    }
    return _img;
}


@end
