//
//  SignUpTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/13.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "SignUpTableViewCell.h"
@interface SignUpTableViewCell ()<UITextFieldDelegate>


@end


@implementation SignUpTableViewCell

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
    CGContextStrokeRect(context, CGRectMake(0, rect.size.height, rect.size.width-15, 30));
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
//        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.textField];
    }
    return self;
}

- (void)setIndex:(NSIndexPath *)index {
    _index = index;
    if (_index.section == 0 && _index.row == 1) {
        self.textField.enabled = YES;
    }
}



- (void)setModel:(ActivityModel *)model {
    _model = model;
    
    if (self.index.section == 0) {
        if (self.index.row == 0) {
            self.textField.text = _model.truename;
        }
        if (self.index.row == 1) {
            self.textField.text = _model.user_tel;
        }
    }
    if (self.index.section == 1) {
        if (self.index.row == 1) {
            self.textField.text = _model.peoplesex;
        }
        if (self.index.row == 2) {
            self.textField.text = [NSString stringWithFormat:@"%@岁",_model.age];
        }
        if (self.index.row == 3) {
            if ([_model.marry isEqualToString:@"0"]) {
                self.textField.text = @"否";
            }else {
                self.textField.text = @"是";
            }
        }
        if (self.index.row == 4) {
            if ([_model.noname isEqualToString:@"0"]) {
                self.textField.text = @"否";
            }else {
                self.textField.text = @"是";
            }
        }
    }
    if (self.index.section == 2) {
        if ([self.model.peoplesex isEqualToString:@"无限制"]) {
            if ([self.type isEqualToString:@"1"]) {
                if (self.index.row == 0) {
                    self.textField.text = [NSString stringWithFormat:@"%@/人",_model.price];
                }
                if (self.index.row == 1) {
                    if ([_model.if_pay isEqualToString:@"0"]) {
                        self.textField.text = @"现场支付";
                    }
                    if ([_model.if_pay isEqualToString:@"1"]) {
                        self.textField.text = @"他人请客";
                    }
                }
            }else {
                if (self.index.row == 0) {
                    self.textField.text = [NSString stringWithFormat:@"%@/人",_model.price];
                }
                if (self.index.row == 2) {
                    if ([_model.if_pay isEqualToString:@"0"]) {
                        self.textField.text = @"现场支付";
                    }
                    if ([_model.if_pay isEqualToString:@"1"]) {
                        self.textField.text = @"他人请客";
                    }
                }
            }
            
        }else {
            if (self.index.row == 0) {
                self.textField.text = [NSString stringWithFormat:@"%@/人",_model.price];
            }
            if (self.index.row == 1) {
                if ([_model.if_pay isEqualToString:@"0"]) {
                    self.textField.text = @"现场支付";
                }
                if ([_model.if_pay isEqualToString:@"1"]) {
                    self.textField.text = @"他人请客";
                }
            }
        }
    }
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    [_titleLabel autoSetDimension:ALDimensionWidth toSize:100];
    
    [_textField autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(1, 1, 1, 20) excludingEdge:ALEdgeLeft];
    [_textField autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_titleLabel withOffset:10];
    
}


- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    //获取当前文本输入框中所输入的文字
    
    NSLog(@"所输入的内容为:%@",textField.text);
    
    if ([self.delegate respondsToSelector:@selector(changeTextView:)]) {
        [self.delegate changeTextView:textField.text];
    }
    
}


- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] initForAutoLayout];
        _textField.placeholder = @"";
        _textField.enabled = NO;
        _textField.textColor = UIColorFromRGB(0x333333);
        _textField.font = [UIFont systemFontOfSize:15];
        _textField.textAlignment = NSTextAlignmentRight;
        _textField.delegate = self;
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        //设置键盘的样式
        _textField.keyboardType = UIKeyboardTypePhonePad;
    }
    return _textField;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.font = [UIFont boldSystemFontOfSize:15];
        _titleLabel.textColor = UIColorFromRGB(0x333333);
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
