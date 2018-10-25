//
//  CostView.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/2.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "CostView.h"

@implementation CostView {
    NSString *chooseType;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        [self addSubview:self.view];
        [self.view addSubview:self.deleteBtn];
        [self.view addSubview:self.titleLabel];
        [self.view addSubview:self.btn2];
        [self.view addSubview:self.btn1];
        [self.view addSubview:self.btn3];
        [self.view addSubview:self.describeLabel];
        [self.view addSubview:self.inputLabel];
        [self.view addSubview:self.inputTextField];
        [self.view addSubview:self.instructionsLabel];
        [self.view addSubview:self.instructionsTextField];
        [self.view addSubview:self.determineBtn];
    }
    return self;
}



- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_view autoAlignAxisToSuperviewAxis:(ALAxisVertical)];
    [_view autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:150*Balance_Heith];
    [_view autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH-80*Balance_Width];
    [_view autoSetDimension:ALDimensionHeight toSize:330*Balance_Heith];
    
    [_deleteBtn autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:5];
    [_deleteBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:5];
    [_deleteBtn autoSetDimension:ALDimensionWidth toSize:15];
    [_deleteBtn autoSetDimension:ALDimensionHeight toSize:15];
    
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20*Balance_Heith];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20*Balance_Width];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20*Balance_Width];
    [_titleLabel autoSetDimension:ALDimensionHeight toSize:15*Balance_Heith];
    
    [_btn2 autoAlignAxisToSuperviewAxis:(ALAxisVertical)];
    [_btn2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:10];
    [_btn2 autoSetDimension:ALDimensionWidth toSize:_view.frame.size.width/3 - 20*Balance_Width];
    [_btn2 autoSetDimension:ALDimensionHeight toSize:30*Balance_Heith];
    
    [_btn1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:10];
    [_btn1 autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_btn2 withOffset:-15*Balance_Width];
    [_btn1 autoSetDimension:ALDimensionWidth toSize:_view.frame.size.width/3 - 20*Balance_Width];
    [_btn1 autoSetDimension:ALDimensionHeight toSize:30*Balance_Heith];
    
    [_btn3 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:10];
    [_btn3 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_btn2 withOffset:15*Balance_Width];
    [_btn3 autoSetDimension:ALDimensionWidth toSize:_view.frame.size.width/3 - 20*Balance_Width];
    [_btn3 autoSetDimension:ALDimensionHeight toSize:30*Balance_Heith];
    
    [_describeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20*Balance_Width];
    [_describeLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20*Balance_Width];
    [_describeLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_btn1 withOffset:10*Balance_Heith];
    [_describeLabel autoSetDimension:ALDimensionHeight toSize:13*Balance_Heith];
    
    [_inputLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20*Balance_Width];
    [_inputLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20*Balance_Width];
    [_inputLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_describeLabel withOffset:20*Balance_Heith];
    [_inputLabel autoSetDimension:ALDimensionHeight toSize:15*Balance_Heith];
    
    [_inputTextField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_inputLabel withOffset:12*Balance_Heith];
    [_inputTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20*Balance_Width];
    [_inputTextField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20*Balance_Width];
    [_inputTextField autoSetDimension:ALDimensionHeight toSize:30*Balance_Heith];
    
    [_instructionsLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20*Balance_Width];
    [_instructionsLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20*Balance_Width];
    [_instructionsLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_inputTextField withOffset:20*Balance_Heith];
    [_instructionsLabel autoSetDimension:ALDimensionHeight toSize:15*Balance_Heith];
    
    [_instructionsTextField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_instructionsLabel withOffset:12*Balance_Heith];
    [_instructionsTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20*Balance_Width];
    [_instructionsTextField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20*Balance_Width];
    [_instructionsTextField autoSetDimension:ALDimensionHeight toSize:30*Balance_Heith];
    
    [_determineBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_instructionsTextField withOffset:25*Balance_Heith];
    [_determineBtn autoAlignAxisToSuperviewAxis:(ALAxisVertical)];
    [_determineBtn autoSetDimension:ALDimensionWidth toSize:130*Balance_Width];
    [_determineBtn autoSetDimension:ALDimensionHeight toSize:30*Balance_Heith];
    
}

- (void)deleteAction {
    if ([self.delegate respondsToSelector:@selector(hiddenCost)]) {
        [self.delegate hiddenCost];
    }
}

// 确定
- (void)determineAction {
    
    NSLog(@"%@",_inputTextField.text);
    
    if (chooseType == nil || [chooseType isEqualToString:@""] || [_inputTextField.text isEqualToString:@""] || _inputTextField.text == nil) {
        
        [LCProgressHUD showInfoMsg:@"请补全信息"];
        return;
    }else {
        if ([self.delegate respondsToSelector:@selector(costInformationType:withMoney:withExplain:)]) {
            [self.delegate costInformationType:chooseType withMoney:_inputTextField.text withExplain:_instructionsTextField.text];
        }
    }
}

- (void)button1Action:(UIButton *)button {
    button.selected = !button.selected;
    if (button.selected == YES) {
        chooseType = @"0";
        _btn2.selected = NO;
        _btn3.selected = NO;
        button.layer.borderColor = UIColorFromRGB(0xf71f1f).CGColor;
        _btn2.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        _btn3.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        _describeLabel.text = @"活动费用现场实际收费";
        
    }
}
- (void)button2Action:(UIButton *)button {
    button.selected = !button.selected;
    if (button.selected == YES) {
        chooseType = @"1";
        _btn1.selected = NO;
        _btn3.selected = NO;
        button.layer.borderColor = UIColorFromRGB(0xf71f1f).CGColor;
        _btn1.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        _btn3.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        _describeLabel.text = @"由活动创建者承担费用,用户免费报名参加";
        
    }
}
- (void)button3Action:(UIButton *)button {
    button.selected = !button.selected;
    if (button.selected == YES) {
        chooseType = @"2";
        _btn1.selected = NO;
        _btn2.selected = NO;
        button.layer.borderColor = UIColorFromRGB(0xf71f1f).CGColor;
        _btn1.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        _btn2.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        _describeLabel.text = @"在线直接付款,通过平台结算";
        
    }
    
    
}

- (UIView *)view {
    if (!_view) {
        _view = [[UIView alloc] initForAutoLayout];
        _view.backgroundColor = [UIColor whiteColor];
//        _view.alpha = 1;
    }
    return _view;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.text = @"人均费用";
    }
    return _titleLabel;
}

// 注册按钮
- (UIButton *)btn1 {
    if (!_btn1) {
        _btn1 = [[UIButton alloc] initForAutoLayout];
        [_btn1 setBackgroundColor:UIColorFromRGB(0xffffff)];
        [_btn1 setTitle:@"现场收取" forState:UIControlStateNormal];
        [_btn1 setTitle:@"现场收取" forState:UIControlStateSelected];
        [_btn1 setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [_btn1 setTitleColor:UIColorFromRGB(0xf71f1f) forState:UIControlStateSelected];
        _btn1.layer.borderWidth = 1;
        _btn1.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        _btn1.titleLabel.font = [UIFont systemFontOfSize:14];
        _btn1.layer.cornerRadius = 6;
        [_btn1.layer setMasksToBounds:YES];
        _btn1.tag = 001;
        [_btn1 addTarget:self action:@selector(button1Action:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn1;
}

// 注册按钮
- (UIButton *)btn2 {
    if (!_btn2) {
        _btn2 = [[UIButton alloc] initForAutoLayout];
        [_btn2 setBackgroundColor:UIColorFromRGB(0xffffff)];
        [_btn2 setTitle:@"免费参加" forState:UIControlStateNormal];
        [_btn2 setTitle:@"免费参加" forState:UIControlStateSelected];
        [_btn2 setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [_btn2 setTitleColor:UIColorFromRGB(0xf71f1f) forState:UIControlStateSelected];
        _btn2.layer.borderWidth = 1;
        _btn2.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        _btn2.titleLabel.font = [UIFont systemFontOfSize:14];
        _btn2.layer.cornerRadius = 6;
        [_btn2.layer setMasksToBounds:YES];
        _btn2.tag = 002;
        [_btn2 addTarget:self action:@selector(button2Action:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn2;
}

- (UIButton *)btn3 {
    if (!_btn3) {
        _btn3 = [[UIButton alloc] initForAutoLayout];
        [_btn3 setBackgroundColor:UIColorFromRGB(0xffffff)];
        [_btn3 setTitle:@"线上交易" forState:UIControlStateNormal];
        [_btn3 setTitle:@"线上交易" forState:UIControlStateSelected];
        [_btn3 setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [_btn3 setTitleColor:UIColorFromRGB(0xf71f1f) forState:UIControlStateSelected];
        _btn3.layer.borderWidth = 1;
        _btn3.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        _btn3.titleLabel.font = [UIFont systemFontOfSize:14];
        _btn3.layer.cornerRadius = 6;
        [_btn3.layer setMasksToBounds:YES];
        _btn3.tag = 003;
        [_btn3 addTarget:self action:@selector(button3Action:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn3;
}
- (UILabel *)describeLabel {
    if (!_describeLabel) {
        _describeLabel = [[UILabel alloc] initForAutoLayout];
        _describeLabel.font = [UIFont systemFontOfSize:13];
//        _describeLabel.text = @"发大水荆防颗粒的撒荆防颗粒的撒娇";
    }
    return _describeLabel;
}

- (UILabel *)inputLabel {
    if (!_inputLabel) {
        _inputLabel = [[UILabel alloc] initForAutoLayout];
        _inputLabel.font = [UIFont systemFontOfSize:16];;
        _inputLabel.text = @"输入金额";
    }
    return _inputLabel;
}

- (UITextField *)inputTextField {
    if (!_inputTextField) {
        _inputTextField = [[UITextField alloc] initForAutoLayout];
        _inputTextField.placeholder = @"00.00";
//        _inputTextField.enabled = NO;
        _inputTextField.textColor = UIColorFromRGB(0x333333);
        _inputTextField.font = [UIFont systemFontOfSize:15];
        _inputTextField.textAlignment = NSTextAlignmentLeft;
        _inputTextField.layer.borderWidth = 1;
        _inputTextField.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        _inputTextField.layer.cornerRadius = 6;
        [_inputTextField.layer setMasksToBounds:YES];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 5)];
        _inputTextField.leftView = view;
        _inputTextField.leftViewMode = UITextFieldViewModeAlways;
        _inputTextField.keyboardType = UIKeyboardTypeDefault;
    }
    return _inputTextField;
}

- (UILabel *)instructionsLabel {
    if (!_instructionsLabel) {
        _instructionsLabel = [[UILabel alloc] initForAutoLayout];
        _instructionsLabel.font = [UIFont systemFontOfSize:16];
//        _instructionsLabel.font = [UIFont boldSystemFontOfSize:16];
        _instructionsLabel.text = @"费用说明";
    }
    return _instructionsLabel;
}

- (UITextField *)instructionsTextField {
    if (!_instructionsTextField) {
        _instructionsTextField = [[UITextField alloc] initForAutoLayout];
        _instructionsTextField.placeholder = @"请输入说明";
        //        _inputTextField.enabled = NO;
        _instructionsTextField.textColor = UIColorFromRGB(0x333333);
        _instructionsTextField.font = [UIFont systemFontOfSize:15];
        _instructionsTextField.textAlignment = NSTextAlignmentLeft;
        _instructionsTextField.layer.borderWidth = 1;
        _instructionsTextField.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        _instructionsTextField.layer.cornerRadius = 6;
        [_instructionsTextField.layer setMasksToBounds:YES];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 5)];
        _instructionsTextField.leftView = view;
        _instructionsTextField.leftViewMode = UITextFieldViewModeAlways;
    }
    return _instructionsTextField;
}

- (UIButton *)determineBtn {
    if (!_determineBtn) {
        _determineBtn = [[UIButton alloc] initForAutoLayout];
        [_determineBtn setBackgroundColor:UIColorFromRGB(0xff9d00)];
        [_determineBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_determineBtn setTitle:@"确定" forState:UIControlStateSelected];
        [_determineBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _determineBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _determineBtn.layer.cornerRadius = 6;
        [_determineBtn.layer setMasksToBounds:YES];
        _determineBtn.tag = 524;
        [_determineBtn addTarget:self action:@selector(determineAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _determineBtn;
}

- (UIButton *)deleteBtn {
    if (!_deleteBtn) {
        _deleteBtn = [[UIButton alloc] initForAutoLayout];
        [_deleteBtn setBackgroundColor:UIColorFromRGB(0xffffff)];
        [_deleteBtn setImage:[UIImage imageNamed:@"closs_pay"] forState:UIControlStateNormal];
//        [_deleteBtn setTitle:@"确定" forState:UIControlStateNormal];
//        [_deleteBtn setTitle:@"确定" forState:UIControlStateSelected];
//        [_deleteBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _deleteBtn.titleLabel.font = [UIFont systemFontOfSize:14];
//        _deleteBtn.layer.cornerRadius = 6;
//        [_deleteBtn.layer setMasksToBounds:YES];
        _deleteBtn.tag = 524;
        [_deleteBtn addTarget:self action:@selector(deleteAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteBtn;
}


@end
