//
//  LookVideoViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/10/15.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "LookVideoViewController.h"
#import <WebKit/WebKit.h>
@interface LookVideoViewController ()

@property (nonatomic, strong) WKWebView *wkWebView;

@property (nonatomic ,strong) UIView *navBackView;

@end

@implementation LookVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    UILabel *label =[[UILabel alloc] init];
//    //自定义标题
//    label        = [[UILabel alloc] initWithFrame:CGRectMake(0, 20 , self.view.frame.size.width, 44)];
//    label.font            = [UIFont systemFontOfSize:17.0f];
//    label.textColor       = [UIColor blackColor];  //设置文本颜色
//    if (@available(iOS 6.0, *)) {
//        label.textAlignment   = NSTextAlignmentCenter;
//    } else {
//        // Fallback on earlier versions
//    }
//    label.opaque          = NO;
//    label.text            = @"视频播放";              //设置标题
//    [self.view addSubview:label];
    
    [self.view addSubview:self.navBackView];
    
    
    UIButton *button  =[UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:button];
    if (StatusHeight == 44) {
        button.frame = CGRectMake(0, 88-44, 44, 44);
    }else {
        button.frame = CGRectMake(0, 64-44, 44, 44);
    }
    [button setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    
    if (StatusHeight == 44) {
        self.wkWebView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 88, self.view.bounds.size.width, self.view.bounds.size.height-88)];
    }else {
        self.wkWebView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64)];
    }

    [self.view addSubview:_wkWebView];
    self.wkWebView.scrollView.backgroundColor = [UIColor blackColor];
    
    NSURL *urlPath = [NSURL URLWithString:self.urlStr];
    
    [self.wkWebView loadRequest:[NSURLRequest requestWithURL:urlPath]];
}
-(void)pop{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (UIView *)navBackView
{
    if (!_navBackView) {
        if (StatusHeight == 44) {
            _navBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 88)];
        }else {
            _navBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
        }
        
        _navBackView.backgroundColor = UIColorFromRGB(0x333333);
        //        _navBackView.alpha = 0;
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.frame = CGRectMake(0, StatusHeight-2, SCREEN_WIDTH, 44);
        nameLabel.text = @"视频播放";
        nameLabel.textColor = [UIColor whiteColor];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        [_navBackView addSubview:nameLabel];
    }
    return _navBackView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
