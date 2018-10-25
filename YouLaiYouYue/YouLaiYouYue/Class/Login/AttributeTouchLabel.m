//
//  AttributeTouchLabel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/10/17.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "AttributeTouchLabel.h"

@interface AttributeTouchLabel ()<UITextViewDelegate>

@end

@implementation AttributeTouchLabel



- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] initForAutoLayout];
        _textView.delegate = self;
        _textView.editable = NO;//必须禁止输入，否则点击将会弹出输入键盘
        _textView.scrollEnabled = NO;//可选的，视具体情况而定
        _textView.textColor = [UIColor blackColor];
    }
    return _textView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_textView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
}

- (instancetype)init {
    if (self = [super init]) {

        [self addSubview:self.textView];
    }
    return self;
}

- (void)setContent:(NSString *)content {
    
    _content = content;
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc]initWithString:content];
    
    [attStr addAttribute:NSLinkAttributeName value:@"click://" range:NSMakeRange(8, 9)];
    [attStr addAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14]} range:NSMakeRange(0, 8)];
    [attStr addAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18]} range:NSMakeRange(8, 9)];

    _textView.linkTextAttributes = @{NSForegroundColorAttributeName:[UIColor orangeColor]};
    _textView.attributedText = attStr;
    
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange{
    
    if ([[URL scheme] isEqualToString:@"click"]) {
        NSAttributedString *abStr = [textView.attributedText attributedSubstringFromRange:characterRange];
        if (self.eventBlock) {
            self.eventBlock(abStr);
        }
        
        return NO;
    }
    
    
    return YES;
}



@end
