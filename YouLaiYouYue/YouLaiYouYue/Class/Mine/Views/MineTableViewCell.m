//
//  MineTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/24.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "MineTableViewCell.h"

@implementation MineTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.img];
        [self.contentView addSubview:self.titleLabel];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_img autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [_img autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_img autoSetDimension:ALDimensionHeight toSize:20];
    [_img autoSetDimension:ALDimensionWidth toSize:20];
    
    [_titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img withOffset:10];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    [_titleLabel autoSetDimension:ALDimensionWidth toSize:200];
    
}

- (UIImageView *)img {
    if (!_img) {
        _img = [[UIImageView alloc] initForAutoLayout];
        _img.contentMode = UIViewContentModeScaleAspectFit;
        _img.userInteractionEnabled = YES;
    }
    return _img;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.textColor = UIColorFromRGB(0x333333);
    }
    return _titleLabel;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
