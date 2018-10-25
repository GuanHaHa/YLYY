//
//  InformationTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/9/4.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "InformationTableViewCell.h"

@implementation InformationTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.img];
        [self.contentView addSubview:self.infoLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_img autoAlignAxisToSuperviewAxis:(ALAxisHorizontal)];
    [_img autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:15];
    [_img autoSetDimension:ALDimensionWidth toSize:24];
    [_img autoSetDimension:ALDimensionHeight toSize:24];
    
    [_infoLabel autoAlignAxisToSuperviewAxis:(ALAxisHorizontal)];
    [_infoLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img withOffset:3];
    [_infoLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:15];
    [_infoLabel autoSetDimension:ALDimensionHeight toSize:24];
}

- (void)setDic:(NSDictionary *)dic {
    _dic = dic;
    _img.image = [UIImage imageNamed:_dic[@"img"]];
    _infoLabel.text = _dic[@"text"];
}

- (UIImageView *)img {
    if (!_img) {
        _img = [[UIImageView alloc] initForAutoLayout];
        _img.image = [UIImage imageNamed:@"other"];
        _img.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _img;
}

- (UILabel *)infoLabel {
    if (!_infoLabel) {
        _infoLabel = [[UILabel alloc] initForAutoLayout];
        _infoLabel.text = @"出行信息";
        _infoLabel.font = [UIFont systemFontOfSize:12];
    }
    return _infoLabel;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
