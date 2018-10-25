//
//  MsgDetailsTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/28.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "MsgDetailsTableViewCell.h"

@implementation MsgDetailsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.img];
        [self.contentView addSubview:self.contentlLabel];
        
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_titleLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(20, 20, 20, 20) excludingEdge:ALEdgeBottom];
    [_titleLabel autoSetDimension:ALDimensionHeight toSize:50];
    
    [_img autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_img autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_img autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:0];
    [_img autoSetDimension:ALDimensionHeight toSize:165];
    
    [_contentlLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_img withOffset:5];
    [_contentlLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_contentlLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_contentlLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:20];
    
}




- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.text = @"山峰不会写游记";
        _titleLabel.textColor = UIColorFromRGB(0x333333);
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.numberOfLines = 0;
        
    }
    return _titleLabel;
}



- (UILabel *)contentlLabel {
    if (!_contentlLabel) {
        _contentlLabel = [[UILabel alloc] initForAutoLayout];
        _contentlLabel.text = @"山峰不会写游记";
        _contentlLabel.textColor = UIColorFromRGB(0x909090);
        _contentlLabel.font = [UIFont systemFontOfSize:15];
        _contentlLabel.numberOfLines = 0;
    }
    return _contentlLabel;
}


- (UIImageView *)img {
    if (!_img) {
        _img = [[UIImageView alloc] initForAutoLayout];
        _img.image = [UIImage imageNamed:@"chevro"];
        _img.contentMode = UIViewContentModeScaleAspectFill;
        _img.clipsToBounds = true;
    }
    return _img;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
