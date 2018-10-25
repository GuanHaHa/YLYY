//
//  EditOtherTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/9/5.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "EditOtherTableViewCell.h"

@interface EditOtherTableViewCell ()<UITextFieldDelegate>

@end

@implementation EditOtherTableViewCell

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
        [self.contentView addSubview:self.img];
    }
    return self;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@".......%@",textField.text);
    if ([self.delegate respondsToSelector:@selector(cityTextView:)]) {
        [self.delegate cityTextView:textField.text];
    }
}

- (void)setIndexSection:(NSInteger)indexSection {
    _indexSection = indexSection;
    if (_indexSection == 5) {
        _textField.enabled = YES;
    }
    
    
}

- (void)setModel:(NewModel *)model {
    _model = model;
    if (self.indexSection == 2) {
        self.textField.text = _model.tag;
    }
    if (self.indexSection == 3) {
        self.textField.text = _model.startTime;
    }
    if (self.indexSection == 4) {
        self.textField.text = _model.endTime;
    }
    if (self.indexSection == 5) {
        self.textField.text = _model.site;
    }
    if (self.indexSection == 6) {
        self.textField.text = _model.cost;
    }
    if (self.indexSection == 7) {
        self.textField.text = _model.activityTitle;
    }
    if (self.indexSection == 8) {
        self.textField.text = _model.password;
    }
    if (self.indexSection == 9) {
        if ([model.insertatext isEqualToString:@"0"]) {
            self.textField.text = @"是";
        }else {
            self.textField.text = @"否";
        }
    }
}


- (void)layoutSubviews {
    [super layoutSubviews];
    [_textField autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(1, 1, 1, 10) excludingEdge:ALEdgeLeft];
    [_textField autoSetDimension:ALDimensionWidth toSize:200];
    
    [_img autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [_img autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_img autoSetDimension:ALDimensionHeight toSize:25];
    [_img autoSetDimension:ALDimensionWidth toSize:25];
    
    [_titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img withOffset:10];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    [_titleLabel autoSetDimension:ALDimensionWidth toSize:150];
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] initForAutoLayout];
        _textField.delegate = self;
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
