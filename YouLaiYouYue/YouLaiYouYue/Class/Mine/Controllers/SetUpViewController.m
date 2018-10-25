//
//  SetUpViewController.m
//  YouLaiYouYue
//
//  Created by 张强 on 2018/7/25.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "SetUpViewController.h"
#import "FeedbackViewController.h"
#import "ProtocolViewController.h"

#import "SetUpTableViewCell.h"

@interface SetUpViewController ()<UITableViewDelegate , UITableViewDataSource>

@property (strong , nonatomic) UITableView *tableView;
@property (strong , nonatomic) UIButton *logoutBtn;

@end

@implementation SetUpViewController {
    NSArray *nameArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.fd_prefersNavigationBarHidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
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
    nameArr = @[@"意见反馈",@"清除缓存",@"用户协议"];
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:@"设置" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}


- (void)setUpUI {
    [self.view addSubview:self.tableView];
    if ([GetUserDefault(isLogin) boolValue] == YES) {
        [self.view addSubview:self.logoutBtn];
    }
    
    
}


- (void)setUIAutoLayout {
    
    [_logoutBtn autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
    [_logoutBtn autoSetDimension:ALDimensionHeight toSize:50];
    
}

- (void)getDataFromUrl {
    
}



#pragma  mark - UITableViewDelegate ,UITableViewDataSource
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 3;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    SetUpTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SetUpCell"];
    cell.titleLabel.text = nameArr[indexPath.row];
    return cell;
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.1;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        FeedbackViewController *vc = [[FeedbackViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.row == 1) {
        // 清除缓存
        [self clearCache];
    }
    if (indexPath.row == 2) {
        ProtocolViewController *vc = [[ProtocolViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
    
}

// 清除缓存
- (void)clearCache{
    float cacheSize = (float)[[SDImageCache sharedImageCache] getSize]/1024/1024;
    NSString *imgCache = [NSString stringWithFormat:@"%@%0.2fM", @"本次将清理",cacheSize];
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"提示" message:imgCache preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了按钮1，进入按钮1的事件");
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[SDImageCache sharedImageCache] clearMemory];
    }];
    
    
    
    //把action添加到actionSheet里
    [actionSheet addAction:action1];
    [actionSheet addAction:action3];
    
    //相当于之前的[actionSheet show];
    [self presentViewController:actionSheet animated:YES completion:nil];
    
    
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:imgCache delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//    alertView.tag = 1;
//    [alertView show];
}

//  注销登录
- (void)logoutAction {
    SetUserDefault(@"", userID);
    SetUserDefault(@"NO", isLogin);
    SetUserDefault(@"", wy_aid);
    SetUserDefault(@"", wy_password);
    [LCProgressHUD showMessage:@"注销成功"];
        
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"Logout" object:nil];
    }];
    
   
    
    
    
    
    
}

#pragma mark - 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-TabBarH) style:UITableViewStyleGrouped];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.estimatedRowHeight = 0;
        //        _tableView.bounces = NO;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView . sectionFooterHeight = 1.0;
        [_tableView registerClass:[SetUpTableViewCell class] forCellReuseIdentifier:@"SetUpCell"];
    }
    return _tableView;
}

- (UIButton *)logoutBtn {
    if (!_logoutBtn) {
        _logoutBtn = [[UIButton alloc] initForAutoLayout];
        [_logoutBtn setBackgroundColor:UIColorFromRGB(0xff9d00)];
        [_logoutBtn setTitle:@"注销登录" forState:UIControlStateNormal];
        [_logoutBtn setTitle:@"注销登录" forState:UIControlStateSelected];
        [_logoutBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _logoutBtn.titleLabel.font = [UIFont systemFontOfSize:14];
//        _logoutBtn.layer.cornerRadius = 6;
//        [_logoutBtn.layer setMasksToBounds:YES];
        [_logoutBtn addTarget:self action:@selector(logoutAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _logoutBtn;
}


@end
