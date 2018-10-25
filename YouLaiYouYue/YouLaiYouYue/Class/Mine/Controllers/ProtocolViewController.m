//
//  ProtocolViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/28.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "ProtocolViewController.h"
#import <WebKit/WebKit.h>
@interface ProtocolViewController ()<WKNavigationDelegate>

@property (nonatomic ,strong)  WKWebView *baseWebView;

@property (nonatomic ,strong) UIProgressView *progressView;

@end

@implementation ProtocolViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self setNavigationBar];
    [self.view addSubview:self.baseWebView];
    [self.view addSubview:self.progressView];
    
    [self.baseWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://47.92.136.19/index.php/action/ac_public/user_agreement"]]];
}

- (WKWebView *)baseWebView
{
    if (!_baseWebView) {
        _baseWebView = [WKWebView new];
        _baseWebView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-JCNew64);
        _baseWebView.navigationDelegate = self;
        [_baseWebView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:NULL];
    }
    return _baseWebView;
}


- (void)reloadWebViewController:(NSString *)urlStr
{
    
}


- (void)setNavigationBar {
    
    [self setNavigationBarTitle:@"用户协议" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}

- (void)setUIAutoLayout
{
}

- (UIProgressView *)progressView
{
    if (!_progressView) {
        _progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
        
        _progressView.progressTintColor = [UIColor blueColor];
        _progressView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 1.5);
    }
    return _progressView;
}
// kvo监听加载进度

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    
    if ([keyPath isEqualToString:@"estimatedProgress"] && object == self.baseWebView) {
        [self.progressView setAlpha:1.0f];
        [self.progressView setProgress:self.baseWebView.estimatedProgress animated:YES];
        
        
        if(self.baseWebView.estimatedProgress >= 1.0f) {
            [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
                [self.progressView setAlpha:0.0f];
            } completion:^(BOOL finished) {
                [self.progressView setProgress:0.0f animated:NO];
            }];
        }
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)popViewController
{
    if (_baseWebView.canGoBack == YES) {
        [_baseWebView goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}





- (void)dealloc
{
    [self.baseWebView removeObserver:self forKeyPath:@"estimatedProgress"];
}
@end
