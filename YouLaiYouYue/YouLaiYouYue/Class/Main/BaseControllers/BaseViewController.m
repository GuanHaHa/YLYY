//
//  BaseViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/16.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "BaseViewController.h"
#import "NoContentView.h"
#import<CommonCrypto/CommonDigest.h>
#import "SwpRequest.h"
@interface BaseViewController ()
{
    NoContentView *_noContentView;
}
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self settingBaseViewControllerProperty];
    NSArray*arrController =self.navigationController.viewControllers;
    
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    if (arrController.count > 1) {
        [self setBackButton];
    };
    
}

/*!
 
 *  @brief  将要加载出视图 调用
 *
 */
- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(0x0c0c0c);
    
}

/*!
 
 *  @brief  视图 显示 窗口时 调用
 *
 */
- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}


/*!
 
 *  @brief 视图  即将消失、被覆盖或是隐藏时调用
 *
 */
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // Do any additional setup after loading the view.
    
}

/*!
 
 *  @brief  视图已经消失、被覆盖或是隐藏时调用
 *
 */
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}

/*!
 
 *  @brief  内存不足时 调用
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*!
 
 *  @brief  当前 控制器 被销毁时 调用
 */
- (void)dealloc {
    NSLog(@"%s", __FUNCTION__);
}

- (void)setRefreshing:(UIScrollView *)scrollView setTarget:(id)target setHeaderAction:(SEL)headerAction setFooterAction:(SEL)footerAction {
    
    // 设置 头部刷新组件
    if (headerAction != nil) scrollView.mj_header = [self setRefreshLabelHeader:target headerAction:headerAction];
    
    // 设置 尾部加载组件
    if (footerAction != nil) scrollView.mj_footer = [self setRefreshLabelFooter:target footerAction:footerAction footerTitle:@""];
}


- (MJRefreshNormalHeader *)setRefreshLabelHeader:(id)target headerAction:(SEL)headerAction {
    MJRefreshNormalHeader *header    = [MJRefreshNormalHeader headerWithRefreshingTarget:target refreshingAction:headerAction];
    header.stateLabel.font           = [UIFont systemFontOfSize:12];
    header.lastUpdatedTimeLabel.font = [UIFont systemFontOfSize:12];
    [header setTitle:@"努力刷新中..." forState:MJRefreshStateRefreshing];
    return header;
}


- (MJRefreshBackNormalFooter *)setRefreshLabelFooter:(id)target footerAction:(SEL)footerAction footerTitle:(NSString *)footerTitle {
    MJRefreshBackNormalFooter *footer=[MJRefreshBackNormalFooter footerWithRefreshingTarget:target refreshingAction:footerAction];
    //    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:target refreshingAction:footerAction];
    //    footer.automaticallyRefresh       = NO;
    footer.automaticallyHidden        = NO;
    // 设置字体
    footer.stateLabel.font            = [UIFont systemFontOfSize:12];
    
    [footer setTitle:footerTitle == nil ? @"努力加载中...": footerTitle  forState:MJRefreshStateRefreshing];
    [footer setTitle:footerTitle == nil ? @"没有更多数据..." : @"" forState:MJRefreshStateNoMoreData];
    
    return footer;
}

#pragma mark - Setting BaseViewController Property

/*!
 
 *  @brief  设置 BaseViewController 自身的属性
 */
- (void)settingBaseViewControllerProperty {
    
    self.edgesForExtendedLayout                                         = UIRectEdgeNone;
    self.view.backgroundColor                                           = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem                               = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationBarTitleSize                                         = 17;
    self.navigationController.navigationBar.barTintColor = UIColorFromRGB(0x0c0c0c);
    self.navigationController.fd_fullscreenPopGestureRecognizer.enabled = YES;
}

/*!
 
 *  @brief  setBaseViewBackgroundColor: ( 设置父类背景颜色 )
 *
 *  @param baseViewBackgroundColor
 */
- (void)setBaseViewBackgroundColor:(UIColor *)baseViewBackgroundColor {
    _baseViewBackgroundColor  = baseViewBackgroundColor;
    self.view.backgroundColor = _baseViewBackgroundColor;
}

/*!
 
 *  @brief  setNavigationBarTitleSize: ( 设置 setNavigationBarTitleSize )
 *
 *  @param  navigationBarTitleSize
 */
- (void)setNavigationBarTitleSize:(CGFloat)navigationBarTitleSize {
    _navigationBarTitleSize = navigationBarTitleSize;
}


#pragma mark - Setting NavigationBar Title & TitleFontSize Method
/*!
 
 *  @brief  setNavigationBarTitle:textColor:titleFontSize:  （ 设置 导航控制器 显示 文字 颜色 字体 小大 )
 *
 *  @param  title     标题名称
 *
 *  @param  textColot 文字 颜色 (nil 默认 显示黑色)
 *
 *  @param  fontSize  文字大小  NSNumber type
 */
- (void)setNavigationBarTitle:(NSString *)title textColor:(UIColor *)textColot titleFontSize:(NSNumber *)fontSize {
    //自定义标题
    UILabel* titleLabel           = [[UILabel alloc] initWithFrame:CGRectMake(0, 0 , 100, 44)];
    titleLabel.font               = [UIFont systemFontOfSize:fontSize == nil ? self.navigationBarTitleSize : fontSize.floatValue];
    titleLabel.backgroundColor    = nil;
    //设置Label背景透明
    titleLabel.textColor          = textColot == nil ?  [UIColor whiteColor] : textColot;
    //设置文本颜色
    titleLabel.textAlignment      = NSTextAlignmentCenter;
    titleLabel.opaque             = NO;
    titleLabel.text               = title == nil ? @"" : title;
    //设置标题
    self.navigationItem.titleView = titleLabel;
}

#pragma mark - 设置返回按钮
/**
 *  设置返回按钮
 */
- (void) setBackButton {
    UIButton* leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame     = CGRectMake(0, 0, 44, 44);
    [leftButton setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateSelected];
    [leftButton addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    leftButton.imageEdgeInsets            = UIEdgeInsetsMake(0, -30, 0, 0);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
}

- (void)popViewController {
    //    [self resignFirstResponder];
    
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 *  返回 状态栏字体样式
 *
 *  @return 返回黑色
 */
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

/**
 展示无数据占位图
 
 @param emptyViewType 无数据占位图的类型
 */
- (void)showEmptyViewWithType:(NSInteger)emptyViewType{
    
    // 如果已经展示无数据占位图，先移除
    if (_noContentView) {
        [_noContentView removeFromSuperview];
        _noContentView = nil;
    }
    
    //------- 再创建 -------//
    _noContentView = [[NoContentView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:_noContentView];
    _noContentView.type = emptyViewType;
    
    //------- 添加单击手势 -------//
    [_noContentView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(noContentViewDidTaped:)]];
}

/* 移除无数据占位图 */
- (void)removeEmptyView{
    [_noContentView removeFromSuperview];
    _noContentView = nil;
}

// 无数据占位图点击
- (void)noContentViewDidTaped:(NoContentView *)noContentView{
    if (self.noContentViewTapedBlock)
    {
        self.noContentViewTapedBlock();//调用回调函数
    }
}

-(NSString *)MD5ForLower32Bate:(NSString *)str{
    
    //要进行UTF8的转码
    const char* input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    
    return [self twoMD5ForLower32Bate:digest];
}


-(NSString *)twoMD5ForLower32Bate:(NSString *)str{
    
    //要进行UTF8的转码
    const char* input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    
    return digest;
}

#pragma mark - Init Data Methods
- (SwpNetworkModel *)swpNetwork {
    if (!_swpNetwork) {
        _swpNetwork                   = [SwpNetworkModel shareInstance];
        _swpNetwork.swpNetworkEncrypt = YES;
    }
    return _swpNetwork;
}

@end
