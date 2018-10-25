//
//  MessageTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/28.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "MessageTableViewCell.h"

@implementation MessageTableViewCell

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
        [self.contentView addSubview:self.timeLable];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.contentLabel];
        [self.contentView addSubview:self.redImg];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_img autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 10, 10, 5) excludingEdge:ALEdgeRight];
    [_img autoSetDimension:ALDimensionWidth toSize:70];
    
    
    [_timeLable autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_img withOffset:0];
    [_timeLable autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:15];
    [_timeLable autoSetDimension:ALDimensionWidth toSize:80];
    [_timeLable autoSetDimension:ALDimensionHeight toSize:35];
    
    
    [_titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img withOffset:15];
    [_titleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_img];
    [_titleLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_timeLable withOffset:-10];
    [_titleLabel autoSetDimension:ALDimensionHeight toSize:35];
    
    [_contentLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_img withOffset:0];
    [_contentLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img withOffset:15];
    [_contentLabel autoSetDimension:ALDimensionHeight toSize:35];
    [_contentLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_timeLable withOffset:-5];
    
    [_redImg autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_contentLabel];
    [_redImg autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:15];
    [_redImg autoSetDimension:ALDimensionWidth toSize:10];
    [_redImg autoSetDimension:ALDimensionHeight toSize:10];
    _redImg.layer.cornerRadius = 10/2;
    _redImg.clipsToBounds = YES;
}

//- (void)setIndex:(NSInteger)index {
//    _index = index;
//}

- (void)setDic:(NSDictionary *)dic {
    _dic = dic;
    if (self.index == 0) {
        _contentLabel.text = _dic[@"hot"][@"message"];
        _timeLable.text = _dic[@"hot"][@"time"];
        if ([_dic[@"hot"][@"type"] isEqualToString:@"0"]) {
            _redImg.hidden = YES;
        }else {
            _redImg.hidden = NO;
        }
    }
    if (self.index == 1) {
        _contentLabel.text = _dic[@"system"][@"message"];
        _timeLable.text = _dic[@"system"][@"time"];
        if ([_dic[@"system"][@"type"] isEqualToString:@"0"]) {
            _redImg.hidden = YES;
        }else {
            _redImg.hidden = NO;
        }
    }
    if (self.index == 2) {
        _contentLabel.text = _dic[@"yq"][@"message"];
        _timeLable.text = _dic[@"yq"][@"time"];
        if ([_dic[@"yq"][@"type"] isEqualToString:@"0"]) {
            _redImg.hidden = YES;
        }else {
            _redImg.hidden = NO;
        }
    }
    if (self.index == 3) {
        _contentLabel.text = _dic[@"comment"][@"message"];
        _timeLable.text = _dic[@"comment"][@"time"];
        if ([_dic[@"comment"][@"type"] isEqualToString:@"0"]) {
            _redImg.hidden = YES;
        }else {
            _redImg.hidden = NO;
        }
    }
    if (self.index == 4) {
        _contentLabel.text = _dic[@"friends"][@"message"];
        _timeLable.text = _dic[@"friends"][@"time"];
        if ([_dic[@"friends"][@"type"] isEqualToString:@"0"]) {
            _redImg.hidden = YES;
        }else {
            _redImg.hidden = NO;
        }
    }
}



- (UIImageView *)img {
    if (!_img) {
        _img = [[UIImageView alloc] initForAutoLayout];
        _img.image = [UIImage imageNamed:@"2"];
    }
    return _img;
}

- (UIImageView *)redImg {
    if (!_redImg) {
        _redImg = [[UIImageView alloc] initForAutoLayout];
//        _redImg.image = [UIImage imageNamed:@"2"];
        _redImg.backgroundColor = [UIColor redColor];
        _redImg.hidden = YES;
    }
    return _redImg;
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

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] initForAutoLayout];
        _contentLabel.text = @"山峰不会写游记";
        _contentLabel.textColor = UIColorFromRGB(0x909090);
        _contentLabel.font = [UIFont systemFontOfSize:13];
    }
    return _contentLabel;
}

- (UILabel *)timeLable {
    if (!_timeLable) {
        _timeLable = [[UILabel alloc] initForAutoLayout];
        _timeLable.text = @"2018-03-09";
        _timeLable.textColor = UIColorFromRGB(0x909090);
        _timeLable.font = [UIFont systemFontOfSize:13];
        _timeLable.textAlignment = NSTextAlignmentRight;
    }
    return _timeLable;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
