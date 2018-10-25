//
//  InviteMsgViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/29.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "InviteMsgViewController.h"
#import "SignPayViewController.h"
#import "SignUpViewController.h"

#import "InviteMsgTableViewCell.h"

#import "InviteMsgModel.h"
#import "ActivityModel.h"

@interface InviteMsgViewController ()<UITableViewDelegate , UITableViewDataSource>

@property (strong , nonatomic) UITableView *tableView;

@end

@implementation InviteMsgViewController {
    NSMutableArray *msgArr;
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
    msgArr = [NSMutableArray array];
    [self getDataFromUrl];
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:@"邀请消息" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
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
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_activity/InvitationList",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"uid"     : u_id
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            msgArr = [weakSelf dataArray:resultObject[@"obj"]];
            [weakSelf.tableView reloadData];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
    
}

- (NSMutableArray *)dataArray:(NSMutableArray *)param {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in param) {
        InviteMsgModel *model = [InviteMsgModel arrayWithDic:dic];
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
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_public/clear_message",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"user_id" : GetUserDefault(userID),
                          @"type"    : @"4"
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
    
    return msgArr.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    InviteMsgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InviteMsgCell"];
    cell.model = msgArr[indexPath.row];
    cell.cancelBtn.tag = 100+indexPath.row;
    cell.takeinBtn.tag = 101+indexPath.row;
    [cell.cancelBtn addTarget:self action:@selector(acncelAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [cell.takeinBtn addTarget:self action:@selector(takeinAction:) forControlEvents:(UIControlEventTouchUpInside)];
    return cell;
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    InviteMsgModel *model = msgArr[indexPath.row];
    if ([model.pfcontent isEqualToString:@""]) {
        return 300;
    }
    CGRect rect = [model.pfcontent boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-60, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    return 300+rect.size.height;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.1;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

// 拒绝
- (void)acncelAction:(UIButton *)button {
    NSInteger index = button.tag - 100;
    [self turnDownDataId:index];
}

// 同意
- (void)takeinAction:(UIButton *)button {
    NSInteger index = button.tag - 101;
    InviteMsgModel *inviteModel = msgArr[index];
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_activity/ActivityInfo",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"id"      : inviteModel.tid,
                          @"yqid"    : inviteModel.pfID,
                          @"uid"     : GetUserDefault(userID)
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            ActivityModel *model = [[ActivityModel alloc] init];
            model.pfID = resultObject[@"obj"][@"id"];
            model.truename = resultObject[@"obj"][@"username"];
            model.show_pic = resultObject[@"obj"][@"pic"];
            model.title = resultObject[@"obj"][@"pftitle"];
            model.begin_time = resultObject[@"obj"][@"pfgotime"];
            model.city = resultObject[@"obj"][@"pfaddress"];
            model.peoplesex = resultObject[@"obj"][@"pfpeoplesex"];
            model.age = resultObject[@"obj"][@"pfagebegin"];
            model.marry = resultObject[@"obj"][@"pfmarry"];
            model.price = resultObject[@"obj"][@"pfspend"];
            model.if_pay = resultObject[@"obj"][@"pfspendtype"];
            model.user_tel = resultObject[@"obj"][@"phone"];
            if ([model.if_pay isEqualToString:@"2"]) {
                SignPayViewController *vc = [[SignPayViewController alloc] init];
                vc.model = model;
                vc.type = @"1";
                vc.inviteId = inviteModel.pfID;
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }else {
                SignUpViewController *vc = [[SignUpViewController alloc] init];
                vc.model = model;
                vc.type = @"1";
                vc.inviteId = inviteModel.pfID;
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }
            
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
    
}

// 拒绝接口
- (void)turnDownDataId:(NSInteger )index {
    InviteMsgModel *model = msgArr[index];
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_activity/refuse",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"id"      : model.pfID
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            [msgArr removeObjectAtIndex:index];
            [weakSelf.tableView reloadData];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}


#pragma mark - 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-JCNew64) style:UITableViewStyleGrouped];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = UIColorFromRGB(0xf8f8f8);
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
        [_tableView registerClass:[InviteMsgTableViewCell class] forCellReuseIdentifier:@"InviteMsgCell"];
    }
    return _tableView;
}
@end
