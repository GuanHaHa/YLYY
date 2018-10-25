//
//  ProtocolWebViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/10/17.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "ProtocolWebViewController.h"
#import <WebKit/WebKit.h>
@interface ProtocolWebViewController ()<WKNavigationDelegate>

@property (nonatomic ,strong)  WKWebView *baseWebView;

@property (nonatomic ,strong) UIProgressView *progressView;

@end

@implementation ProtocolWebViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self.tabBarController.tabBar setHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self setNavigationBar];
    [self.view addSubview:self.baseWebView];
    [self.view addSubview:self.progressView];
}

- (WKWebView *)baseWebView
{
    if (!_baseWebView) {
        _baseWebView = [WKWebView new];
        NSLog(@"%f",StatusHeight);
        if (StatusHeight == 20) {
            _baseWebView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64);
        }else {
            _baseWebView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-88);
        }
        
        _baseWebView.navigationDelegate = self;
        //        _baseWebView.scrollView.scrollEnabled =NO;
        [_baseWebView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:NULL];
    }
    return _baseWebView;
}




- (void)setWebUrl:(NSString *)webUrl {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:webUrl]];
    [self.baseWebView loadRequest:request];
}


- (void)setNavigationBar {
    
    [self setNavigationBarTitle:_webTitle textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
