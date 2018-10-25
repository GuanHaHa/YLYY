//
//  RealTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/14.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "RealTableViewCell.h"

@implementation RealTableViewCell

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
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.textField];
        [self.contentView addSubview:self.xian];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_titleLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 35*Balance_Width, 0, 0) excludingEdge:ALEdgeRight];
    [_titleLabel autoSetDimension:ALDimensionWidth toSize:70];
    
    [_textField autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_titleLabel withOffset:10];
    [_textField autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [_textField autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:2];
    [_textField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:35*Balance_Width];
    
    [_xian autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:_textField withOffset:0];
    [_xian autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:_textField withOffset:0];
    [_xian autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:1];
    [_xian autoSetDimension:ALDimensionHeight toSize:1];
}

- (void)setIndex:(NSInteger )index {
    
    _textField.tag = index;
    if (index == 0) {
        _titleLabel.text = @"姓名:";
        _textField.tag = index;
    }else if (index == 1){
        _titleLabel.text = @"身份证号:";
    }else {
        _titleLabel.text = @"签证机关:";
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    //获取当前文本输入框中所输入的文字
    
    NSLog(@"所输入的内容为:%@",textField.text);
    if ([self.delegate respondsToSelector:@selector(changeTextView:withIndex:)]) {
        [self.delegate changeTextView:textField withIndex:self.index];
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];    //主要是[receiver resignFirstResponder]在哪调用就能把receiver对应的键盘往下收
    return YES;
}

- (UIView *)xian {
    if (!_xian) {
        _xian = [[UIView alloc] initForAutoLayout];
        _xian.backgroundColor = UIColorFromRGB(0xf2f2f2);
    }
    return _xian;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.textColor = UIColorFromRGB(0x333333);
        _titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _titleLabel;
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] initForAutoLayout];
        _textField.delegate = self;
        _textField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tel"]];;
        _textField.leftViewMode = UITextFieldViewModeAlways;
        //设置输入框内容的字体样式和大小
        _textField.font = [UIFont systemFontOfSize:15];
        //设置字体颜色
        //        _telNumTextField.textColor = [UIColor redColor];
        //输入框中是否有个叉号，在什么时候显示，用于一次性删除输入框中的内容
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        //再次编辑就清空
        //        _telNumTextField.clearsOnBeginEditing = YES;
        //设置键盘的样式
        //        _textField.keyboardType = UIKeyboardTypePhonePad;
//        _textField.placeholder = @"输入您的手机号码~";
        //        _telNumTextField.text = @"18346038613";
        _textField.returnKeyType =UIReturnKeyDefault;
    }
    return _textField;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
