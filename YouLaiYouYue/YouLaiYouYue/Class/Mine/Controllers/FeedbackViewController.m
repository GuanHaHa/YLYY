//
//  FeedbackViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/28.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "FeedbackViewController.h"

@interface FeedbackViewController ()<UITextViewDelegate>
@property (strong , nonatomic) UILabel *typeLabel;
@property (strong , nonatomic) UITextView *textView; // 建议
@property (strong , nonatomic) UIButton *sendButton;
@end

@implementation FeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.fd_prefersNavigationBarHidden = YES;
    
    [self setUI];
    [self setData];
    
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}


- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)dealloc {
    NSLog(@"%s", __FUNCTION__);
}

#pragma mark - SetData Data Method

- (void)setData {
    
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:@"意见反馈" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}


- (void)setUpUI {
    [self.view addSubview:self.typeLabel];
    [self.view addSubview:self.textView];
    [self.view addSubview:self.sendButton];
}


- (void)setUIAutoLayout {
    [_typeLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:18*Balance_Heith];
    [_typeLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft  withInset:16*Balance_Width];
    [_typeLabel autoPinEdgeToSuperviewEdge:ALEdgeRight  withInset:16*Balance_Width];
    [_typeLabel autoSetDimension:ALDimensionHeight toSize:18*Balance_Heith];
    
    
    [_textView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_typeLabel withOffset:18*Balance_Heith];
    [_textView autoPinEdgeToSuperviewEdge:ALEdgeLeft  withInset:16*Balance_Width];
    [_textView autoPinEdgeToSuperviewEdge:ALEdgeRight  withInset:16*Balance_Width];
    [_textView autoSetDimension:ALDimensionHeight toSize:150*Balance_Heith];
    
    [_sendButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_textView withOffset:40*Balance_Heith];
    [_sendButton autoPinEdgeToSuperviewEdge:ALEdgeLeft  withInset:36*Balance_Width];
    [_sendButton autoPinEdgeToSuperviewEdge:ALEdgeRight  withInset:36*Balance_Width];
    [_sendButton autoSetDimension:ALDimensionHeight toSize:45*Balance_Heith];
    
}

- (void)getDataFromUrl {
    
}


// 开始编辑
- (void)textViewDidEndEditing:(UITextView *)textView {
    
    
}

// 结束编辑，键盘就消失
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)sendButton:(UIButton *)button {
    if (_textView.text == nil || [_textView.text isEqualToString:@""]) {
        [LCProgressHUD showMessage:@"请填写意见反馈"];
        return;
    }
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_user/feedback",baseUrl];
    NSString *md5Url= [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"uid"     : GetUserDefault(userID),
                          @"content" : _textView.text
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            [LCProgressHUD showMessage:@"提交成功"];
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

#pragma mark - 懒加载
- (UILabel *)typeLabel {
    if (!_typeLabel) {
        _typeLabel = [[UILabel alloc] initForAutoLayout];
        _typeLabel.text = @"意见反馈";
        _typeLabel.font = [UIFont boldSystemFontOfSize:17];
    }
    return _typeLabel;
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
        
        UILabel *placeHolderLabel = [[UILabel alloc] init];
        placeHolderLabel.text = @"请填写你的建议,感谢您的支持";
        placeHolderLabel.numberOfLines = 0;
        placeHolderLabel.textColor = [UIColor lightGrayColor];
        [placeHolderLabel sizeToFit];
        [_textView addSubview:placeHolderLabel];
        // same font
        placeHolderLabel.font = [UIFont systemFontOfSize:13.f];
        [_textView setValue:placeHolderLabel forKey:@"_placeholderLabel"];
    }
    return _textView;
}
- (UIButton *)sendButton {
    if (!_sendButton) {
        _sendButton = [[UIButton alloc] initForAutoLayout];
        [_sendButton setBackgroundColor:UIColorFromRGB(0xff9d00)];
        [_sendButton setTitle:@"发送" forState:UIControlStateNormal];
        [_sendButton setTitle:@"发送" forState:UIControlStateSelected];
        [_sendButton setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _sendButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _sendButton.layer.cornerRadius = 6;
        [_sendButton.layer setMasksToBounds:YES];
        [_sendButton addTarget:self action:@selector(sendButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendButton;
}

@end
