//
//  AttentionViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/26.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "AttentionViewController.h"
#import "InviteViewController.h"

#import "AttentionTableViewCell.h"

#import "AttentionModel.h"

@interface AttentionViewController ()<UITableViewDelegate , UITableViewDataSource>

@property (strong , nonatomic) UITableView *tableView;

@end

@implementation AttentionViewController {
    int page;//分页
    NSMutableArray *attentionArray;
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
    attentionArray = [NSMutableArray new];
    [self getDataFromUrl];
}

#pragma mark - Setting UI Methods

- (void)setUI {
   
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:@"我的关注" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}


- (void)setUpUI {
    [self.view addSubview:self.tableView];
}


- (void)setUIAutoLayout {
    
}

- (void)getDataFromUrl {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_user/my_look",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"userID"  : GetUserDefault(userID),
                          @"page"    : [NSString stringWithFormat:@"%d",page]
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            if (page == 1) {
                [attentionArray removeAllObjects];
            }
            [attentionArray addObjectsFromArray:[weakSelf attentionDataArray:resultObject[@"obj"]]];
            [weakSelf.tableView reloadData];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

- (NSMutableArray *) attentionDataArray:(NSMutableArray *)param {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in param) {
        AttentionModel *model = [AttentionModel arrayWithDic:dic];
        [array addObject:model];
    }
    return array;
}


#pragma  mark - UITableViewDelegate ,UITableViewDataSource
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return attentionArray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    AttentionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AttentionCell"];
    cell.model = attentionArray[indexPath.row];
    cell.cancelBtn.tag = 100+indexPath.row;
    [cell.cancelBtn addTarget:self action:@selector(cancelAction:) forControlEvents:(UIControlEventTouchUpInside)];
    cell.otherBtn.tag = 101+indexPath.row;
    [cell.otherBtn addTarget:self action:@selector(otherAction:) forControlEvents:(UIControlEventTouchUpInside)];
    return cell;
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 120;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.1;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
}

// 取消关注
- (void)cancelAction:(UIButton *)button {
    NSInteger index = button.tag - 100;
    AttentionModel *model = attentionArray[index];
    
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_user/attention_captain",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"userID"     : GetUserDefault(userID),
                          @"attention_userID"  : model.likeuserID
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            
            [attentionArray removeObjectAtIndex:index];
            [weakSelf.tableView reloadData];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
    
}

- (void)otherAction:(UIButton *)button {
    NSInteger index = button.tag - 101;
    AttentionModel *model = attentionArray[index];
    if ([model.activity_id isEqualToString:@"0"]) {
        
        InviteViewController *vc = [[InviteViewController alloc] init];
        vc.personId = model.likeuserID;
        [self.navigationController pushViewController:vc animated:YES];
//        if ([model.activity_id isEqualToString:@"0"]) {
//            NSLog(@"已结束");
//            button.userInteractionEnabled = NO;
//        }else {
//            NSLog(@"邀请");
//            [button setTitle:@"邀请他" forState:(UIControlStateNormal)];
//        }
    }else {
//      button.userInteractionEnabled = NO;
        UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"提示" message:@"已参加活动,不能邀请" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击了按钮1，进入按钮1的事件");
        }];
        //把action添加到actionSheet里
        [actionSheet addAction:action1];
        //相当于之前的[actionSheet show];
        [self presentViewController:actionSheet animated:YES completion:nil];
    }
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
        [_tableView registerClass:[AttentionTableViewCell class] forCellReuseIdentifier:@"AttentionCell"];
        [self setRefreshing:_tableView setTarget:self setHeaderAction:@selector(headerRereshingData) setFooterAction:@selector(footerRereshingData)];
    }
    return _tableView;
}

@end
