//
//  FriendMsgViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/30.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "FriendMsgViewController.h"
#import "PageViewController.h"

#import "HomeFriendTableViewCell.h"

#import "FriendMsgModel.h"

@interface FriendMsgViewController ()<UITableViewDelegate ,UITableViewDataSource>

@property (strong , nonatomic) UITableView *tableView;

@end

@implementation FriendMsgViewController {
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
    [self setNavigationBarTitle:@"好友消息" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
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
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_user/FriendsList",baseUrl];
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
        FriendMsgModel *model = [FriendMsgModel arrayWithDic:dic];
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
                          @"type"    : @"3"
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
    HomeFriendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeFriendCell"];
    cell.model = msgArr[indexPath.row];
    cell.cancelBtn.tag = 100+indexPath.row;
    cell.takeinBtn.tag = 101+indexPath.row;
    [cell.cancelBtn addTarget:self action:@selector(acncelAction:) forControlEvents:(UIControlEventTouchUpInside)];
    [cell.takeinBtn addTarget:self action:@selector(takeinAction:) forControlEvents:(UIControlEventTouchUpInside)];
    cell.headImg.tag = 101 + indexPath.row;
    UITapGestureRecognizer * tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headImageViewClick:)];
    tap.numberOfTouchesRequired = 1; //手指数
    tap.numberOfTapsRequired = 1; //tap次数
    cell.headImg.contentMode = UIViewContentModeScaleToFill;
    [cell.headImg addGestureRecognizer:tap];
    return cell;
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.1;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

// 点击头像跳转个人主页
- (void)headImageViewClick:(UITapGestureRecognizer *)tap {
    HomeFriendTableViewCell *cell = (HomeFriendTableViewCell *) [tap.view.superview superview];
    NSInteger index = cell.headImg.tag - 101;
    PageViewController *vc = [[PageViewController alloc] init];
    FriendMsgModel *model = msgArr[index];
    vc.u_id = model.userfID;
    [self.navigationController pushViewController:vc animated:YES];
    NSLog(@"%ld",(long)index);
    
}


// 拒绝
- (void)acncelAction:(UIButton *)button {
    button.enabled = NO;
    [self performSelector:@selector(changeButtonStatus:) withObject:button afterDelay:2.0f];//防止重复点击
    NSInteger index = button.tag - 100;
    [self turnDownDataId:index withType:@"1"];
}

// 同意
- (void)takeinAction:(UIButton *)button {
    button.enabled = NO;
    [self performSelector:@selector(changeButtonStatus:) withObject:button afterDelay:2.0f];//防止重复点击
    NSInteger index = button.tag - 101;
    [self turnDownDataId:index withType:@"0"];
}

-(void)changeButtonStatus:(UIButton *)button{
    button.enabled =YES;
}

// 同意 拒绝接口
- (void)turnDownDataId:(NSInteger )index withType:(NSString *)type{
    FriendMsgModel *model = msgArr[index];
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_user/AssentRequestFriends",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"id"      : model.fID,
                          @"type"    : type
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
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView . sectionFooterHeight = 1.0;
        [_tableView registerClass:[HomeFriendTableViewCell class] forCellReuseIdentifier:@"HomeFriendCell"];
    }
    return _tableView;
}
@end
