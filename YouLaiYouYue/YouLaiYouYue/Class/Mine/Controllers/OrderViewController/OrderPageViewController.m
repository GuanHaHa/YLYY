//
//  OrderPageViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/14.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "OrderPageViewController.h"
#import "AllOrderViewController.h"
#import "UnpaidViewController.h"
#import "JourneyViewController.h"
#import "EvaluatViewController.h"
#import "RefundViewController.h"
@interface OrderPageViewController ()

@end

@implementation OrderPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigationBarTitle:@"订单" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
    
    // 添加所有子控制器
    [self setUpAllViewController];
    
    [self setUpTitleEffect:^(UIColor *__autoreleasing *titleScrollViewColor, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor, UIFont *__autoreleasing *titleFont, CGFloat *titleHeight, CGFloat *titleWidth) {
        *norColor = [UIColor lightGrayColor];
        *selColor = [UIColor blackColor];
        *titleWidth = [UIScreen mainScreen].bounds.size.width / 4;
    }];
    
    // 标题渐变
    // *推荐方式(设置标题渐变)
    [self setUpTitleGradient:^(YZTitleColorGradientStyle *titleColorGradientStyle, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor) {
        
    }];
    
    [self setUpUnderLineEffect:^(BOOL *isUnderLineDelayScroll, CGFloat *underLineH, UIColor *__autoreleasing *underLineColor,BOOL *isUnderLineEqualTitleWidth) {
        //        *isUnderLineDelayScroll = YES;
        *isUnderLineEqualTitleWidth = YES;
    }];
    
}

// 添加所有子控制器
- (void)setUpAllViewController {
    AllOrderViewController *wordVc1 = [[AllOrderViewController alloc] init];
    wordVc1.title = @"全部";
    [self addChildViewController:wordVc1];
    
    UnpaidViewController *wordVc2 = [[UnpaidViewController alloc] init];
    wordVc2.title = @"待支付";
    [self addChildViewController:wordVc2];
    
    JourneyViewController *wordVc3 = [[JourneyViewController alloc] init];
    wordVc3.title = @"进行中";
    [self addChildViewController:wordVc3];
    
    EvaluatViewController *wordVc4 = [[EvaluatViewController alloc] init];
    wordVc4.title = @"待评价";
    [self addChildViewController:wordVc4];
    
    RefundViewController *wordVc5 = [[RefundViewController alloc] init];
    wordVc5.title = @"退款";
    [self addChildViewController:wordVc5];
    
//    [self refreshDisplay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
