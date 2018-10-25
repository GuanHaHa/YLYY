//
//  SignViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/25.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "SignViewController.h"

@interface SignViewController ()

@property (strong , nonatomic) UITextView *textView;

@end

@implementation SignViewController

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
    [self setNavigationBarTitle:@"个性签名" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
    [self addRightButton];
}


- (void)setUpUI {
    [self.view addSubview:self.textView];
}


- (void)setUIAutoLayout {
    [_textView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:17*Balance_Heith];
    [_textView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:16*Balance_Width];
    [_textView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:16*Balance_Width];
    [_textView autoSetDimension:ALDimensionHeight toSize:150*Balance_Heith];
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
// 右侧按钮点击方法
- (void)rightButton:(UIButton *)button {
    if (self.block) {
        _block(_textView.text);
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)getSignBlock:(SignBlock)block {
    _block = block;
}

#pragma mark - UITextViewDelegate
// 开始编辑
- (void)textViewDidBeginEditing:(UITextView *)textView{
    _textView.text = @"";
}
// 控制输入文字的长度和内容
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (range.location>=250)
    {
        UIAlertView * alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"输入上线300字" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
        return NO;
    }
    else
    {
        return textView.textInputMode != nil;
    }
}

#pragma mark - 懒加载
- (UITextView *)textView {
    if (!_textView) {
        _textView = [[UITextView alloc] initForAutoLayout];
        _textView.backgroundColor = UIColorFromRGB(0xf5f5f5);
        _textView.textColor = UIColorFromRGB(0x9f9f9f);
        _textView.text = @"请简要说明";
        _textView.font = [UIFont systemFontOfSize:16];
        _textView.delegate = self;
        _textView.returnKeyType = UIReturnKeyDefault;//return键的类型
        _textView.layer.cornerRadius  = 6;
        _textView.layer.masksToBounds = YES;
    }
    return _textView;
}

@end
