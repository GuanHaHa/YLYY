//
//  HotMsgViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/28.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "HotMsgViewController.h"
#import "MsgDetailsViewController.h"

#import "HotTableViewCell.h"

#import "HotModel.h"

@interface HotMsgViewController ()<UITableViewDelegate , UITableViewDataSource>

@property (strong , nonatomic) UITableView *tableView;

@end

@implementation HotMsgViewController {
    int page;
    NSMutableArray *hotArr;
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
    page = 1;
    hotArr = [NSMutableArray array];
    [self getDataFromUrl];
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:self.navTitle textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}


- (void)setUpUI {
    [self addRightButton];
    [self.view addSubview:self.tableView];
}


- (void)setUIAutoLayout {
    
}

- (void)getDataFromUrl {
    NSString *u_id;
    if ([GetUserDefault(isLogin) boolValue] == NO) {
        u_id = @"0";
    }else {
        u_id = GetUserDefault(userID);
    }
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_public/system_hot_list",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"page"    : [NSString stringWithFormat:@"%d",page],
                          @"user_id" : u_id,
                          @"type"    : self.type
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            if (page == 1) {
                [hotArr removeAllObjects];
            }
            [hotArr addObjectsFromArray:[weakSelf dataArray:resultObject[@"obj"]]];
            [weakSelf.tableView reloadData];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

- (NSMutableArray *)dataArray:(NSMutableArray *)param {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in param) {
        HotModel *model = [HotModel arrayWithDic:dic];
        [array addObject:model];
    }
    return array;
}

// 右侧按钮
- (void)addRightButton {
    UIButton *rightBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:@"清空" forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    rightBtn.frame = CGRectMake(0, 0, 44, 44);
    UIBarButtonItem* rightBtnItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    [rightBtn addTarget:self action:@selector(rightButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setRightBarButtonItem:rightBtnItem];
}
- (void)rightButton:(UIButton *)button {
    if (GetUserDefault(userID) == nil) {
        SetUserDefault(@"", userID);
    }
    NSString *typeStr;
    if ([self.type isEqualToString:@"1"]) {
        typeStr = @"1";
    }else {
        typeStr = @"0";
    }
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_public/clear_message",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"user_id" : GetUserDefault(userID),
                          @"type"    : typeStr
                          };
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            [LCProgressHUD showMessage:@"已清空"];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}



#pragma  mark - UITableViewDelegate ,UITableViewDataSource
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return hotArr.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    HotTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HotCell"];
    HotModel *model = hotArr[indexPath.row];
    cell.titleLabel.text = model.mes_title;
    [cell.bigImg sd_setImageWithURL:[NSURL URLWithString:model.mes_pic] placeholderImage:nil];
    cell.contentLabel.text = model.mes_message;
    return cell;
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 310;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.1;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MsgDetailsViewController *vc = [[MsgDetailsViewController alloc] init];
    HotModel *mdel = hotArr[indexPath.row];
    vc.msgId = mdel.mes_id;
    [self.navigationController pushViewController:vc animated:YES];
    
    
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
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-JCNew64) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = UIColorFromRGB(0xf8f8f8);
        _tableView.estimatedRowHeight = 0;
        //        _tableView.bounces = NO;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView . sectionFooterHeight = 1.0;
        [_tableView registerClass:[HotTableViewCell class] forCellReuseIdentifier:@"HotCell"];
        
        [self setRefreshing:_tableView setTarget:self setHeaderAction:@selector(headerRereshingData) setFooterAction:@selector(footerRereshingData)];
    }
    return _tableView;
}
@end
