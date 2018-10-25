//
//  RequireView.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/3.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "RequireView.h"

@implementation RequireView {
    NSString *sexType;
    NSString *marryType;
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
        [self.view addSubview:self.ageLabel];
        [self.view addSubview:self.ageTextField1];
        [self.view addSubview:self.label];
        [self.view addSubview:self.ageTextField2];
        [self.view addSubview:self.sexLabel];
        [self.view addSubview:self.sexBtn1];
        [self.view addSubview:self.sexBtn2];
        [self.view addSubview:self.sexBtn3];
        [self.view addSubview:self.sexBtn4];
        [self.view addSubview:self.marryLabel];
        [self.view addSubview:self.marryBtn1];
        [self.view addSubview:self.marryBtn2];
        [self.view addSubview:self.otherLabel];
        [self.view addSubview:self.otherTextField];
        [self.view addSubview:self.determineBtn];
    }
    return self;
}



- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_view autoAlignAxisToSuperviewAxis:(ALAxisVertical)];
    [_view autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:100*Balance_Heith];
    [_view autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH-80*Balance_Width];
    [_view autoSetDimension:ALDimensionHeight toSize:310*Balance_Heith];
    
    [_deleteBtn autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:5];
    [_deleteBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:5];
    [_deleteBtn autoSetDimension:ALDimensionWidth toSize:15];
    [_deleteBtn autoSetDimension:ALDimensionHeight toSize:15];
    
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20*Balance_Heith];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20*Balance_Width];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20*Balance_Width];
    [_titleLabel autoSetDimension:ALDimensionHeight toSize:15*Balance_Heith];
    
    [_ageLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:15*Balance_Heith];
    [_ageLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20*Balance_Width];
    [_ageLabel autoSetDimension:ALDimensionWidth toSize:35*Balance_Heith];
    [_ageLabel autoSetDimension:ALDimensionHeight toSize:15*Balance_Heith];
    
    [_ageTextField1 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_ageLabel];
    [_ageTextField1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_ageLabel withOffset:10*Balance_Width];
    [_ageTextField1 autoSetDimension:ALDimensionHeight toSize:25*Balance_Heith];
    [_ageTextField1 autoSetDimension:ALDimensionWidth toSize:60*Balance_Width];
    
    [_label autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_ageTextField1];
    [_label autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_ageTextField1 withOffset:5*Balance_Width];
    [_label autoSetDimension:ALDimensionHeight toSize:25*Balance_Heith];
    [_label autoSetDimension:ALDimensionWidth toSize:20*Balance_Width];
    
    [_ageTextField2 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_ageLabel];
    [_ageTextField2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_label withOffset:5*Balance_Width];
    [_ageTextField2 autoSetDimension:ALDimensionHeight toSize:25*Balance_Heith];
    [_ageTextField2 autoSetDimension:ALDimensionWidth toSize:60*Balance_Width];
    
    [_sexLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_ageTextField1 withOffset:20*Balance_Heith];
    [_sexLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20*Balance_Width];
    [_sexLabel autoSetDimension:ALDimensionWidth toSize:35*Balance_Heith];
    [_sexLabel autoSetDimension:ALDimensionHeight toSize:15*Balance_Heith];
    
    [_sexBtn1 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_sexLabel];
    [_sexBtn1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_sexLabel withOffset:10*Balance_Width];
    [_sexBtn1 autoSetDimension:ALDimensionHeight toSize:25*Balance_Heith];
    [_sexBtn1 autoSetDimension:ALDimensionWidth toSize:60*Balance_Width];
    
    [_sexBtn2 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_sexLabel];
    [_sexBtn2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_sexBtn1 withOffset:10*Balance_Width];
    [_sexBtn2 autoSetDimension:ALDimensionHeight toSize:25*Balance_Heith];
    [_sexBtn2 autoSetDimension:ALDimensionWidth toSize:60*Balance_Width];
    
    [_sexBtn3 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_sexLabel];
    [_sexBtn3 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_sexBtn2 withOffset:10*Balance_Width];
    [_sexBtn3 autoSetDimension:ALDimensionHeight toSize:25*Balance_Heith];
    [_sexBtn3 autoSetDimension:ALDimensionWidth toSize:60*Balance_Width];

    [_sexBtn4 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_sexBtn1 withOffset:10*Balance_Heith];
    [_sexBtn4 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_sexLabel withOffset:10*Balance_Heith];
    [_sexBtn4 autoSetDimension:ALDimensionWidth toSize:60*Balance_Heith];
    [_sexBtn4 autoSetDimension:ALDimensionHeight toSize:25*Balance_Heith];
    
    [_marryLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_sexBtn4 withOffset:20*Balance_Heith];
    [_marryLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20*Balance_Width];
    [_marryLabel autoSetDimension:ALDimensionHeight toSize:15*Balance_Heith];
    [_marryLabel autoSetDimension:ALDimensionWidth toSize:35*Balance_Width];
    
    [_marryBtn1 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_marryLabel];
    [_marryBtn1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_marryLabel withOffset:10*Balance_Width];
    [_marryBtn1 autoSetDimension:ALDimensionHeight toSize:25*Balance_Heith];
    [_marryBtn1 autoSetDimension:ALDimensionWidth toSize:80*Balance_Width];
    
    [_marryBtn2 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_marryLabel];
    [_marryBtn2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_marryBtn1 withOffset:10*Balance_Width];
    [_marryBtn2 autoSetDimension:ALDimensionHeight toSize:25*Balance_Heith];
    [_marryBtn2 autoSetDimension:ALDimensionWidth toSize:80*Balance_Width];
    
    [_otherLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_marryBtn1 withOffset:20*Balance_Heith];
    [_otherLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20*Balance_Width];
    [_otherLabel autoSetDimension:ALDimensionHeight toSize:25*Balance_Heith];
    [_otherLabel autoSetDimension:ALDimensionWidth toSize:60*Balance_Width];
    
    [_otherTextField autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_otherLabel];
    [_otherTextField autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_otherLabel withOffset:10*Balance_Width];
    [_otherTextField autoSetDimension:ALDimensionHeight toSize:25*Balance_Heith];
    [_otherTextField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20*Balance_Width];
    
    [_determineBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_otherTextField withOffset:25*Balance_Heith];
    [_determineBtn autoAlignAxisToSuperviewAxis:(ALAxisVertical)];
    [_determineBtn autoSetDimension:ALDimensionWidth toSize:130*Balance_Width];
    [_determineBtn autoSetDimension:ALDimensionHeight toSize:30*Balance_Heith];
    
}

- (void)deleteAction {
    if ([self.delegate respondsToSelector:@selector(hiddenRequireView)]) {
        [self.delegate hiddenRequireView];
    }
}

// 确定
- (void)determineAction {

    if (sexType == nil || [sexType isEqualToString:@""] || _ageTextField1.text == nil || [_ageTextField1.text isEqualToString:@""] || _ageTextField2.text == nil || [_ageTextField2.text isEqualToString:@""] || marryType == nil || [marryType isEqualToString:@""]) {

        [LCProgressHUD showInfoMsg:@"请补全信息"];
        return;
    }else {
        if ([self.delegate respondsToSelector:@selector(requireInformationMixAge:maxAge:withSex:withMarry:withOther:)]) {
            [self.delegate requireInformationMixAge:_ageTextField1.text maxAge:_ageTextField2.text withSex:sexType withMarry:marryType withOther:_otherTextField.text];
        }
    }
}


- (void)marryBtn1Action:(UIButton *)button {
    button.selected = !button.selected;
    if (button.selected == YES) {
        marryType = @"0";
        _marryBtn2.selected = NO;
        button.layer.borderColor = UIColorFromRGB(0xf71f1f).CGColor;
        _marryBtn2.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        
        
    }
}

- (void)marryBtn2Action:(UIButton *)button {
    button.selected = !button.selected;
    if (button.selected == YES) {
        marryType = @"0";
        _marryBtn1.selected = NO;
        button.layer.borderColor = UIColorFromRGB(0xf71f1f).CGColor;
        _marryBtn1.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
    }
}

- (void)sexBtn1Action:(UIButton *)button {
    button.selected = !button.selected;
    if (button.selected == YES) {
        sexType = @"0";
        _sexBtn2.selected = NO;
        _sexBtn3.selected = NO;
        _sexBtn4.selected = NO;
        button.layer.borderColor = UIColorFromRGB(0xf71f1f).CGColor;
        _sexBtn2.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        _sexBtn3.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        _sexBtn4.layer.borderColor = UIColorFromRGB(0x333333).CGColor;

    }
}
- (void)sexBtn2Action:(UIButton *)button {
    button.selected = !button.selected;
    if (button.selected == YES) {
        sexType = @"1";
        _sexBtn1.selected = NO;
        _sexBtn3.selected = NO;
        _sexBtn4.selected = NO;
        button.layer.borderColor = UIColorFromRGB(0xf71f1f).CGColor;
        _sexBtn1.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        _sexBtn3.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        _sexBtn4.layer.borderColor = UIColorFromRGB(0x333333).CGColor;

    }
}
- (void)sexBtn3Action:(UIButton *)button {
    button.selected = !button.selected;
    if (button.selected == YES) {
        sexType = @"2";
        _sexBtn1.selected = NO;
        _sexBtn2.selected = NO;
        _sexBtn4.selected = NO;
        button.layer.borderColor = UIColorFromRGB(0xf71f1f).CGColor;
        _sexBtn1.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        _sexBtn2.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        _sexBtn4.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
    }
}

- (void)sexBtn4Action:(UIButton *)button {
    button.selected = !button.selected;
    if (button.selected == YES) {
        sexType = @"3";
        _sexBtn1.selected = NO;
        _sexBtn2.selected = NO;
        _sexBtn3.selected = NO;
        button.layer.borderColor = UIColorFromRGB(0xf71f1f).CGColor;
        _sexBtn1.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        _sexBtn2.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        _sexBtn3.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        
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
        _titleLabel.text = @"活动要求";
    }
    return _titleLabel;
}

- (UILabel *)ageLabel {
    if (!_ageLabel) {
        _ageLabel = [[UILabel alloc] initForAutoLayout];
        _ageLabel.font = [UIFont boldSystemFontOfSize:13];
        _ageLabel.text = @"年龄:";
    }
    return _ageLabel;
}

- (UITextField *)ageTextField1 {
    if (!_ageTextField1) {
        _ageTextField1 = [[UITextField alloc] initForAutoLayout];
        _ageTextField1.placeholder = @"年龄";
        //        _inputTextField.enabled = NO;
        _ageTextField1.textColor = UIColorFromRGB(0x333333);
        _ageTextField1.font = [UIFont systemFontOfSize:13];
        _ageTextField1.textAlignment = NSTextAlignmentLeft;
        _ageTextField1.layer.borderWidth = 1;
        _ageTextField1.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        _ageTextField1.layer.cornerRadius = 6;
        [_ageTextField1.layer setMasksToBounds:YES];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 5)];
        _ageTextField1.leftView = view;
        _ageTextField1.leftViewMode = UITextFieldViewModeAlways;
        _ageTextField1.keyboardType = UIKeyboardTypePhonePad;
    }
    return _ageTextField1;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initForAutoLayout];
        _label.font = [UIFont boldSystemFontOfSize:13];
        _label.text = @"~";
        _label.textAlignment = NSTextAlignmentCenter;
    }
    return _label;
}

- (UITextField *)ageTextField2 {
    if (!_ageTextField2) {
        _ageTextField2 = [[UITextField alloc] initForAutoLayout];
        _ageTextField2.placeholder = @"年龄";
        //        _inputTextField.enabled = NO;
        _ageTextField2.textColor = UIColorFromRGB(0x333333);
        _ageTextField2.font = [UIFont systemFontOfSize:13];
        _ageTextField2.textAlignment = NSTextAlignmentLeft;
        _ageTextField2.layer.borderWidth = 1;
        _ageTextField2.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        _ageTextField2.layer.cornerRadius = 6;
        [_ageTextField2.layer setMasksToBounds:YES];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 5)];
        _ageTextField2.leftView = view;
        _ageTextField2.leftViewMode = UITextFieldViewModeAlways;
    }
    return _ageTextField2;
}

- (UILabel *)sexLabel {
    if (!_sexLabel) {
        _sexLabel = [[UILabel alloc] initForAutoLayout];
        _sexLabel.font = [UIFont boldSystemFontOfSize:13];
        _sexLabel.text = @"性别:";
    }
    return _sexLabel;
}

- (UIButton *)sexBtn1 {
    if (!_sexBtn1) {
        _sexBtn1 = [[UIButton alloc] initForAutoLayout];
        [_sexBtn1 setBackgroundColor:UIColorFromRGB(0xffffff)];
        [_sexBtn1 setTitle:@"不限" forState:UIControlStateNormal];
        [_sexBtn1 setTitle:@"不限" forState:UIControlStateSelected];
        [_sexBtn1 setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [_sexBtn1 setTitleColor:UIColorFromRGB(0xf71f1f) forState:UIControlStateSelected];
        _sexBtn1.layer.borderWidth = 1;
        _sexBtn1.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        _sexBtn1.titleLabel.font = [UIFont systemFontOfSize:14];
        _sexBtn1.layer.cornerRadius = 6;
        [_sexBtn1.layer setMasksToBounds:YES];
        _sexBtn1.tag = 001;
        [_sexBtn1 addTarget:self action:@selector(sexBtn1Action:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sexBtn1;
}

- (UIButton *)sexBtn2 {
    if (!_sexBtn2) {
        _sexBtn2 = [[UIButton alloc] initForAutoLayout];
        [_sexBtn2 setBackgroundColor:UIColorFromRGB(0xffffff)];
        [_sexBtn2 setTitle:@"男" forState:UIControlStateNormal];
        [_sexBtn2 setTitle:@"男" forState:UIControlStateSelected];
        [_sexBtn2 setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [_sexBtn2 setTitleColor:UIColorFromRGB(0xf71f1f) forState:UIControlStateSelected];
        _sexBtn2.layer.borderWidth = 1;
        _sexBtn2.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        _sexBtn2.titleLabel.font = [UIFont systemFontOfSize:14];
        _sexBtn2.layer.cornerRadius = 6;
        [_sexBtn2.layer setMasksToBounds:YES];
        _sexBtn2.tag = 001;
        [_sexBtn2 addTarget:self action:@selector(sexBtn2Action:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sexBtn2;
}

- (UIButton *)sexBtn3 {
    if (!_sexBtn3) {
        _sexBtn3 = [[UIButton alloc] initForAutoLayout];
        [_sexBtn3 setBackgroundColor:UIColorFromRGB(0xffffff)];
        [_sexBtn3 setTitle:@"女" forState:UIControlStateNormal];
        [_sexBtn3 setTitle:@"女" forState:UIControlStateSelected];
        [_sexBtn3 setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [_sexBtn3 setTitleColor:UIColorFromRGB(0xf71f1f) forState:UIControlStateSelected];
        _sexBtn3.layer.borderWidth = 1;
        _sexBtn3.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        _sexBtn3.titleLabel.font = [UIFont systemFontOfSize:14];
        _sexBtn3.layer.cornerRadius = 6;
        [_sexBtn3.layer setMasksToBounds:YES];
        _sexBtn3.tag = 001;
        [_sexBtn3 addTarget:self action:@selector(sexBtn3Action:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sexBtn3;
}

- (UIButton *)sexBtn4 {
    if (!_sexBtn4) {
        _sexBtn4 = [[UIButton alloc] initForAutoLayout];
        [_sexBtn4 setBackgroundColor:UIColorFromRGB(0xffffff)];
        [_sexBtn4 setTitle:@"男女均等" forState:UIControlStateNormal];
        [_sexBtn4 setTitle:@"男女均等" forState:UIControlStateSelected];
        [_sexBtn4 setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [_sexBtn4 setTitleColor:UIColorFromRGB(0xf71f1f) forState:UIControlStateSelected];
        _sexBtn4.layer.borderWidth = 1;
        _sexBtn4.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        _sexBtn4.titleLabel.font = [UIFont systemFontOfSize:14];
        _sexBtn4.layer.cornerRadius = 6;
        [_sexBtn4.layer setMasksToBounds:YES];
        _sexBtn4.tag = 001;
        [_sexBtn4 addTarget:self action:@selector(sexBtn4Action:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sexBtn4;
}

- (UILabel *)marryLabel {
    if (!_marryLabel) {
        _marryLabel = [[UILabel alloc] initForAutoLayout];
        _marryLabel.font = [UIFont boldSystemFontOfSize:13];
        _marryLabel.text = @"单身:";
    }
    return _marryLabel;
}

- (UIButton *)marryBtn1 {
    if (!_marryBtn1) {
        _marryBtn1 = [[UIButton alloc] initForAutoLayout];
        [_marryBtn1 setBackgroundColor:UIColorFromRGB(0xffffff)];
        [_marryBtn1 setTitle:@"是" forState:UIControlStateNormal];
        [_marryBtn1 setTitle:@"是" forState:UIControlStateSelected];
        [_marryBtn1 setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [_marryBtn1 setTitleColor:UIColorFromRGB(0xf71f1f) forState:UIControlStateSelected];
        _marryBtn1.layer.borderWidth = 1;
        _marryBtn1.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        _marryBtn1.titleLabel.font = [UIFont systemFontOfSize:14];
        _marryBtn1.layer.cornerRadius = 6;
        [_marryBtn1.layer setMasksToBounds:YES];
        _marryBtn1.tag = 001;
        [_marryBtn1 addTarget:self action:@selector(marryBtn1Action:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _marryBtn1;
}

- (UIButton *)marryBtn2 {
    if (!_marryBtn2) {
        _marryBtn2 = [[UIButton alloc] initForAutoLayout];
        [_marryBtn2 setBackgroundColor:UIColorFromRGB(0xffffff)];
        [_marryBtn2 setTitle:@"不限" forState:UIControlStateNormal];
        [_marryBtn2 setTitle:@"不限" forState:UIControlStateSelected];
        [_marryBtn2 setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [_marryBtn2 setTitleColor:UIColorFromRGB(0xf71f1f) forState:UIControlStateSelected];
        _marryBtn2.layer.borderWidth = 1;
        _marryBtn2.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        _marryBtn2.titleLabel.font = [UIFont systemFontOfSize:14];
        _marryBtn2.layer.cornerRadius = 6;
        [_marryBtn2.layer setMasksToBounds:YES];
        _marryBtn2.tag = 001;
        [_marryBtn2 addTarget:self action:@selector(marryBtn2Action:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _marryBtn2;
}


- (UILabel *)otherLabel {
    if (!_otherLabel) {
        _otherLabel = [[UILabel alloc] initForAutoLayout];
        _otherLabel.font = [UIFont boldSystemFontOfSize:13];
        _otherLabel.text = @"其他要求:";
    }
    return _otherLabel;
}

- (UITextField *)otherTextField {
    if (!_otherTextField) {
        _otherTextField = [[UITextField alloc] initForAutoLayout];
        _otherTextField.placeholder = @"其他要求";
        //        _inputTextField.enabled = NO;
        _otherTextField.textColor = UIColorFromRGB(0x333333);
        _otherTextField.font = [UIFont systemFontOfSize:13];
        _otherTextField.textAlignment = NSTextAlignmentLeft;
        _otherTextField.layer.borderWidth = 1;
        _otherTextField.layer.borderColor = UIColorFromRGB(0x333333).CGColor;
        _otherTextField.layer.cornerRadius = 6;
        [_otherTextField.layer setMasksToBounds:YES];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 5)];
        _otherTextField.leftView = view;
        _otherTextField.leftViewMode = UITextFieldViewModeAlways;
    }
    return _otherTextField;
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
