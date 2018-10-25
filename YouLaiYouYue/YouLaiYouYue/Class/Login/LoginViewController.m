//
//  LoginViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/24.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "ForgetViewController.h"
#import "NIMKit.h"
#import "AttributeTouchLabel.h"
#import "ProtocolWebViewController.h"
@interface LoginViewController ()


@property (strong , nonatomic) UITextField *telNumTextField;
@property (strong , nonatomic) UITextField *codeTextField;
@property (strong , nonatomic) UIView *telXian;
@property (strong , nonatomic) UIView *codeXian;
@property (strong , nonatomic) UIButton *loginButton;
@property (strong , nonatomic) UIImageView *imgView;
@property (strong , nonatomic) UIView *middleLine;
@property (strong , nonatomic) UIButton *registerBtn;
@property (strong , nonatomic) UIButton *forgetBtn;
@property (strong , nonatomic) UIButton *thirdBtn;                  // 三方登录按钮
@property (strong , nonatomic) UILabel *thirdLabel;
@property (strong , nonatomic) UIView *leftLine;
@property (strong , nonatomic) UIView *rightLing;
@property (strong , nonatomic) AttributeTouchLabel *attributeLabel;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.fd_prefersNavigationBarHidden = YES;
    
    [self setUI];
    [self setData];
    

    __weak typeof(self)weakSelf = self;
    self.attributeLabel.eventBlock = ^(NSAttributedString *showText) {
        NSLog(@"vvvvvvvvvvvv");
        ProtocolWebViewController *vc = [[ProtocolWebViewController alloc] init];
        vc.webTitle = @"用户协议";
        vc.webUrl = @"http://www.youlaiyouyue.com/yinsi.html";
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
   
    
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
    [self setNavigationBarTitle:@"登录" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}


- (void)setUpUI {
    
    [self.view addSubview:self.imgView];
    [self.view addSubview:self.telNumTextField];
    [self.view addSubview:self.telXian];
    [self.view addSubview:self.codeTextField];
    [self.view addSubview:self.codeXian];
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.attributeLabel];
    [self.view addSubview:self.middleLine];
    [self.view addSubview:self.registerBtn];
    [self.view addSubview:self.forgetBtn];

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
    
    
    [_codeTextField autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_telXian withOffset:17];
    [_codeTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:35];
    [_codeTextField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:35];
    [_codeTextField autoSetDimension:ALDimensionHeight toSize:32];
    
    
    [_codeXian autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_codeTextField withOffset:6];
    [_codeXian autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:35];
    [_codeXian autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:35];
    [_codeXian autoSetDimension:ALDimensionHeight toSize:1];
    
    [_loginButton autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_codeXian withOffset:42];
    [_loginButton autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [_loginButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:35];
    [_loginButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:35];
    [_loginButton autoSetDimension:ALDimensionHeight toSize:42*Balance_Heith];
    
    [_attributeLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_loginButton withOffset:15];
    [_attributeLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:_loginButton withOffset:0];
    [_attributeLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:_loginButton withOffset:0];
    [_attributeLabel autoSetDimension:ALDimensionHeight toSize:40];
    
    
    [_middleLine autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_attributeLabel withOffset:15];
    [_middleLine autoAlignAxisToSuperviewAxis:(ALAxisVertical)];
    [_middleLine autoSetDimension:ALDimensionWidth toSize:1];
    [_middleLine autoSetDimension:ALDimensionHeight toSize:20];
    
    [_registerBtn autoAlignAxis:(ALAxisHorizontal) toSameAxisOfView:_middleLine];
    [_registerBtn autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_middleLine withOffset:-15];
    [_registerBtn autoSetDimension:ALDimensionHeight toSize:20];
    [_registerBtn autoSetDimension:ALDimensionWidth toSize:70];
    
    [_forgetBtn autoAlignAxis:(ALAxisHorizontal) toSameAxisOfView:_middleLine];
    [_forgetBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_middleLine withOffset:15];
    [_forgetBtn autoSetDimension:ALDimensionHeight toSize:20];
    [_forgetBtn autoSetDimension:ALDimensionWidth toSize:70];
    
    
}

- (void)setThirdBtn {
    
    NSArray *imageArr = @[@"qq",@"wx",@"xl"];
    for (NSInteger i = 0; i < imageArr.count; i++) {
        _thirdBtn = [[UIButton alloc] initForAutoLayout];
        _thirdBtn.tag = 1000+i;
        [_thirdBtn setImage:[[UIImage imageNamed:imageArr[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        _thirdBtn.imageEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
        [_thirdBtn addTarget:self action:@selector(thirdLoginButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.thirdBtn];
        
        [_thirdBtn autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:40];
        [_thirdBtn autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:i*SCREEN_WIDTH / imageArr.count];
        [_thirdBtn autoSetDimension:ALDimensionHeight toSize:40*Balance_Heith];
        [_thirdBtn autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH / imageArr.count];

    }
    
    [_thirdLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [_thirdLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_thirdBtn withOffset:-20];
    [_thirdLabel autoSetDimension:ALDimensionWidth toSize:150];
    [_thirdLabel autoSetDimension:ALDimensionHeight toSize:20];
    
    [_leftLine autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_thirdLabel];
    [_leftLine autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_thirdLabel withOffset:-10];
    [_leftLine autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [_leftLine autoSetDimension:ALDimensionHeight toSize:1];
    
    [_rightLing autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_thirdLabel];
    [_rightLing autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_thirdLabel withOffset:10];
    [_rightLing autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [_rightLing autoSetDimension:ALDimensionHeight toSize:1];
    
    
    
}

- (void)getDataFromUrl {
    
}

- (void)loginButton:(UIButton *)button {
    
    if (_telNumTextField.text != nil && ![_telNumTextField.text isEqualToString:@""] && _codeTextField.text != nil && ![_codeTextField.text isEqualToString:@""]) {
        NSString *url = [NSString  stringWithFormat:@"%@index.php/action/ac_login/login",baseUrl];
        NSString *mdUrl = [self MD5ForLower32Bate:url];
        NSDictionary *dic = @{
                              @"app_key" :mdUrl,
                              @"phone" : _telNumTextField.text,
                              @"password" : _codeTextField.text
                              };
        __weak typeof(self)weakSelf = self;
        [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id resultObject) {
            if ([resultObject[@"code"] integerValue] == 200) {
                SetUserDefault(@"YES", isLogin);
                SetUserDefault(resultObject[@"obj"][@"uid"], userID);
                
                // 网易云账号
                SetUserDefault(resultObject[@"obj"][@"wy_accid"], wy_aid);
                // 网易云密码
                SetUserDefault(resultObject[@"obj"][@"token"], wy_password);
                
                // 登录网易云
                [[NIMSDK sharedSDK].loginManager login:resultObject[@"obj"][@"wy_accid"] token:resultObject[@"obj"][@"token"] completion:^(NSError *error) {
                    if (!error) {
                        NSLog(@"登录成功");
                        
                    }else{
                        NSLog(@"登录失败");
                    }
                }];
                
                [weakSelf.navigationController popViewControllerAnimated:YES];
            }else {
                
                [LCProgressHUD showInfoMsg:resultObject[@"message"]];
            }
            
        } swpResultError:^(id resultObject, NSString *errorMessage) {
            [LCProgressHUD showInfoMsg:resultObject[@"message"]];
        }];
        
    }else {
        [LCProgressHUD showInfoMsg:@"请输入手机号或验证码!"];
    }
    
    
    
}

- (void)registerButton:(UIButton *)button {
    if (button.tag == 000) {
        NSLog(@"注册");
        RegisterViewController *vc = [[RegisterViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (button.tag == 001) {
        NSLog(@"忘记密码");
        ForgetViewController *vc = [[ForgetViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

// 结束编辑，键盘就消失
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


#pragma mark - 懒加载
- (UITextField *)telNumTextField {
    if (!_telNumTextField) {
        _telNumTextField = [[UITextField alloc] initForAutoLayout];
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
        _codeTextField.keyboardType = UIKeyboardTypeDefault;
        _codeTextField.placeholder = @"请输入密码~";
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

- (UIButton *)loginButton {
    if (!_loginButton) {
        _loginButton = [[UIButton alloc] initForAutoLayout];
        [_loginButton setBackgroundColor:UIColorFromRGB(0xff9d00)];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTitle:@"登录" forState:UIControlStateSelected];
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

- (UIView *)middleLine {
    if (!_middleLine) {
        _middleLine = [[UIView alloc] initForAutoLayout];
        _middleLine.backgroundColor = UIColorFromRGB(0x979797);
    }
    return _middleLine;
}

- (UIButton *)registerBtn {
    if (!_registerBtn) {
        _registerBtn = [[UIButton alloc] initForAutoLayout];
        [_registerBtn setBackgroundColor:UIColorFromRGB(0xffffff)];
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_registerBtn setTitle:@"注册" forState:UIControlStateSelected];
        [_registerBtn setTitleColor:UIColorFromRGB(0xff9d00) forState:UIControlStateNormal];
        _registerBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _registerBtn.layer.cornerRadius = 6;
        [_registerBtn.layer setMasksToBounds:YES];
        _registerBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        _registerBtn.tag = 000;
        [_registerBtn addTarget:self action:@selector(registerButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerBtn;
}


- (UIButton *)forgetBtn {
    if (!_forgetBtn) {
        _forgetBtn = [[UIButton alloc] initForAutoLayout];
        [_forgetBtn setBackgroundColor:UIColorFromRGB(0xffffff)];
        [_forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_forgetBtn setTitle:@"忘记密码" forState:UIControlStateSelected];
        [_forgetBtn setTitleColor:UIColorFromRGB(0x626262) forState:UIControlStateNormal];
        _forgetBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        _forgetBtn.layer.cornerRadius = 6;
        [_forgetBtn.layer setMasksToBounds:YES];
        _forgetBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _forgetBtn.tag = 001;
        [_forgetBtn addTarget:self action:@selector(registerButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgetBtn;
}

- (UILabel *)thirdLabel {
    if (!_thirdLabel) {
        _thirdLabel = [[UILabel alloc] initForAutoLayout];
        _thirdLabel.text = @"常用第三方登录";
        _thirdLabel.textAlignment = NSTextAlignmentCenter;
        _thirdLabel.textColor = UIColorFromRGB(0xcacaca);
    }
    return _thirdLabel;
}

- (UIView *)leftLine {
    if (!_leftLine) {
        _leftLine = [[UIView alloc] initForAutoLayout];
        _leftLine.backgroundColor = UIColorFromRGB(0xcacaca);
    }
    return _leftLine;
}
- (UIView *)rightLing {
    if (!_rightLing) {
        _rightLing = [[UIView alloc] initForAutoLayout];
        _rightLing.backgroundColor = UIColorFromRGB(0xcacaca);
    }
    return _rightLing;
}
- (AttributeTouchLabel *)attributeLabel {
    if (!_attributeLabel) {
        _attributeLabel = [[AttributeTouchLabel alloc] initForAutoLayout];
        _attributeLabel.content = @"登录注册表示同意用户协议,隐私条款";
        
//                                  您将同意《 巴拉巴拉小魔仙协议 》
    }
    return _attributeLabel;
}

@end
