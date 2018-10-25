//
//  SlideCollectionViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/17.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "SlideCollectionViewCell.h"

@implementation SlideCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self.contentView addSubview:self.imgView];
        [self.imgView addSubview:self.playImg];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_imgView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    
    [_playImg autoAlignAxis:ALAxisVertical toSameAxisOfView:_imgView];
    [_playImg autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_imgView];
    [_playImg autoSetDimension:ALDimensionWidth toSize:30];
    [_playImg autoSetDimension:ALDimensionHeight toSize:30];
    
}

- (void)setModel:(VideoModel *)model {
    _model = model;
    [_imgView sd_setImageWithURL:[NSURL URLWithString:_model.img] placeholderImage:nil];
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [[UIImageView alloc] initForAutoLayout];
        _imgView.image = [UIImage imageNamed:@"2.jpg"];
        _imgView.layer.cornerRadius = 1;
        _imgView.clipsToBounds = YES;
    }
    return _imgView;
}

- (UIImageView *)playImg {
    if (!_playImg) {
        _playImg = [[UIImageView alloc] initForAutoLayout];
        _playImg.image = [UIImage imageNamed:@"开始"];
        _playImg.layer.cornerRadius = 1;
        _playImg.clipsToBounds = YES;
    }
    return _playImg;
}


@end
