//
//  BaseViewController.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/16.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController+Net.h"
#import "SwpNetworkModel.h"
@interface BaseViewController : UIViewController



/*! 网路数据信息参数                   !*/
@property (nonatomic, strong) SwpNetworkModel *swpNetwork;
/*! 设置 背景颜色                     !*/
@property (nonatomic, strong) UIColor         * _Nullable baseViewBackgroundColor;
/*! navigationBarTitleSize 文字大小  !*/
@property (nonatomic, assign) CGFloat         navigationBarTitleSize;
// 无数据占位图点击的回调函数
@property (copy,nonatomic) void(^   _Nullable noContentViewTapedBlock)(void);

/**
 展示无数据占位图
 
 @param emptyViewType 无数据占位图的类型
 */
- (void)showEmptyViewWithType:(NSInteger)emptyViewType;

/* 移除无数据占位图 */
- (void)removeEmptyView;

- (void)setBackButton;

-(NSString *)MD5ForLower32Bate:(NSString *)str;

- (void)setNavigationBarTitle:(nullable NSString *)title textColor:(nullable UIColor *)textColot titleFontSize:(nullable NSNumber *)fontSize;

- (void)setBaseViewBackgroundColor:(UIColor * _Nullable)baseViewBackgroundColor;


- (void)setNavigationBarTitleSize:(CGFloat)navigationBarTitleSize;

- (void)setRefreshing:(UIScrollView *_Nullable)scrollView setTarget:(id   _Nonnull )target setHeaderAction:(SEL _Nonnull )headerAction setFooterAction:(SEL _Nonnull )footerAction;



@end

