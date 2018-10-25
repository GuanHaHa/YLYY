//
//  EditTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/25.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "EditTableViewCell.h"

@implementation EditTableViewCell

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
//        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.textField];
        [self.contentView addSubview:self.img];
    }
    return self;
}

- (void)setModel:(PersonModel *)model {
    _model = model;
    if (self.indexSection == 1) {
        self.textField.text = _model.username;
    }
    if (self.indexSection == 2) {
        self.textField.text = _model.userautograph;
    }
    if (self.indexSection == 3) {
        if ([_model.sex isEqualToString:@"0"]) {
            self.textField.text = @"男";
        }else {
            self.textField.text = @"女";
        }
    }
    if (self.indexSection == 4) {
        self.textField.text = _model.userbirthday;
    }
    if (self.indexSection == 5) {
        self.textField.text = _model.usercodeok;
    }
    if (self.indexSection == 6) {
        self.textField.text = _model.useraddress;
    }
    if (self.indexSection == 7) {
        if ([_model.usermarry isEqualToString:@"2"]) {
            self.textField.text = @"否";
        }else {
            self.textField.text = @"是";
        }
    }
    if (self.indexSection == 8) {
        self.textField.text = [NSString stringWithFormat:@"LV%@",_model.usergrade];
    }
    if (self.indexSection == 9) {
        self.textField.text = _model.usertime;
    }
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    [_textField autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(1, 1, 1, 10) excludingEdge:ALEdgeLeft];
    [_textField autoSetDimension:ALDimensionWidth toSize:180];
    
    [_img autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [_img autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_img autoSetDimension:ALDimensionHeight toSize:25];
    [_img autoSetDimension:ALDimensionWidth toSize:25];
    
    [_titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img withOffset:10];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    [_titleLabel autoSetDimension:ALDimensionWidth toSize:100];
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] initForAutoLayout];
        _textField.placeholder = @"";
        _textField.enabled = NO;
        _textField.textColor = UIColorFromRGB(0x333333);
        _textField.font = [UIFont systemFontOfSize:15];
        _textField.textAlignment = NSTextAlignmentRight;
    }
    return _textField;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.font = [UIFont boldSystemFontOfSize:16];
    }
    return _titleLabel;
}

- (UIImageView *)img {
    if (!_img) {
        _img = [[UIImageView alloc] initForAutoLayout];
        _img.contentMode = UIViewContentModeScaleAspectFit;
        _img.userInteractionEnabled = YES;
    }
    return _img;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
