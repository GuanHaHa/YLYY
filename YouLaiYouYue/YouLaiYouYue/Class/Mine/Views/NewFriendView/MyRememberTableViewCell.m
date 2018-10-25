//
//  MyRememberTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/31.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "MyRememberTableViewCell.h"

@implementation MyRememberTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
//自定义分割线
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    
    //下分割线
    CGContextSetStrokeColorWithColor(context, UIColorFromRGB(0xf5f5f5).CGColor);
    CGContextStrokeRect(context, CGRectMake(7, rect.size.height, rect.size.width-15, 2));
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.bigImg];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.lookImg];
        [self.contentView addSubview:self.lookLabel];
        [self.contentView addSubview:self.attentionImg];
        [self.contentView addSubview:self.attentionLabel];
        [self.contentView addSubview:self.startTime];
        [self.contentView addSubview:self.endTime];
        [self.contentView addSubview:self.costLabel];
//        [self.contentView addSubview:self.numLabel];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_bigImg autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [_bigImg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_bigImg autoSetDimension:ALDimensionWidth toSize:150];
    [_bigImg autoSetDimension:ALDimensionHeight toSize:100];
    
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:5];
    [_titleLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_bigImg withOffset:-5];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    
    [_lookImg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_lookImg autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_bigImg withOffset:10];
    [_lookImg autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
    [_lookImg autoSetDimension:ALDimensionWidth toSize:20];
    
    [_lookLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_lookImg];
    [_lookLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_lookImg withOffset:5];
    [_lookLabel autoSetDimension:ALDimensionWidth toSize:70];
    [_lookLabel autoSetDimension:ALDimensionHeight toSize:20];
    
    [_attentionImg autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_lookImg];
    [_attentionImg autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_lookLabel withOffset:20];
    [_attentionImg autoSetDimension:ALDimensionWidth toSize:20];
    [_attentionImg autoSetDimension:ALDimensionHeight toSize:20];
    
    [_attentionLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_lookImg];
    [_attentionLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_attentionImg withOffset:5];
    [_attentionLabel autoSetDimension:ALDimensionWidth toSize:70];
    [_attentionLabel autoSetDimension:ALDimensionHeight toSize:20];
    
    [_startTime autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_bigImg withOffset:0];
    [_startTime autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_bigImg withOffset:25];
    [_startTime autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:25];
    [_startTime autoSetDimension:ALDimensionHeight toSize:25];
    
    [_endTime autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_startTime withOffset:0];
    [_endTime autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_bigImg withOffset:25];
    [_endTime autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:25];
    [_endTime autoSetDimension:ALDimensionHeight toSize:25];
    
    [_costLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_endTime withOffset:0];
    [_costLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_bigImg withOffset:25];
    [_costLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:25];
    [_costLabel autoSetDimension:ALDimensionHeight toSize:25];
    
    [_numLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_costLabel withOffset:0];
    [_numLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_bigImg withOffset:25];
    [_numLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:25];
    [_numLabel autoSetDimension:ALDimensionHeight toSize:25];
    
    
}

- (void)setModel:(MyRemModel *)model {
    _model = model;
    _titleLabel.text = _model.fmtitle;
    [_bigImg sd_setImageWithURL:[NSURL URLWithString:_model.fmpic] placeholderImage:nil];
    if ([_model.fmgotime isEqualToString:@""]) {
        _startTime.text = @"开始时间:未设置";
    }else {
        _startTime.text = [NSString stringWithFormat:@"开始时间:%@",_model.fmgotime];
    }
    if ([_model.fmendtime isEqualToString:@""]) {
        _endTime.text = @"结束时间:未设置";
    }else {
        _endTime.text = [NSString stringWithFormat:@"结束时间:%@",_model.fmendtime];
    }
    if ([_model.percapitacost isEqualToString:@"0.00"]) {
        _costLabel.text = @"人均费用:未设置";
    }else {
        _costLabel.text = [NSString stringWithFormat:@"人均费用:%@",_model.percapitacost];
    }
    _lookLabel.text = [NSString stringWithFormat:@"浏览:%@",_model.fmlook];
    _attentionLabel.text = [NSString stringWithFormat:@"关注:%@",_model.fmfavorite];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.text = @"在北京,九个小酒馆和九个旅行故事";
        _titleLabel.font = [UIFont systemFontOfSize:18];
        _titleLabel.textColor = UIColorFromRGB(0x333333);
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
- (UILabel *)startTime {
    if (!_startTime) {
        _startTime = [[UILabel alloc] initForAutoLayout];
        _startTime.text = @"开始时间: 2018-04-04";
        _startTime.textColor = UIColorFromRGB(0x333333);
        _startTime.font = [UIFont systemFontOfSize:15];
        _startTime.textAlignment = NSTextAlignmentLeft;
        
    }
    return _startTime;
}

- (UILabel *)endTime {
    if (!_endTime) {
        _endTime = [[UILabel alloc] initForAutoLayout];
        _endTime.text = @"结束时间: 2018-04-04";
        _endTime.textColor = UIColorFromRGB(0x333333);
        _endTime.font = [UIFont systemFontOfSize:15];
        _endTime.textAlignment = NSTextAlignmentLeft;
        
    }
    return _endTime;
}
- (UILabel *)costLabel {
    if (!_costLabel) {
        _costLabel = [[UILabel alloc] initForAutoLayout];
        _costLabel.text = @"人均费用: 888";
        _costLabel.textColor = UIColorFromRGB(0x333333);
        _costLabel.font = [UIFont systemFontOfSize:15];
        _costLabel.textAlignment = NSTextAlignmentLeft;
        
    }
    return _costLabel;
}
- (UILabel *)numLabel {
    if (!_numLabel) {
        _numLabel = [[UILabel alloc] initForAutoLayout];
        _numLabel.text = @"报名人数: 888";
        _numLabel.textColor = UIColorFromRGB(0x333333);
        _numLabel.font = [UIFont systemFontOfSize:15];
        _numLabel.textAlignment = NSTextAlignmentLeft;
        
    }
    return _numLabel;
}

- (UIImageView *)lookImg {
    if (!_lookImg) {
        _lookImg = [[UIImageView alloc] initForAutoLayout];
        _lookImg.image = [UIImage imageNamed:@"kan"];
        _lookImg.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _lookImg;
}
- (UILabel *)lookLabel {
    if (!_lookLabel) {
        _lookLabel = [[UILabel alloc] initForAutoLayout];
        _lookLabel.text = @"浏览:4355";
        _lookLabel.textColor = UIColorFromRGB(0x333333);
        _lookLabel.font = [UIFont systemFontOfSize:13];
    }
    return _lookLabel;
}

- (UIImageView *)attentionImg {
    if (!_attentionImg) {
        _attentionImg = [[UIImageView alloc] initForAutoLayout];
        _attentionImg.image = [UIImage imageNamed:@"con"];
        _attentionImg.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _attentionImg;
}
- (UILabel *)attentionLabel {
    if (!_attentionLabel) {
        _attentionLabel = [[UILabel alloc] initForAutoLayout];
        _attentionLabel.text = @"关注:4355";
        _attentionLabel.textColor = UIColorFromRGB(0x333333);
        _attentionLabel.font = [UIFont systemFontOfSize:13];
    }
    return _attentionLabel;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
