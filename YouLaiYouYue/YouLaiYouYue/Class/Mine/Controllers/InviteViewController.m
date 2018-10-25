//
//  InviteViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/29.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "InviteViewController.h"
#import "LDYSelectivityAlertView.h"

#import "InviteTitleTableViewCell.h"
#import "CostTypeTableViewCell.h"
#import "NewContentTableViewCell.h"

#import "TitleModel.h"

@interface InviteViewController ()<UITableViewDelegate ,UITableViewDataSource,LDYSelectivityAlertViewDelegate,NewContentCellDelegate>

@property (strong , nonatomic) UITableView *tableView;

@end

@implementation InviteViewController {
    NSArray *titleArr;
    NSArray *costArr;
    NSString *tagStr;
    NSString *tagID;
    NSInteger index;
    NSInteger choosePay;
    NSString *stateStr;
    NSString *typeString;
    
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
    tagStr = @"";
    stateStr = @"";
    tagID = @"";
    index = 0;
    choosePay = 3;
    costArr = @[@"我请客",@"自费"];
    titleArr = [NSArray new];
    [self getDataFromUrl];
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:@"邀请好友" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}


- (void)setUpUI {
    [self addRightButton];
    [self.view addSubview:self.tableView];
}


- (void)setUIAutoLayout {
    
}

// 右侧按钮
- (void)addRightButton {
    UIButton *rightBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:@"确定" forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    rightBtn.frame = CGRectMake(0, 0, 44, 44);
    UIBarButtonItem* rightBtnItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    [rightBtn addTarget:self action:@selector(rightButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setRightBarButtonItem:rightBtnItem];
}

- (void)rightButton:(UIButton *)button {
    
    if ([tagID isEqualToString:@""]) {
        [LCProgressHUD showMessage:@"请选择活动"];
        return;
    }
    if ([typeString isEqualToString:@"0"]) {
        choosePay = 3;
    }
    
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_activity/Invitation",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"uid"     : GetUserDefault(userID),
                          @"bid"     : self.personId,
                          @"tid"     : tagID,
                          @"type"    : [NSString stringWithFormat:@"%ld",(long)choosePay],
                          @"text"    : stateStr
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            [LCProgressHUD showMessage:@"邀请成功"];
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

- (void)getDataFromUrl {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_activity/ActivityList",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"uid"     : GetUserDefault(userID)
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            titleArr = [weakSelf dataArray:resultObject[@"obj"]];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

- (NSMutableArray *)dataArray:(NSMutableArray *)param {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in param) {
        TitleModel *model = [TitleModel arrayWithDic:dic];
        [array addObject:model];
    }
    return array;
}

#pragma  mark - UITableViewDelegate ,UITableViewDataSource
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1) {
        
        return index;
    }
    
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    if (indexPath.section == 0) {
        InviteTitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InviteTitleCell"];
        cell.label.text = tagStr;
        return cell;
    }
    if (indexPath.section == 1) {
        CostTypeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CostTypeCell"];
        cell.titleLabel.text = costArr[indexPath.row];
        if (choosePay == 0) {
            [cell setIsSelectImg:YES];
        }else {
            [cell setIsSelectImg:NO];
        }
        return cell;
    }
    NewContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewContentCell"];
    cell.delegate = self;
    return cell;
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2) {
        
        return 180;
    }
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.1;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        if (titleArr.count == 0) {
            [LCProgressHUD showMessage:@"暂无标签"];
            return;
        }
        LDYSelectivityAlertView *ldySAV = [[LDYSelectivityAlertView alloc]initWithTitle:@"标签" datas:titleArr ifSupportMultiple:NO];
        ldySAV.type = 3;
        ldySAV.delegate = self;
        [ldySAV show];
    }
    if (indexPath.section == 1) {
        if (choosePay == 0) {
            choosePay = 1;
            [self.tableView reloadData];
            
        }else {
            choosePay = 0;
            [self.tableView reloadData];
        }
//        if (indexPath.row == 0) {
//            choosePay = 0;
//            [self.tableView reloadData];
//        }else {
//            choosePay = 1;
//            [self.tableView reloadData];
//        }
    }
    
    
}
#pragma mark - 标签  与 活动 返回数据代理
- (void)singleChoiceBlockData:(NSString *)data withDataID:(NSString *)dataID withType:(NSString *)typeStr {
    tagStr = data;
    tagID = dataID;
    typeString = typeStr;
    if ([typeString isEqualToString:@"0"]) {
//        NSIndexPath *inde = [NSIndexPath indexPathForRow:0 inSection:0];
//        [self.tableView reloadRowsAtIndexPaths:@[inde] withRowAnimation:UITableViewRowAnimationNone];
        index = 0;
        choosePay = 3;
        [self.tableView reloadData];
    }else {
        choosePay = 1;
        index = 1;
        [self.tableView reloadData];
    }
}

-(void)multipleChoiceBlockDatas:(NSArray *)datas{
    
}

- (void)changeTextView:(NSString *)text {
    stateStr = text;
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
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [_tableView registerClass:[InviteTitleTableViewCell class] forCellReuseIdentifier:@"InviteTitleCell"];
        [_tableView registerClass:[CostTypeTableViewCell class] forCellReuseIdentifier:@"CostTypeCell"];
        [_tableView registerClass:[NewContentTableViewCell class] forCellReuseIdentifier:@"NewContentCell"];
    }
    return _tableView;
}

@end
