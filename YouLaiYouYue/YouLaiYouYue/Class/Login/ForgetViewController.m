//
//  ForgetViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/24.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "ForgetViewController.h"

@interface ForgetViewController ()
@property (strong , nonatomic) UITextField *telNumTextField;
@property (strong , nonatomic) UITextField *codeTextField;
@property (strong , nonatomic) UIView *telXian;
@property (strong , nonatomic) UIView *codeXian;
@property (strong , nonatomic) UIButton *codeButton;
@property (strong , nonatomic) UITextField *passwordTextField;
@property (strong , nonatomic) UIView *passXian;
@property (strong , nonatomic) UITextField *repeatTextField;
@property (strong , nonatomic) UIView *repeatXian;
@property (strong , nonatomic) UIButton *loginButton;
@property (strong , nonatomic) UIImageView *imgView;
@end

@implementation ForgetViewController {
    NSString *CodeId;
}

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
    CodeId = @"";
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:@"找回密码" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}


- (void)setUpUI {
    
    [self.view addSubview:self.imgView];
    [self.view addSubview:self.telNumTextField];
    [self.view addSubview:self.telXian];
    [self.view addSubview:self.codeTextField];
    [self.view addSubview:self.codeButton];
    [self.view addSubview:self.codeXian];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.passXian];
    [self.view addSubview:self.repeatTextField];
    [self.view addSubview:self.repeatXian];
    [self.view addSubview:self.loginButton];
    
}


- (void)setUIAutoLayout {
    
    [_imgView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [_imgView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:35];
    [_imgView autoSetDimension:ALDimensionWidth toSize:100*Balance_Width];
    [_imgView autoSetDimension:ALDimensionHeight toSize:100*Balance_Heith];
    
    [_telNumTextField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_imgView withOffset:30];
    [_telNumTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:35];
    [_telNumTextField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:35];
    [_telNumTextField autoSetDimension:ALDimensionHeight toSize:32];
    
    [_telXian autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_telNumTextField withOffset:6];
    [_telXian autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:35];
    [_telXian autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:35];
    [_telXian autoSetDimension:ALDimensionHeight toSize:1];
    
    [_codeButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_telXian withOffset:10];
    [_codeButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:35];
    [_codeButton autoSetDimension:ALDimensionWidth toSize:108];
    [_codeButton autoSetDimension:ALDimensionHeight toSize:38];
    
    [_codeTextField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_telXian withOffset:17];
    [_codeTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:35];
    [_codeTextField autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_codeButton withOffset:5];
    [_codeTextField autoSetDimension:ALDimensionHeight toSize:32];
    
    
    [_codeXian autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_codeTextField withOffset:6];
    [_codeXian autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:35];
    [_codeXian autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:35];
    [_codeXian autoSetDimension:ALDimensionHeight toSize:1];
    
    [_passwordTextField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_codeXian withOffset:17];
    [_passwordTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:35];
    [_passwordTextField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:35];
    [_passwordTextField autoSetDimension:ALDimensionHeight toSize:32];
    
    [_passXian autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_passwordTextField withOffset:6];
    [_passXian autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:35];
    [_passXian autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:35];
    [_passXian autoSetDimension:ALDimensionHeight toSize:1];
    
    [_repeatTextField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_passXian withOffset:17];
    [_repeatTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:35];
    [_repeatTextField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:35];
    [_repeatTextField autoSetDimension:ALDimensionHeight toSize:32];
    
    [_repeatXian autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_repeatTextField withOffset:6];
    [_repeatXian autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:35];
    [_repeatXian autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:35];
    [_repeatXian autoSetDimension:ALDimensionHeight toSize:1];
    
    
    
    
    [_loginButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_repeatXian withOffset:42];
    [_loginButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [_loginButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:35];
    [_loginButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:35];
    [_loginButton autoSetDimension:ALDimensionHeight toSize:42*Balance_Heith];
}

- (void)getDataFromUrl {
    
}

- (void)loginButton:(UIButton *)button {
    
    if (![_passwordTextField.text isEqualToString:_repeatTextField.text]) {
        [LCProgressHUD showInfoMsg:@"两次密码不一致!"];
        
        return;
    }
    
    if (_telNumTextField.text != nil && ![_telNumTextField.text isEqualToString:@""] && _codeTextField.text != nil && ![_codeTextField.text isEqualToString:@""] && _passwordTextField.text != nil && ![_passwordTextField.text isEqualToString:@""] && _repeatTextField.text != nil && ![_repeatTextField.text isEqualToString:@""]) {
        NSString *url = [NSString  stringWithFormat:@"%@index.php/action/ac_login/Retrievethepassword",baseUrl];
        NSString *mdUrl = [self MD5ForLower32Bate:url];
        NSDictionary *dic = @{
                              @"app_key" :mdUrl,
                              @"phone" : _telNumTextField.text,
                              @"password" : _passwordTextField.text ,
                              @"Confirmpassword" : _repeatTextField.text,
                              @"CodeId"  : CodeId ,
                              @"code"    : _codeTextField.text
                              };
        __weak typeof(self)weakSelf = self;
        //        NSString *str = [Utils convertToJsonData:dic];
        
        [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id resultObject) {
            if ([resultObject[@"code"] integerValue] == 200) {
                //                SetUserDefault(@"YES", isLogin);
                [LCProgressHUD showMessage:@"修改成功"];
                [weakSelf.navigationController popViewControllerAnimated:YES];
            }else {
                
                [LCProgressHUD showMessage:resultObject[@"message"]];
            }
            
        } swpResultError:^(id resultObject, NSString *errorMessage) {
            [LCProgressHUD showMessage:resultObject[@"message"]];
        }];
        
    }else {
        [LCProgressHUD showInfoMsg:@"请输入手机号或验证码或密码!"];
    }
    
    
    
}


// 获取验证码
- (void)codeButton:(UIButton *)button {
    if ([self checkTel:self.telNumTextField.text] == YES) {
        
        __block int timeout=59;
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
        dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
        dispatch_source_set_event_handler(_timer, ^{
            if(timeout<=0){ //倒计时结束，关闭
                dispatch_source_cancel(_timer);
                dispatch_async(dispatch_get_main_queue(), ^{
                    //设置界面的按钮显示 根据自己需求设置
                    [button setTitle:@"获取验证码" forState:UIControlStateNormal];
                    button.userInteractionEnabled = YES;
                });
            }else{
                //            int minutes = timeout / 60;
                int seconds = timeout % 60;
                NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
                dispatch_async(dispatch_get_main_queue(), ^{
                    //设置界面的按钮显示 根据自己需求设置
                    //NSLog(@"____%@",strTime);
                    [button setTitle:[NSString stringWithFormat:@"%@s %@",strTime, @"重发"] forState:UIControlStateNormal];
                    button.userInteractionEnabled = NO;
                });
                timeout--;
            }
        });
        dispatch_resume(_timer);
        NSString* name=self.telNumTextField.text;
        
        NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_login/SendCode",baseUrl];
        NSString *mdUrl = [self MD5ForLower32Bate:url];
        NSDictionary* dict=@{
                             @"app_key" : mdUrl,
                             @"phone" : name
                             };
        [self swpPublicTooGetDataToServer:url parameters:dict isEncrypt:NO swpResultSuccess:^(id resultObject) {
            if ([resultObject[@"code"] integerValue] == 200) {
                CodeId = resultObject[@"obj"][@"codeID"];
            }
        } swpResultError:^(id resultObject, NSString *errorMessage) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [button setTitle:@"获取验证码" forState:UIControlStateNormal];
                button.userInteractionEnabled = YES;
            });
            [LCProgressHUD showFailure:errorMessage];
        }];
    }
    
}
#pragma mark----------检查用户输入手机号
- (BOOL)checkTel:(NSString *)str {
    if ([str length] != 11)
    {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入正确的手机号" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        return NO;
    }
    return YES;
}

// 结束编辑，键盘就消失
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark - 懒加载
- (UITextField *)telNumTextField {
    if (!_telNumTextField) {
        _telNumTextField = [[UITextField alloc] initForAutoLayout];
        _telNumTextField.delegate = self;
        _telNumTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tel"]];;
        _telNumTextField.leftViewMode = UITextFieldViewModeAlways;
        //设置输入框内容的字体样式和大小
        _telNumTextField.font = [UIFont systemFontOfSize:15];
        //设置字体颜色
        //        _telNumTextField.textColor = [UIColor redColor];
        //输入框中是否有个叉号，在什么时候显示，用于一次性删除输入框中的内容
        _telNumTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        //再次编辑就清空
        //        _telNumTextField.clearsOnBeginEditing = YES;
        //设置键盘的样式
        _telNumTextField.keyboardType = UIKeyboardTypePhonePad;
        _telNumTextField.placeholder = @"输入您的手机号码~";
        //        _telNumTextField.text = @"18346038613";
    }
    return _telNumTextField;
}
- (UIView *)telXian {
    if (!_telXian) {
        _telXian = [[UIView alloc] initForAutoLayout];
        _telXian.backgroundColor = UIColorFromRGB(0xadadad);
    }
    return _telXian;
}

#pragma mark - 懒加载
- (UITextField *)codeTextField {
    if (!_codeTextField) {
        _codeTextField = [[UITextField alloc] initForAutoLayout];
        //        _codeTextField.delegate = self;
        _codeTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"code"]];;
        _codeTextField.leftViewMode = UITextFieldViewModeAlways;
        //设置输入框内容的字体样式和大小
        _codeTextField.font = [UIFont systemFontOfSize:15];
        //设置字体颜色
        //        _telNumTextField.textColor = [UIColor redColor];
        //输入框中是否有个叉号，在什么时候显示，用于一次性删除输入框中的内容
        _codeTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        //再次编辑就清空
        //        _telNumTextField.clearsOnBeginEditing = YES;
        //设置键盘的样式
        _codeTextField.keyboardType = UIKeyboardTypePhonePad;
        _codeTextField.placeholder = @"请输入验证码~";
        //        _codeTextField.text = @"8213";
    }
    return _codeTextField;
}

- (UIView *)codeXian {
    if (!_codeXian) {
        _codeXian = [[UIView alloc] initForAutoLayout];
        _codeXian.backgroundColor = UIColorFromRGB(0xadadad);
    }
    return _codeXian;
}

- (UITextField *)passwordTextField {
    if (!_passwordTextField) {
        _passwordTextField = [[UITextField alloc] initForAutoLayout];
        _passwordTextField.delegate = self;
        _passwordTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tel"]];;
        _passwordTextField.leftViewMode = UITextFieldViewModeAlways;
        //设置输入框内容的字体样式和大小
        _passwordTextField.font = [UIFont systemFontOfSize:15];
        //设置字体颜色
        //        _telNumTextField.textColor = [UIColor redColor];
        //输入框中是否有个叉号，在什么时候显示，用于一次性删除输入框中的内容
        _passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        //再次编辑就清空
        //        _telNumTextField.clearsOnBeginEditing = YES;
        //设置键盘的样式
        _passwordTextField.keyboardType = UIKeyboardTypeDefault;
        _passwordTextField.placeholder = @"设置密码~";
        _passwordTextField.secureTextEntry = YES;
        //        _telNumTextField.text = @"18346038613";
    }
    return _passwordTextField;
}

- (UITextField *)repeatTextField {
    if (!_repeatTextField) {
        _repeatTextField = [[UITextField alloc] initForAutoLayout];
        _repeatTextField.delegate = self;
        _repeatTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tel"]];;
        _repeatTextField.leftViewMode = UITextFieldViewModeAlways;
        //设置输入框内容的字体样式和大小
        _repeatTextField.font = [UIFont systemFontOfSize:15];
        //设置字体颜色
        //        _telNumTextField.textColor = [UIColor redColor];
        //输入框中是否有个叉号，在什么时候显示，用于一次性删除输入框中的内容
        _repeatTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        //再次编辑就清空
        //        _telNumTextField.clearsOnBeginEditing = YES;
        //设置键盘的样式
        _repeatTextField.keyboardType = UIKeyboardTypeDefault;
        _repeatTextField.placeholder = @"确认密码~";
        _repeatTextField.secureTextEntry = YES;
        //        _telNumTextField.text = @"18346038613";
    }
    return _repeatTextField;
}
- (UIView *)passXian {
    if (!_passXian) {
        _passXian = [[UIView alloc] initForAutoLayout];
        _passXian.backgroundColor = UIColorFromRGB(0xadadad);
    }
    return _passXian;
}
- (UIView *)repeatXian {
    if (!_repeatXian) {
        _repeatXian = [[UIView alloc] initForAutoLayout];
        _repeatXian.backgroundColor = UIColorFromRGB(0xadadad);
    }
    return _repeatXian;
}

- (UIButton *)codeButton {
    if (!_codeButton) {
        _codeButton = [[UIButton alloc] initForAutoLayout];
        [_codeButton setBackgroundColor:UIColorFromRGB(0xff9d00)];
        [_codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_codeButton setTitle:@"获取验证码" forState:UIControlStateSelected];
        [_codeButton setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _codeButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _codeButton.layer.cornerRadius = 6;
        [_codeButton.layer setMasksToBounds:YES];
        [_codeButton addTarget:self action:@selector(codeButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _codeButton;
}

- (UIButton *)loginButton {
    if (!_loginButton) {
        _loginButton = [[UIButton alloc] initForAutoLayout];
        [_loginButton setBackgroundColor:UIColorFromRGB(0xff9d00)];
        [_loginButton setTitle:@"完成" forState:UIControlStateNormal];
        [_loginButton setTitle:@"完成" forState:UIControlStateSelected];
        [_loginButton setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _loginButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _loginButton.layer.cornerRadius = 6;
        [_loginButton.layer setMasksToBounds:YES];
        _loginButton.tag = 524;
        [_loginButton addTarget:self action:@selector(loginButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [[UIImageView alloc] initForAutoLayout];
        _imgView.image = [UIImage imageNamed:@"头像 copy 3"];
        _imgView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imgView;
}


@end
