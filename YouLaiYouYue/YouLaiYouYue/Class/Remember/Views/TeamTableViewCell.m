//
//  TeamTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/9/4.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "TeamTableViewCell.h"

@implementation TeamTableViewCell

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
    CGContextStrokeRect(context, CGRectMake(0, rect.size.height, rect.size.width-15, 5));
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.textField];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_textField autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(1, 1, 1, 10) excludingEdge:ALEdgeLeft];
    [_textField autoSetDimension:ALDimensionWidth toSize:100];
    
    
    
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    [_titleLabel autoSetDimension:ALDimensionWidth toSize:150];
}

- (void)setStr:(NSString *)str {
    _str = str;
    
    _textField.text = _str;
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] initForAutoLayout];
        _textField.placeholder = @"";
        _textField.enabled = NO;
        _textField.textColor = UIColorFromRGB(0x333333);
        _textField.font = [UIFont systemFontOfSize:13];
        _textField.textAlignment = NSTextAlignmentRight;
    }
    return _textField;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.font = [UIFont boldSystemFontOfSize:14];
        _titleLabel.text = @"插文位置";
    }
    return _titleLabel;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
