//
//  CorrelationTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/9/7.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "CorrelationTableViewCell.h"

@implementation CorrelationTableViewCell

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
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.contentLabel];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_bigImg autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [_bigImg autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_bigImg autoSetDimension:ALDimensionWidth toSize:150];
    [_bigImg autoSetDimension:ALDimensionHeight toSize:100];
    
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:5];
    [_titleLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_bigImg withOffset:-5];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    
    [_lookImg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_lookImg autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_bigImg withOffset:0];
    [_lookImg autoSetDimension:ALDimensionHeight toSize:20];
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
    
    [_timeLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_lookImg withOffset:-5];
    [_timeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_timeLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_bigImg withOffset:-5];
    [_timeLabel autoSetDimension:ALDimensionHeight toSize:15];
    
    [_contentLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_bigImg withOffset:0];
    [_contentLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_contentLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_bigImg withOffset:-5];
    [_contentLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_timeLabel withOffset:-5];

    
}

- (void)setModel:(ActivityInfoModel *)model {
    _model = model;
    _titleLabel.text = _model.pftitle;
    _contentLabel.text = _model.pfcontent;
    _timeLabel.text = _model.pftime;
    _lookLabel.text = _model.pflook;
    _attentionLabel.text = _model.pfcomment;
    [_bigImg sd_setImageWithURL:[NSURL URLWithString:_model.pfpic] placeholderImage:nil];
    
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.text = @"在北京,九个小酒馆和九个旅行故事";
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = UIColorFromRGB(0x333333);
    }
    return _titleLabel;
}

- (UIImageView *)bigImg {
    if (!_bigImg) {
        _bigImg = [[UIImageView alloc] initForAutoLayout];
        _bigImg.image = [UIImage imageNamed:@"2"];
    }
    return _bigImg;
}

- (UIImageView *)lookImg {
    if (!_lookImg) {
        _lookImg = [[UIImageView alloc] initForAutoLayout];
        _lookImg.image = [UIImage imageNamed:@"lookBtn"];
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

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] initForAutoLayout];
        _timeLabel.text = @"2018-05-09";
        _timeLabel.textColor = UIColorFromRGB(0x333333);
        _timeLabel.font = [UIFont systemFontOfSize:13];
        _timeLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _timeLabel;
}

- (UIImageView *)attentionImg {
    if (!_attentionImg) {
        _attentionImg = [[UIImageView alloc] initForAutoLayout];
        _attentionImg.image = [UIImage imageNamed:@"mesg"];
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

- (BaseLabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[BaseLabel alloc] initForAutoLayout];
        _contentLabel.text = @"是开放老电视剧按老规矩拉进来的结果来看飞机过来看房的结果拉就拉上解放路看电视剧了咖啡教室里的会计法拉的屎分开了设计费拉数据量放假了可根据拉丝机骨干教师老地方讲师端拉法基放大镜积分大家疯狂的萨芬;来得快三方里付款;杀了开发;了的撒";
        _contentLabel.textColor = UIColorFromRGB(0x636363);
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont systemFontOfSize:15];
        [_contentLabel setVerticalAlignment:VerticalAlignmentTop];
        
    }
    return _contentLabel;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
