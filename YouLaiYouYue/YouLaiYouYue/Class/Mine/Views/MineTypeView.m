//
//  MineTypeView.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/24.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "MineTypeView.h"

@implementation MineTypeView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addUI];
        [self settingAutoLayout];
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickView:)];
        [self addGestureRecognizer:gesture];
    }
    return self;
}

- (void)clickView:(UITapGestureRecognizer *)gesture{
    if ([self.delegate respondsToSelector:@selector(selectView:)]) {
        [self.delegate selectView:gesture.view.tag];
    }
}

- (void)addUI{
    [self addSubview:self.imgView];
    [self addSubview:self.typeLabel];
}

- (void)settingAutoLayout{
    [_imgView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [_imgView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
    [_imgView autoSetDimension:ALDimensionWidth toSize:30];
    [_imgView autoSetDimension:ALDimensionHeight toSize:30];
    //    _imgView.layer.borderWidth = 1;
    
    [_typeLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
    [_typeLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_imgView withOffset:5];
    //    _typeLabel.layer.borderWidth = 1;
}

- (UIImageView *)imgView{
    if (!_imgView) {
        _imgView = [[UIImageView alloc] initForAutoLayout];
        _imgView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imgView;
}

- (UILabel *)typeLabel{
    if (!_typeLabel) {
        _typeLabel = [[UILabel alloc] initForAutoLayout];
        _typeLabel.font = [UIFont systemFontOfSize:13];
        _typeLabel.textAlignment = NSTextAlignmentCenter;
        _typeLabel.textColor = UIColorFromRGB(0x7e7e7e);
    }
    return _typeLabel;
}

@end
