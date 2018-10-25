//
//  DraftTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/2.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "DraftTableViewCell.h"

@implementation DraftTableViewCell

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
        
        [self.contentView addSubview:self.img];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.timeLabel];
        
        
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_img autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(12, 15, 12, 20) excludingEdge:ALEdgeRight];
    [_img autoSetDimension:ALDimensionWidth toSize:150];
    
    [_titleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_img withOffset:0];
    [_titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img withOffset:10];
    [_titleLabel autoSetDimension:ALDimensionHeight toSize:20];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    
    
    [_timeLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_img withOffset:0];
    [_timeLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img withOffset:10];
    [_timeLabel autoSetDimension:ALDimensionHeight toSize:20];
    [_timeLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    
}

- (void)setModel:(MyRemModel *)model {
    _model = model;
    _titleLabel.text = _model.fmtitle;
    [_img sd_setImageWithURL:[NSURL URLWithString:_model.fmpic] placeholderImage:nil];
    _timeLabel.text = [NSString stringWithFormat:@"发布时间:%@",_model.fmtime];
    
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



- (UIImageView *)img {
    if (!_img) {
        _img = [[UIImageView alloc] initForAutoLayout];
        _img.image = [UIImage imageNamed:@"2"];
        _img.contentMode = UIViewContentModeScaleAspectFill;
        _img.clipsToBounds = true;
    }
    return _img;
}


- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] initForAutoLayout];
        _timeLabel.text = @"发布时间:2018-01-01";
        _timeLabel.font = [UIFont systemFontOfSize:15];
        _timeLabel.textColor = UIColorFromRGB(0x333333);
    }
    return _timeLabel;
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
