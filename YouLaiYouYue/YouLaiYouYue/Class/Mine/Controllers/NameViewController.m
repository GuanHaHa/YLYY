//
//  NameViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/25.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "NameViewController.h"


@interface NameViewController ()

@property (strong , nonatomic) UILabel *label;
@property (strong , nonatomic) UITextField *nameTextField;


@end

@implementation NameViewController

#pragma mark - Lifecycle Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    // Do any additional setup after loading the view.
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
    [self setNavigationBarTitle:@"昵称" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
    [self addRightButton];
}


- (void)setUpUI {
    [self.view addSubview:self.label];
    [self.label addSubview:self.nameTextField];
}


- (void)setUIAutoLayout {
    
    [_label autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:16*Balance_Heith];
    [_label autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:16*Balance_Width];
    [_label autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:16*Balance_Width];
    [_label autoSetDimension:ALDimensionHeight toSize:44*Balance_Heith];
    
    [_nameTextField autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [_nameTextField autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:5];
    [_nameTextField autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [_nameTextField autoSetDimension:ALDimensionHeight toSize:44*Balance_Heith];
}

// 结束编辑，键盘就消失
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
// 右侧按钮
- (void)addRightButton {
    UIButton *rightBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:@"保存" forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    rightBtn.frame = CGRectMake(0, 0, 44, 44);
    UIBarButtonItem* rightBtnItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    [rightBtn addTarget:self action:@selector(rightButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setRightBarButtonItem:rightBtnItem];
}

- (void)getNameBlock:(NameBlock)block {
    
    _block = block;
}

// 右侧按钮点击方法
- (void)rightButton:(UIButton *)button {
    if (self.block) {
        _block(_nameTextField.text);
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark - 懒加载
- (UITextField *)nameTextField {
    if (!_nameTextField) {
        _nameTextField = [[UITextField alloc] initForAutoLayout];
        //        _numTextField.delegate = self;
        _nameTextField.backgroundColor = UIColorFromRGB(0xf5f5f5);
        //        _numTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tel"]];;
        //        _numTextField.leftViewMode = UITextFieldViewModeAlways;
        
        //设置输入框内容的字体样式和大小
        _nameTextField.font = [UIFont systemFontOfSize:17];
        //设置字体颜色
        _nameTextField.textColor = UIColorFromRGB(0x9f9f9f);
        //输入框中是否有个叉号，在什么时候显示，用于一次性删除输入框中的内容
        _nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        //再次编辑就清空
        //        _telNumTextField.clearsOnBeginEditing = YES;
        //设置键盘的样式
        _nameTextField.keyboardType = UIKeyboardTypeDefault;
        _nameTextField.placeholder = @"给自己起个喜欢的名字~";
        _nameTextField.tintColor = [UIColor whiteColor];
        
    }
    return _nameTextField;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initForAutoLayout];
        _label.backgroundColor = UIColorFromRGB(0xf5f5f5);
        _label.layer.cornerRadius  = 6;
        _label.layer.masksToBounds = YES;
        _label.userInteractionEnabled = YES;
    }
    return _label;
}
@end
