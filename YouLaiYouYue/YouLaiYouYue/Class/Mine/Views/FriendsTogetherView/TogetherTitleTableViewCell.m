//
//  TogetherTitleTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/2.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "TogetherTitleTableViewCell.h"
@interface TogetherTitleTableViewCell ()<UITextFieldDelegate>

@end
@implementation TogetherTitleTableViewCell

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
        [self.contentView addSubview:self.img];
        [self.contentView addSubview:self.textField];
    }
    return self;
}

- (void)setModel:(TogetherModel *)model {
    _model = model;
    
    self.textField.text = _model.title;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@".......%@",textField.text);
    if ([self.delegate respondsToSelector:@selector(togetherTitleTextView:)]) {
        [self.delegate togetherTitleTextView:textField.text];
    }
    
}

- (void)textFieldDidChange:(id)sender
{
    if (self.textField.text.length > 30)  // MAXLENGTH为最大字数
    {
        self.textField.text = [self.textField.text substringToIndex: 30];
        //超出限制字数时所要做的事
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_img autoAlignAxisToSuperviewAxis:(ALAxisHorizontal)];
    [_img autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_img autoSetDimension:ALDimensionWidth toSize:10];
    [_img autoSetDimension:ALDimensionHeight toSize:10];
    
    [_textField autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [_textField autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img withOffset:10];
    [_textField autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:5];
    [_textField autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:5];
    [_textField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    
}


- (UIImageView *)img {
    if (!_img) {
        _img = [[UIImageView alloc] initForAutoLayout];
        _img.image = [UIImage imageNamed:@"con"];
        _img.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _img;
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] initForAutoLayout];
        _textField.placeholder = @"请输入活动标题不超过30字";
        _textField.enabled = YES;
        _textField.delegate = self;
        _textField.textColor = UIColorFromRGB(0x333333);
        _textField.font = [UIFont systemFontOfSize:15];
        _textField.textAlignment = NSTextAlignmentLeft;
        [_textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return _textField;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
