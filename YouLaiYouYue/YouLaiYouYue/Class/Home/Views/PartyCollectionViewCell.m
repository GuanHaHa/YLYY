//
//  PartyCollectionViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/18.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "PartyCollectionViewCell.h"

@implementation PartyCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        self.layer.borderWidth = 1;
        [self.contentView addSubview:self.imageView];
        [self.contentView addSubview:self.titleLabel];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_imageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) excludingEdge:ALEdgeBottom];
    [_imageView autoSetDimension:ALDimensionHeight toSize:40];
    _imageView.layer.cornerRadius = 20;
    _imageView.clipsToBounds = YES;
//    _imageView.layer.borderWidth = 1;
    
    [_titleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_imageView withOffset:5];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:2];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:2];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:2];
//    _titleLabel.layer.borderWidth = 1;
    

    
    
}

- (void)setModel:(SignModel *)model {
    _model = model;
    
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_model.userpic] placeholderImage:nil];
    if ([_model.noname isEqualToString:@"1"]) {
        _titleLabel.text = [NSString stringWithFormat:@"匿名(%@)",_model.num];
    }else {
        _titleLabel.text = _model.username;
    }
    
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initForAutoLayout];
        _imageView.image = [UIImage imageNamed:@"2"];
        
    }
    return _imageView;
}



- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.text = @"是昵称";
        _titleLabel.textColor = UIColorFromRGB(0x333333);
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}



@end
