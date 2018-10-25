//
//  AskForTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/30.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "AskForTableViewCell.h"

@implementation AskForTableViewCell

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
        
        [self.contentView addSubview:self.startTime];
        [self.contentView addSubview:self.numLabel];
//        [self.contentView addSubview:self.endTime];
        [self.contentView addSubview:self.costLabel];
        
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_bigImg autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [_bigImg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_bigImg autoSetDimension:ALDimensionWidth toSize:120];
    [_bigImg autoSetDimension:ALDimensionHeight toSize:90];
    
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:5];
    [_titleLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_bigImg withOffset:-5];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    
    
    
    [_startTime autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_bigImg withOffset:0];
    [_startTime autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_bigImg withOffset:10];
    [_startTime autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_startTime autoSetDimension:ALDimensionHeight toSize:25];
    
//    [_endTime autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_startTime withOffset:0];
//    [_endTime autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_bigImg withOffset:10];
//    [_endTime autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
//    [_endTime autoSetDimension:ALDimensionHeight toSize:25];
    
    
    
    [_numLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_bigImg withOffset:0];
    [_numLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_bigImg withOffset:10];
    [_numLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_numLabel autoSetDimension:ALDimensionHeight toSize:25];
    
    [_costLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_numLabel withOffset:-5];
    [_costLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_bigImg withOffset:10];
    [_costLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_costLabel autoSetDimension:ALDimensionHeight toSize:25];
    
    
}

- (void)setModel:(ActivityModel *)model {
    _model = model;
    [_bigImg sd_setImageWithURL:[NSURL URLWithString:_model.show_pic] placeholderImage:nil];
    _startTime.text = _model.title;
    _costLabel.text = [NSString stringWithFormat:@"出发时间:%@",_model.begin_time];
    _numLabel.text = [NSString stringWithFormat:@"活动地点:%@",_model.city];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.text = @"活动要求";
        _titleLabel.font = [UIFont systemFontOfSize:15];
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
        _startTime.font = [UIFont systemFontOfSize:14];
        _startTime.textAlignment = NSTextAlignmentLeft;
        
    }
    return _startTime;
}

- (UILabel *)endTime {
    if (!_endTime) {
        _endTime = [[UILabel alloc] initForAutoLayout];
        _endTime.text = @"结束时间: 2018-04-04";
        _endTime.textColor = UIColorFromRGB(0x333333);
        _endTime.font = [UIFont systemFontOfSize:14];
        _endTime.textAlignment = NSTextAlignmentLeft;
        
    }
    return _endTime;
}
- (UILabel *)costLabel {
    if (!_costLabel) {
        _costLabel = [[UILabel alloc] initForAutoLayout];
        _costLabel.text = @"人均费用: 888";
        _costLabel.textColor = UIColorFromRGB(0x333333);
        _costLabel.font = [UIFont systemFontOfSize:14];
        _costLabel.textAlignment = NSTextAlignmentLeft;
        
    }
    return _costLabel;
}
- (UILabel *)numLabel {
    if (!_numLabel) {
        _numLabel = [[UILabel alloc] initForAutoLayout];
        _numLabel.text = @"报名人数: 888";
        _numLabel.textColor = UIColorFromRGB(0x333333);
        _numLabel.font = [UIFont systemFontOfSize:14];
        _numLabel.textAlignment = NSTextAlignmentLeft;
        
    }
    return _numLabel;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
