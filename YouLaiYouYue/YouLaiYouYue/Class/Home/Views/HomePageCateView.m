//
//  HomePageCateView.m
//  XueTuoBang
//
//  Created by mac on 2017/6/5.
//  Copyright © 2017年 com.hongdingnet.guan. All rights reserved.
//

#import "HomePageCateView.h"

@implementation HomePageCateView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addUI];
        [self settingAutoLayout];
        self.backgroundColor = [UIColor whiteColor];
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
    [self addSubview:self.typeImg];
    [self addSubview:self.numLabel];
}

- (void)settingAutoLayout{
//    [_typeLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
//    [_typeLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
//    [_typeLabel autoSetDimension:ALDimensionWidth toSize:50];
    [_typeImg autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 0, 0, 0) excludingEdge:ALEdgeBottom];
    [_typeImg autoSetDimension:ALDimensionHeight toSize:20];
    //    _imgView.layer.borderWidth = 1;
    
    [_numLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_typeImg withOffset:5];
    [_numLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
//    [_numLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
//    [_numLabel autoSetDimension:ALDimensionHeight toSize:12];
    //    _typeLabel.layer.borderWidth = 1;
}

//- (UILabel *)typeLabel{
//    if (!_typeLabel) {
//        _typeLabel = [[UILabel alloc] initForAutoLayout];
//        _typeLabel.font = [UIFont boldSystemFontOfSize:15];
//        _typeLabel.textColor = UIColorFromRGB(0x333333);
//        _typeLabel.textAlignment = NSTextAlignmentCenter;
//    }
//    return _typeLabel;
//}

- (UIImageView *)typeImg {
    if (!_typeImg) {
        _typeImg = [[UIImageView alloc] initForAutoLayout];
        _typeImg.contentMode = UIViewContentModeScaleAspectFit;
        _typeImg.userInteractionEnabled = YES;
    }
    return _typeImg;
}

- (UILabel *)numLabel{
    if (!_numLabel) {
        _numLabel = [[UILabel alloc] initForAutoLayout];
        _numLabel.font = [UIFont systemFontOfSize:13];
        _numLabel.textAlignment = NSTextAlignmentCenter;
        _numLabel.textColor = UIColorFromRGB(0x979797);
    }
    return _numLabel;
}



@end
