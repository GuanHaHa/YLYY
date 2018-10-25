//
//  SignPayViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/13.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "SignPayViewController.h"
#import "WXApi.h"
#import <AlipaySDK/AlipaySDK.h>

#import "SignUpTableViewCell.h"
#import "AskForTableViewCell.h"
#import "AmountTableViewCell.h"
#import "PayTypeTableViewCell.h"
#import "AnonymityTableViewCell.h"

@interface SignPayViewController ()<UITableViewDelegate , UITableViewDataSource ,SignUpCellTextDelegate>

@property (strong , nonatomic) UITableView *tableView;

@property (strong , nonatomic) UIButton *btn;

@property (strong , nonatomic) UILabel *totalLabel;

@end

@implementation SignPayViewController {
    NSInteger amount;  // 显示的数量
    NSArray *titleArray; // 姓名联系方式数组
    NSArray *askForArr;    // 性别 年龄  是否单身
    NSArray *otherArr;
    NSArray *arr;
    NSArray *imageArray;
    NSArray *paytypeArray;
    NSInteger choosePay;
    CGFloat price;   // 总的价格
    CGFloat unitPrice; // 单价
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
    amount = 1;
    choosePay = 0;
    imageArray = @[@"weixinzhifu",@"zhifubao"];
    paytypeArray = @[@"微信支付",@"支付宝支付"];
    amount = 1;
    titleArray = @[@"姓名:",@"联系方式:"];
    askForArr = @[@"性别要求:",@"年龄要求:",@"是否单身:"];
    otherArr = @[@"费用:",@"支付方式:"];
    arr = @[@"费用:",@"",@"支付方式:"];
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}


- (void)setNavigationBar {
    [self setNavigationBarTitle:@"报名" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}


- (void)setUpUI {
    [self.view addSubview:self.btn];
    [self.view addSubview:self.totalLabel];
    [self.view addSubview:self.tableView];
}


- (void)setUIAutoLayout {
    
    [_totalLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [_totalLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    [_totalLabel autoSetDimension:ALDimensionHeight toSize:50];
    [_totalLabel autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/2];
    
    [_btn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [_btn autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    [_btn autoSetDimension:ALDimensionHeight toSize:50];
    [_btn autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/2];
    
   
}

- (void)getDataFromUrl {
    
}

- (void)setModel:(ActivityModel *)model {
    _model = model;
    _model.noname = @"0";
    unitPrice = [_model.price floatValue];
}

// 结束编辑，键盘就消失
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}


#pragma  mark - UITableViewDelegate ,UITableViewDataSource
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }else if (section == 1) {
        return 5;
    }else if (section == 2){
        if ([self.model.peoplesex isEqualToString:@"无限制"]) {
            return 2;
        }
        return 1;
    }
    
    return 2;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    if (indexPath.section == 0) {
        SignUpTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SignUpCell"];
        cell.type = self.type;
        cell.index = indexPath;
        cell.model = self.model;
        cell.delegate = self;
        cell.titleLabel.text = titleArray[indexPath.row];
        return cell;
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            AskForTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AskForCell"];
            cell.model = self.model;
            return cell;
        }
        if (indexPath.row == 4) {
            AnonymityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AnonymityCell"];
            cell.model = self.model;
            return cell;
            
        }else {
            SignUpTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SignUpCell"];
            cell.type = self.type;
            cell.index = indexPath;
            cell.model = self.model;
            cell.titleLabel.text = askForArr[indexPath.row-1];
            return cell;
        }
    }
    if (indexPath.section == 2) {
        if ([self.model.peoplesex isEqualToString:@"无限制"]) {
            if ([self.type isEqualToString:@"1"]) {
                SignUpTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SignUpCell"];
                cell.type = self.type;
                cell.index = indexPath;
                cell.titleLabel.text = @"费用";
                cell.textField.text = [NSString stringWithFormat:@"%@/人",self.model.price];
                return cell;
            }else {
                if (indexPath.row == 1) {
                    AmountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AmountCell"];
                    cell.amountLabel.text = [NSString stringWithFormat:@"%ld",(long)amount];
                    [cell.addButton addTarget:self action:@selector(addButton:) forControlEvents:UIControlEventTouchUpInside];
                    [cell.subtractButton addTarget:self action:@selector(subtractButton:) forControlEvents:UIControlEventTouchUpInside];
                    return cell;
                }
                SignUpTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SignUpCell"];
                cell.type = self.type;
                cell.index = indexPath;
                cell.textField.text = [NSString stringWithFormat:@"%@/人",self.model.price];
                cell.titleLabel.text = @"费用:";
                return cell;
            }
        }else {
            SignUpTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SignUpCell"];
            cell.type = self.type;
            cell.index = indexPath;
            cell.titleLabel.text = @"费用";
            cell.textField.text = [NSString stringWithFormat:@"%@/人",self.model.price];
            return cell;
        }
    }else {
        PayTypeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PayTypeCell"];
        cell.titleImage.image = [UIImage imageNamed:imageArray[indexPath.row]];
        cell.titleLabel.text = paytypeArray[indexPath.row];
        if (choosePay == indexPath.row) {
            [cell setIsSelectImg:YES];
        }else {
            [cell setIsSelectImg:NO];
        }
        return cell;
    }

}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1 && indexPath.row == 0) {
        return 150;
    }
    if (indexPath.section == 1 && indexPath.row == 4) {
        return 55;
    }
    return 45;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.1;
    }
    return 10;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.view endEditing:YES];
    if (indexPath.section == 3) {
        if (indexPath.row == 0) {
            choosePay = 0;
            [self.tableView reloadData];
        }else {
            choosePay = 1;
            [self.tableView reloadData];
        }
    }
    if (indexPath.section == 1 && indexPath.row == 4) {
        UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            _model.noname = @"1";
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:4 inSection:1];
            //2.将indexPath添加到数组
            NSArray <NSIndexPath *> *indexPathArray = @[indexPath];
            //3.传入数组，对当前cell进行刷新
            [tableView reloadRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationNone];

            
        }];
        UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            _model.noname = @"0";
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:4 inSection:1];
            //2.将indexPath添加到数组
            NSArray <NSIndexPath *> *indexPathArray = @[indexPath];
            //3.传入数组，对当前cell进行刷新
            [tableView reloadRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationNone];
        }];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击了取消");
        }];
        [actionSheet addAction:action1];
        [actionSheet addAction:action2];
        [actionSheet addAction:action3];
        [self presentViewController:actionSheet animated:YES completion:nil];
    }
    
    
}

- (void)changeTextView:(NSString *)text {
    self.model.user_tel = text;
}

#pragma mark - 加减数量的按钮
- (void)addButton:(UIButton *)button {
    amount++;
    price = unitPrice *amount;
    NSString *numberStr = [NSString stringWithFormat:@" %0.2f",price];
    [_totalLabel setAttributedText:[self attrStrFrom:[NSString stringWithFormat:@"合计金额: %0.2f",price] numberStr:numberStr]];
    [self.tableView reloadData];
    
}
- (void)subtractButton:(UIButton *)button {
    if (amount > 1) {
        amount--;
        price = price-unitPrice;
        NSString *numberStr = [NSString stringWithFormat:@" %0.2f",price];
        [_totalLabel setAttributedText:[self attrStrFrom:[NSString stringWithFormat:@"合计金额: %0.2f",price] numberStr:numberStr]];
        [self.tableView reloadData];
    }
    
}


// 支付按钮
- (void)payAction {
    if (self.model.user_tel == nil || [self.model.user_tel isEqualToString:@""]) {
        [LCProgressHUD showMessage:@"请填写联系电话"];
        return;
    }
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_order/user_join",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"user_id" : GetUserDefault(userID),
                          @"num"     : [NSString stringWithFormat:@"%ld",amount],
                          @"pfid"    : _model.pfID,
                          @"need_paytype" : [NSString stringWithFormat:@"%ld",(long)choosePay],
                          @"phone"   : _model.user_tel,
                          @"id"      : self.inviteId,
                          @"noname"  : _model.noname
                        };
    
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            
            [weakSelf goToWx:resultObject[@"obj"]];
        }
        
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        if ([resultObject[@"code"] integerValue] == 300) {
            
            [weakSelf goAliPay:resultObject[@"obj"]];
        }else {
            [LCProgressHUD showMessage:resultObject[@"message"]];
        }
        
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
        [LCProgressHUD showMessage:@"报名成功"];
        [self.navigationController popViewControllerAnimated:YES];
        
    }else{
        NSLog(@"支付失败!");
    }
    //上边添加了监听，这里记得移除
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"weixin_pay_result_isSuccessed" object:nil];
}

#pragma mark - 调起支付宝支付
- (void)goAliPay:(NSString *)signature {
    NSString *scheme = @"YouLaiYouYueAlipay";

    [[AlipaySDK defaultService] payOrder:signature fromScheme:scheme callback:^(NSDictionary *resultDic){
        NSString *resultStatus = resultDic[@"resultStatus"];
        NSString *errStr = resultDic[@"memo"];
        //         提取支付结果字符串
        NSDictionary *returnDic =  [self stringToJson:resultDic[@"result"]];
        
        NSDictionary *dataDic = returnDic[@"alipay_trade_app_pay_response"];
        
        
        NSLog(@"支付码:%@",dataDic[@"code"]);
        NSLog(@"支付结果:%@",dataDic[@"msg"]);
        NSLog(@"支付appid:%@",dataDic[@"sub_msg"]);
        NSLog(@"支付授权auth_app_id:%@",dataDic[@"auth_app_id"]);
        NSLog(@"支付时间:%@",dataDic[@"timestamp"]);
        NSLog(@"支付费用:%@",dataDic[@"total_amount"]);
        NSLog(@"支付交易码trade_no:%@",dataDic[@"trade_no"]);
        NSLog(@"支付编号:%@",dataDic[@"out_trade_no"]);
        NSLog(@"支付seller_id:%@",dataDic[@"seller_id"]);
        switch (resultStatus.integerValue) {
            case 9000:// 成功
            {
                [LCProgressHUD showMessage:@"支付成功"];
            }
                break;
            case 6001:// 取消
                NSLog(@"+++++++取消a");
                break;
            default:
                // 失败
                NSLog(@"+++++++失败");
                break;
        }
        
        
    }];
    
}
#pragma mark - 处理支付宝支付结果  (字符串转json)
- (NSDictionary *)stringToJson:(NSString *)str
{
    
    NSString *requestTmp = [NSString stringWithString: str];
    
    NSData *resData = [[NSData alloc] initWithData:[requestTmp dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
    return resultDic;
}


#pragma mark - 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-JCNew64-50) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.estimatedRowHeight = 0;
        //        _tableView.backgroundColor = [UIColor whiteColor];
        //        _tableView.bounces = NO;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView . sectionFooterHeight = 1.0;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [_tableView registerClass:[SignUpTableViewCell class] forCellReuseIdentifier:@"SignUpCell"];
        [_tableView registerClass:[AskForTableViewCell class] forCellReuseIdentifier:@"AskForCell"];
        [_tableView registerClass:[PayTypeTableViewCell class] forCellReuseIdentifier:@"PayTypeCell"];
        [_tableView registerClass:[AmountTableViewCell class] forCellReuseIdentifier:@"AmountCell"];
        [_tableView registerClass:[AnonymityTableViewCell class] forCellReuseIdentifier:@"AnonymityCell"];
    }
    return _tableView;
}
- (UIButton *)btn {
    if (!_btn) {
        _btn = [[UIButton alloc] initForAutoLayout];
        [_btn setBackgroundColor:UIColorFromRGB(0xff9d00)];
        [_btn setTitle:@"支付" forState:UIControlStateNormal];
        [_btn setTitle:@"支付" forState:UIControlStateSelected];
        [_btn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _btn.titleLabel.font = [UIFont systemFontOfSize:14];
        //        _btn.layer.cornerRadius = 6;
        //        [_btn.layer setMasksToBounds:YES];
        [_btn addTarget:self action:@selector(payAction) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _btn;
}
- (UILabel *)totalLabel {
    if (!_totalLabel) {
        _totalLabel = [[UILabel alloc] initForAutoLayout];
        _totalLabel.font = [UIFont systemFontOfSize:15];
        _totalLabel.textColor = UIColorFromRGB(0x333333);
        _totalLabel.textAlignment = NSTextAlignmentCenter;
        _totalLabel.text = [NSString stringWithFormat:@"合计金额:%0.2f",unitPrice];
        
        
        NSString *numberStr = [NSString stringWithFormat:@" %0.2f",unitPrice];
        [_totalLabel setAttributedText:[self attrStrFrom:[NSString stringWithFormat:@"合计金额: %0.2f",unitPrice] numberStr:numberStr]];
        
    }
    return _totalLabel;
}


- (NSMutableAttributedString *)attrStrFrom:(NSString *)titleStr numberStr:(NSString *)numberStr
{
    NSMutableAttributedString *arrString = [[NSMutableAttributedString alloc]initWithString:titleStr];
    // 设置前面几个字串的格式:红色 13.0f字号
    [arrString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.0f],NSForegroundColorAttributeName:[UIColor redColor]}range:[titleStr rangeOfString:numberStr]];
    
    return arrString;
}

@end
