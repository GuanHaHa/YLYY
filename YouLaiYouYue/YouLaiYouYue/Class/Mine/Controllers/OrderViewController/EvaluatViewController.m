//
//  EvaluatViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/14.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "EvaluatViewController.h"
#import "OrderEvaluateViewController.h"
#import "WXApi.h"

#import "OrderTableViewCell.h"
#import "OneTypeBtnTableViewCell.h"
#import "TwoTypeBtnTableViewCell.h"
#import "ThreeTypeBtnTableViewCell.h"
#import "FourTypeBtnTableViewCell.h"
#import "FiveTypeBtnTableViewCell.h"
#import "SixTypeBtnTableViewCell.h"
#import "SevenTypeBtnTableViewCell.h"

#import "OrderModel.h"
@interface EvaluatViewController ()<UITableViewDelegate , UITableViewDataSource>

@property (strong , nonatomic) UITableView *tableView;

@end

@implementation EvaluatViewController {
    int page;
    NSMutableArray *orderArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.fd_prefersNavigationBarHidden = YES;
    
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
    page = 1;
    orderArray = [NSMutableArray array];
    [self getDataFromUrl];
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:@"模板" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}


- (void)setUpUI {
    [self.view addSubview:self.tableView];
}


- (void)setUIAutoLayout {
    
}

- (void)getDataFromUrl {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_order/my_order",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"page"    : [NSString stringWithFormat:@"%d",page],
                          @"userID"  : GetUserDefault(userID),
                          @"type"    : @"3"
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            if (page == 1) {
                [orderArray removeAllObjects];
            }
            [orderArray addObjectsFromArray:[weakSelf orderDataArray:resultObject[@"obj"]]];
            [weakSelf.tableView reloadData];
        }
        
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

- (NSMutableArray *)orderDataArray:(NSMutableArray *)param {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in param) {
        OrderModel *model = [OrderModel arrayWithDic:dic];
        [array addObject:model];
    }
    return array;
}

#pragma  mark - UITableViewDelegate ,UITableViewDataSource
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 2;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return orderArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    if (indexPath.row == 0) {
        OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderCell"];
        cell.model = orderArray[indexPath.section];
        return cell;
    }else {
        OrderModel *model = orderArray[indexPath.section];
        if ([model.order_type isEqualToString:@"1"]) {
            OneTypeBtnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OneTypeBtnCell"];
            cell.btn2.tag = 100+indexPath.section;
            cell.btn1.tag = 101+indexPath.section;
            [cell.btn2 addTarget:self action:@selector(goPayAction:) forControlEvents:(UIControlEventTouchUpInside)];
            [cell.btn1 addTarget:self action:@selector(cancelAction:) forControlEvents:(UIControlEventTouchUpInside)];
            return cell;
        }
        if ([model.order_type isEqualToString:@"2"]) {
            TwoTypeBtnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TwoTypeBtnCell"];
            cell.btn2.tag = 104+indexPath.section;
            cell.btn1.tag = 101+indexPath.section;
            [cell.btn2 addTarget:self action:@selector(refundAction:) forControlEvents:(UIControlEventTouchUpInside)];
            [cell.btn1 addTarget:self action:@selector(cancelAction:) forControlEvents:(UIControlEventTouchUpInside)];
            return cell;
        }
        if ([model.order_type isEqualToString:@"3"]) {
            ThreeTypeBtnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ThreeTypeBtnCell"];
            cell.btn2.tag = 102+indexPath.section;
            cell.btn1.tag = 103+indexPath.section;
            [cell.btn2 addTarget:self action:@selector(goEvaluateAction:) forControlEvents:(UIControlEventTouchUpInside)];
            [cell.btn1 addTarget:self action:@selector(deleteAction:) forControlEvents:(UIControlEventTouchUpInside)];
            return cell;
        }
        if ([model.order_type isEqualToString:@"4"]) {
            FourTypeBtnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FourTypeBtnCell"];
            cell.btn1.tag = 103+indexPath.section;
            [cell.btn1 addTarget:self action:@selector(deleteAction:) forControlEvents:(UIControlEventTouchUpInside)];
            return cell;
        }
        if ([model.order_type isEqualToString:@"5"]) {
            FiveTypeBtnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FiveTypeBtnCell"];
            cell.btn1.tag = 103+indexPath.section;
            [cell.btn1 addTarget:self action:@selector(deleteAction:) forControlEvents:(UIControlEventTouchUpInside)];
            return cell;
        }
        if ([model.order_type isEqualToString:@"6"]) {
            SixTypeBtnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SixTypeBtnCell"];
            
            return cell;
        }else {
            SevenTypeBtnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SevenTypeBtnCell"];
            cell.btn1.tag = 103+indexPath.section;
            [cell.btn1 addTarget:self action:@selector(deleteAction:) forControlEvents:(UIControlEventTouchUpInside)];
            return cell;
        }
    }
    
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        
        return 185;
    }
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 10;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
}

// 退款
- (void)refundAction:(UIButton *)button {
    NSInteger index = button.tag - 100;
    [LCProgressHUD showMessage:@"请联系客服"];
}
// 付款
- (void)goPayAction:(UIButton *)button {
    NSInteger index = button.tag - 100;
    OrderModel *model = orderArray[index];
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"微信" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了按钮1，进入按钮1的事件");
        [self goPayWX:model.oID];
    }];
    
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"支付宝" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了取消");
    }];
    
    //把action添加到actionSheet里
    [actionSheet addAction:action1];
    [actionSheet addAction:action2];
    [actionSheet addAction:action3];
    
    //相当于之前的[actionSheet show];
    [self presentViewController:actionSheet animated:YES completion:nil];
    
}

// 取消行程
- (void)cancelAction:(UIButton *)button {
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:@"是否要取消活动" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSInteger index = button.tag - 101;
        OrderModel *model = orderArray[index];
        [self cancelFromUrl:model.oID];
        
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [actionSheet addAction:action3];
    [actionSheet addAction:action1];
    [self presentViewController:actionSheet animated:YES completion:nil];
}

// 去评价
- (void)goEvaluateAction:(UIButton *)button {
    NSInteger index = button.tag - 102;
    OrderModel *model = orderArray[index];
    OrderEvaluateViewController *vc = [[OrderEvaluateViewController alloc] init];
    vc.orderId = model.oID;
    vc.type = @"0";
    [self.navigationController pushViewController:vc animated:YES];
    
}

// 删除行程
- (void)deleteAction:(UIButton *)button {
    NSInteger index = button.tag - 103;
    OrderModel *model = orderArray[index];
    [self deleteFromUrl:model.oID];
}

// 取消行程接口
- (void)cancelFromUrl:(NSString *)orderId {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_order/order_out",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key"  : md5Url,
                          @"order_id" : orderId
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            
            [weakSelf getDataFromUrl];
        }
        
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

// 删除行程接口
- (void)deleteFromUrl:(NSString *)orderId {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_order/del_order",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key"  : md5Url,
                          @"order_id" : orderId
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            
            [weakSelf getDataFromUrl];
        }
        
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

- (void)goPayWX:(NSString *)orderId {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_order/go_pay",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key"  : md5Url,
                          @"order_id" : orderId
                          };
    
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            
            [weakSelf goToWx:resultObject[@"obj"]];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

#pragma mark - 调起微信支付
- (void)goToWx:(NSDictionary *)dic {
    //需要创建这个支付对象
    PayReq *req   = [[PayReq alloc] init];
    //由用户微信号和AppID组成的唯一标识，用于校验微信用户
    req.openID = dic[@"appId"];
    
    // 商家id，在注册的时候给的
    req.partnerId = dic[@"partnerId"];
    
    // 预支付订单这个是后台跟微信服务器交互后，微信服务器传给你们服务器的，你们服务器再传给你
    req.prepayId  = dic[@"prepayId"];
    
    // 根据财付通文档填写的数据和签名
    //这个比较特殊，是固定的，只能是即req.package = Sign=WXPay
    req.package   = dic[@"package"];
    
    // 随机编码，为了防止重复的，在后台生成
    req.nonceStr  = dic[@"nonceStr"];
    
    // 这个是时间戳，也是在后台生成的，为了验证支付的
    
    //    NSTimeInterval stamp = [[NSDate date] timeIntervalSince1970] * 1000;
    //    NSString *time = [NSString stringWithFormat:@"%f",stamp];
    //    NSLog(@"%@",time);
    req.timeStamp = [dic[@"timestamp"] intValue];
    
    // 这个签名也是后台做的
    req.sign = dic[@"sign"];
    
    //发送请求到微信，等待微信返回onResp
    [WXApi sendReq:req];
    //所以这里添加一个监听，用来接收是否成功的消息
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(weChatPayResultNoti:) name:@"weixin_pay_result_isSuccessed" object:nil];
    
}

//微信支付付款成功失败
-(void)weChatPayResultNoti:(NSNotification *)noti{
    NSLog(@"%@",noti);
    if ([[noti object] isEqualToString:@"wechat_pay_isSuccessed"]) {
        //在这里填写支付成功之后你要做的事情
        NSLog(@"支付成功!");
        [LCProgressHUD showMessage:@"支付成功"];
        [self getDataFromUrl];
        
    }else{
        NSLog(@"支付失败!");
    }
    //上边添加了监听，这里记得移除
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"weixin_pay_result_isSuccessed" object:nil];
}

#pragma mark - 刷新  加载
- (void)headerRereshingData {
    page = 1;
    [self getDataFromUrl];
    [self.tableView.mj_header endRefreshing];
}

- (void)footerRereshingData {
    page++;
    [self getDataFromUrl];
    [self.tableView.mj_footer endRefreshing];
}




#pragma mark - 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-JCNew64-44) style:UITableViewStyleGrouped];
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
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [_tableView registerClass:[OrderTableViewCell class] forCellReuseIdentifier:@"OrderCell"];
        [_tableView registerClass:[OneTypeBtnTableViewCell class] forCellReuseIdentifier:@"OneTypeBtnCell"];
        [_tableView registerClass:[TwoTypeBtnTableViewCell class] forCellReuseIdentifier:@"TwoTypeBtnCell"];
        [_tableView registerClass:[ThreeTypeBtnTableViewCell class] forCellReuseIdentifier:@"ThreeTypeBtnCell"];
        [_tableView registerClass:[FourTypeBtnTableViewCell class] forCellReuseIdentifier:@"FourTypeBtnCell"];
        [_tableView registerClass:[FiveTypeBtnTableViewCell class] forCellReuseIdentifier:@"FiveTypeBtnCell"];
        [_tableView registerClass:[SixTypeBtnTableViewCell class] forCellReuseIdentifier:@"SixTypeBtnCell"];
        [_tableView registerClass:[SevenTypeBtnTableViewCell class] forCellReuseIdentifier:@"SevenTypeBtnCell"];
        
        [self setRefreshing:_tableView setTarget:self setHeaderAction:@selector(headerRereshingData) setFooterAction:@selector(footerRereshingData)];
        
    }
    return _tableView;
}
@end
