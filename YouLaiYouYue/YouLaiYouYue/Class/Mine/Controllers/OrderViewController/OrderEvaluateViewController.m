//
//  OrderEvaluateViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/21.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "OrderEvaluateViewController.h"

#import "OrderDetailsTableViewCell.h"
#import "OrderEvaluateTableViewCell.h"

#import "OrderDetailsModel.h"

@interface OrderEvaluateViewController ()<UITableViewDelegate , UITableViewDataSource ,OrderEvaluateCellDelegate>

@property (strong , nonatomic) UITableView *tableView;

@property (strong , nonatomic) OrderDetailsModel *model;

@end

@implementation OrderEvaluateViewController {
    NSString *evaluateStr;
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
    [self getDataFromUrl];
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:@"订单详情" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}


- (void)setUpUI {
    [self addRightButton];
    [self.view addSubview:self.tableView];
}


- (void)setUIAutoLayout {
    
}

- (void)getDataFromUrl {
    NSString *url;
    NSDictionary *dic;
    if ([self.type isEqualToString:@"0"]) {
        // 订单中评价获取信息
        url = [NSString stringWithFormat:@"%@index.php/action/ac_order/order_detail",baseUrl];
        NSString *md5Url = [self MD5ForLower32Bate:url];
        dic = @{
                @"app_key"  : md5Url,
                @"order_id" : self.orderId
                };
    }else {
        // 参加活动中评价获取信息
        url = [NSString stringWithFormat:@"%@index.php/action/ac_activity/get_join_comment",baseUrl];
        NSString *md5Url = [self MD5ForLower32Bate:url];
        dic = @{
                @"app_key"  : md5Url,
                @"ujID"     : self.orderId
                };
    }
    
    
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            _model = [OrderDetailsModel arrayWithDic:resultObject[@"obj"]];
            [weakSelf.tableView reloadData];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

// 右侧按钮
- (void)addRightButton {
    UIButton *rightBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:@"提交" forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    rightBtn.frame = CGRectMake(0, 0, 44, 44);
    UIBarButtonItem* rightBtnItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    [rightBtn addTarget:self action:@selector(rightButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setRightBarButtonItem:rightBtnItem];
}

- (void)rightButton:(UIButton *)button {
    [self.view endEditing:YES];
    if (evaluateStr == nil || [evaluateStr isEqualToString:@""]) {
        [LCProgressHUD showMessage:@"请填写评价内容"];
        return;
    }
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_activity/activityReviews",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic;
    if ([self.type isEqualToString:@"0"]) {
        dic = @{
                @"app_key" : md5Url,
                @"userID"  : GetUserDefault(userID),
                @"order_id": self.orderId,
                @"content" : evaluateStr,
                @"type"    : self.type
                };
    }else {
        dic = @{
                @"app_key" : md5Url,
                @"userID"  : GetUserDefault(userID),
                @"ujID"    : self.orderId,
                @"content" : evaluateStr,
                @"type"    : self.type
                };
    }
    
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            [LCProgressHUD showMessage:@"评价成功"];
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

#pragma  mark - UITableViewDelegate ,UITableViewDataSource
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 2;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        OrderDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderDetailCell"];
        cell.model = _model;
        return cell;
    }
    
    OrderEvaluateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderEvaluateCell"];
    cell.delegate = self;
    return cell;
    
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        return 120;
    }
    return 185;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.1;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.view endEditing:YES];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}
// textView
- (void)orderEvaluateChangeTextView:(NSString *)text {
    
    evaluateStr = text;
}

#pragma mark - 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-JCNew64) style:UITableViewStyleGrouped];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.estimatedRowHeight = 0;
        //        _tableView.bounces = NO;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        //        _mineTableView.backgroundColor = [UIColor blackColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView . sectionFooterHeight = 1.0;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [_tableView registerClass:[OrderDetailsTableViewCell class] forCellReuseIdentifier:@"OrderDetailCell"];
        [_tableView registerClass:[OrderEvaluateTableViewCell class] forCellReuseIdentifier:@"OrderEvaluateCell"];
    }
    return _tableView;
}


@end
