//
//  HotTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/28.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "HotTableViewCell.h"

@implementation HotTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = UIColorFromRGB(0xf8f8f8);
        [self.contentView addSubview:self.bgView];
        [self.bgView addSubview:self.titleLabel];
        [self.bgView addSubview:self.bigImg];
        [self.bgView addSubview:self.contentLabel];
        [self.bgView addSubview:self.xian];
        [self.bgView addSubview:self.img];
        [self.bgView addSubview:self.moreLabel];
    
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_bgView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(20, 20, 10, 20)];
    
    [_titleLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) excludingEdge:ALEdgeBottom];
    [_titleLabel autoSetDimension:ALDimensionHeight toSize:20];
    
    [_bigImg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_bigImg autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [_bigImg autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:10];
    [_bigImg autoSetDimension:ALDimensionHeight toSize:155];
    
    [_contentLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_contentLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [_contentLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_bigImg withOffset:10];
    [_contentLabel autoSetDimension:ALDimensionHeight toSize:20];
    
    [_xian autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_xian autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [_xian autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_contentLabel withOffset:10];
    [_xian autoSetDimension:ALDimensionHeight toSize:1];
    
    [_img autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_xian withOffset:14];
    [_img autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [_img autoSetDimension:ALDimensionWidth toSize:15];
    [_img autoSetDimension:ALDimensionHeight toSize:15];
    
    [_moreLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_moreLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_img withOffset:-30];
    [_moreLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_img];
    [_moreLabel autoSetDimension:ALDimensionHeight toSize:20];
    
    
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] initForAutoLayout];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.layer.cornerRadius = 4;
        _bgView.clipsToBounds = YES;
    }
    return _bgView;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.text = @"山峰不会写游记";
        _titleLabel.textColor = UIColorFromRGB(0x333333);
        _titleLabel.font = [UIFont systemFontOfSize:15];
        
    }
    return _titleLabel;
}

- (UIImageView *)bigImg {
    if (!_bigImg) {
        _bigImg = [[UIImageView alloc] initForAutoLayout];
        _bigImg.image = [UIImage imageNamed:@"2"];
        _bigImg.contentMode = UIViewContentModeScaleAspectFill;
        _bigImg.clipsToBounds = true;
    }
    return _bigImg;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] initForAutoLayout];
        _contentLabel.text = @"山峰不会写游记";
        _contentLabel.textColor = UIColorFromRGB(0x909090);
        _contentLabel.font = [UIFont systemFontOfSize:15];
        
    }
    return _contentLabel;
}

- (UIView *)xian {
    if (!_xian) {
        _xian = [[UIView alloc] initForAutoLayout];
        _xian.backgroundColor = UIColorFromRGB(0xe5e5e5);
    }
    return _xian;
}

- (UILabel *)moreLabel {
    if (!_moreLabel) {
        _moreLabel = [[UILabel alloc] initForAutoLayout];
        _moreLabel.text = @"查看更多内容";
        _moreLabel.textColor = UIColorFromRGB(0x333333);
        _moreLabel.font = [UIFont systemFontOfSize:15];
        
    }
    return _moreLabel;
}

- (UIImageView *)img {
    if (!_img) {
        _img = [[UIImageView alloc] initForAutoLayout];
        _img.image = [UIImage imageNamed:@"chevro"];
        _img.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _img;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
