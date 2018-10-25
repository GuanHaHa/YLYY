//
//  FunctionView.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/20.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "FunctionView.h"

@implementation FunctionView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addUI];
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickView:)];
        [self addGestureRecognizer:gesture];
        
    }
    return self;
}

- (void)clickView:(UITapGestureRecognizer *)gesture{
    if ([self.delegate respondsToSelector:@selector(seleFunctionView:)]) {
        [self.delegate seleFunctionView:gesture.view.tag];
    }
}

- (void)addUI{
    [self addSubview:self.titleLabel];
    [self addSubview:self.img];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_titleLabel autoAlignAxisToSuperviewAxis:(ALAxisHorizontal)];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:SCREEN_WIDTH/3-80];
    
    CGSize maximumLabelSize = CGSizeMake(100, 9999);//labelsize的最大值
    CGSize expectSize = [_titleLabel sizeThatFits:maximumLabelSize];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:5];
    [_titleLabel autoSetDimension:ALDimensionHeight toSize:20];
    
    [_img autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_titleLabel];
    [_img autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_titleLabel withOffset:-3];
    [_img autoSetDimension:ALDimensionWidth toSize:20];
    [_img autoSetDimension:ALDimensionHeight toSize:20];
    
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.text = @"第一天 玉龙雪山";
        _titleLabel.textColor = UIColorFromRGB(0x333333);
        _titleLabel.font = [UIFont systemFontOfSize:15];
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
