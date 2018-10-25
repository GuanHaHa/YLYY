//
//  OrderEvaluateTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/21.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "OrderEvaluateTableViewCell.h"

@implementation OrderEvaluateTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    
        [self.contentView addSubview:self.textView];
        
        UILabel *placeHolderLabel = [[UILabel alloc] init];
        placeHolderLabel.text = @"请输入评价内容!!!";
        placeHolderLabel.numberOfLines = 0;
        placeHolderLabel.textColor = [UIColor lightGrayColor];
        [placeHolderLabel sizeToFit];
        [self.textView addSubview:placeHolderLabel];
        
        // same font
        placeHolderLabel.font = [UIFont systemFontOfSize:13.f];
        
        [self.textView setValue:placeHolderLabel forKey:@"_placeholderLabel"];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    
    [_textView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    [_textView autoPinEdgeToSuperviewEdge:ALEdgeLeft  withInset:20];
    [_textView autoPinEdgeToSuperviewEdge:ALEdgeRight  withInset:20];
    [_textView autoPinEdgeToSuperviewEdge:ALEdgeBottom  withInset:20];
    
    
    
    
}

// 结束编辑，键盘就消失
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.contentView endEditing:YES];
}


#pragma mark - UITextViewDelegate
- (void)textViewDidEndEditing:(UITextView *)textView {
    if ([self.delegate respondsToSelector:@selector(orderEvaluateChangeTextView:)]) {
        [self.delegate orderEvaluateChangeTextView:textView.text];
    }
    NSLog(@"%@",textView.text);
}

// 控制输入文字的长度和内容
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (range.location >= 50)
    {
        UIAlertView * alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"输入上限50字" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
        return NO;
    }
    else
    {
        return textView.textInputMode != nil;
    }
}


- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] initForAutoLayout];
        _textView.backgroundColor = UIColorFromRGB(0xf5f5f5);
        _textView.textColor = UIColorFromRGB(0x9f9f9f);
        //        _textView.text = @" 有事您说话,我们一定认真~(就别超过500字)";
        _textView.font = [UIFont systemFontOfSize:16];
        _textView.delegate = self;
        _textView.returnKeyType = UIReturnKeyDefault;//return键的类型
        _textView.layer.cornerRadius  = 6;
        _textView.layer.masksToBounds = YES;
    }
    return _textView;
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
