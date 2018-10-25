//
//  InsertTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/31.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "InsertTableViewCell.h"
@interface InsertTableViewCell ()<UITextFieldDelegate>

@end
@implementation InsertTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.textField];
        
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    
    _textField.text = title;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    
    [_textField autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [_textField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_textField autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:5];
    [_textField autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:5];
    [_textField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@".......%@",textField.text);
    if ([self.delegate respondsToSelector:@selector(insertTitleTextView:)]) {
        [self.delegate insertTitleTextView:textField.text];
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
