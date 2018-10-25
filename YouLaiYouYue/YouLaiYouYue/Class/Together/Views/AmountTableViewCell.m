//
//  AmountTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/13.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "AmountTableViewCell.h"

@implementation AmountTableViewCell

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
    CGContextStrokeRect(context, CGRectMake(0, rect.size.height, rect.size.width-15, 2));
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.addButton];
        [self.contentView addSubview:self.amountLabel];
        [self.contentView addSubview:self.subtractButton];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_titleLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [_titleLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 16*Balance_Width, 0, 0) excludingEdge:ALEdgeRight];
    [_titleLabel autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/2];
    
    [_addButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [_addButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:16*Balance_Width];
    [_addButton autoSetDimension:ALDimensionWidth toSize:25*Balance_Width];
    [_addButton autoSetDimension:ALDimensionHeight toSize:25*Balance_Width];
    
    [_amountLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [_amountLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_addButton withOffset:0*Balance_Width];
    [_amountLabel autoSetDimension:ALDimensionWidth toSize:50*Balance_Width];
    [_amountLabel autoSetDimension:ALDimensionHeight toSize:50*Balance_Width];
    
    [_subtractButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [_subtractButton autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_amountLabel withOffset:0*Balance_Width];
    [_subtractButton autoSetDimension:ALDimensionWidth toSize:25*Balance_Width];
    [_subtractButton autoSetDimension:ALDimensionHeight toSize:25*Balance_Width];
    
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.text = @"报名人数";
        _titleLabel.textColor = UIColorFromRGB(0x3d3d3d);
        _titleLabel.font = [UIFont systemFontOfSize:16];
    }
    return _titleLabel;
}

- (UIButton *)addButton {
    if (!_addButton) {
        _addButton = [[UIButton alloc] initForAutoLayout];
        [_addButton setImage:[UIImage imageNamed:@"+"] forState:UIControlStateNormal];
    }
    return _addButton;
}
- (UILabel *)amountLabel {
    if (!_amountLabel) {
        _amountLabel = [[UILabel alloc] initForAutoLayout];
        _amountLabel.text = @"1";
        _amountLabel.textColor = UIColorFromRGB(0x3d3d3d);
        _amountLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _amountLabel;
}
- (UIButton *)subtractButton {
    if (!_subtractButton) {
        _subtractButton = [[UIButton alloc] initForAutoLayout];
        [_subtractButton setImage:[UIImage imageNamed:@"-"] forState:UIControlStateNormal];
    }
    return _subtractButton;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
