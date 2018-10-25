//
//  JoinActivityViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/27.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "JoinActivityViewController.h"
#import "NIMSessionViewController.h"
#import "OrderEvaluateViewController.h"
#import "PartyViewController.h"

#import "JoinActTableViewCell.h"
#import "StartFunctionTableViewCell.h"

#import "JoinModel.h"

@interface JoinActivityViewController ()<UITableViewDelegate , UITableViewDataSource, StartFunctionCellDelegate>

@property (strong , nonatomic) UITableView *tableView;
@property (strong , nonatomic) UIButton *addBtn;

@end

@implementation JoinActivityViewController {
    int page;//分页
    NSMutableArray *joinArray;
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
    joinArray = [NSMutableArray array];
    [self getDataFromUrl];
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:@"参加的活动" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}


- (void)setUpUI {
    [self.view addSubview:self.tableView];
}


- (void)setUIAutoLayout {
    
}

- (void)getDataFromUrl {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_activity/activity_join",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"user_id"  : GetUserDefault(userID),
                          @"page"    : [NSString stringWithFormat:@"%d",page]
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            if (page == 1) {
                [joinArray removeAllObjects];
            }
            [joinArray addObjectsFromArray:[weakSelf joinDataArray:resultObject[@"obj"]]];
            [weakSelf.tableView reloadData];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

- (NSMutableArray *)joinDataArray:(NSMutableArray *)param {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in param) {
        JoinModel *model = [JoinModel arrayWithDic:dic];
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
    
    return joinArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    if (indexPath.row == 0) {
        
        JoinActTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JoinActCell"];
        cell.model = joinArray[indexPath.section];
        return cell;
    }else {
        StartFunctionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StartFunctionCell"];
        cell.joinModel = joinArray[indexPath.section];
        cell.type = @"1";
        cell.indexSention = indexPath.section;
        cell.delegate = self;
        
        
        return cell;
    }
    
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 180;
    }
    return 55;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.1;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        JoinModel *model = joinArray[indexPath.section];
        PartyViewController *vc = [[PartyViewController alloc] init];
        vc.activityId = model.pfID;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

// 点击 编辑  进入聊天室  取消活动
- (void)selectStartFunctionCell:(NSInteger)index with:(NSInteger)Section{
    if (index == 0) {
        NSLog(@"%ld  %ld",(long)index,(long)Section);
        [self addTeamSection:Section];
    }
    if (index == 1) {
        NSLog(@"%ld  %ld",(long)index,(long)Section);
        JoinModel *model = joinArray[Section];
        if ([model.is_over isEqualToString:@"1"]) {
            NSLog(@"评价");
            OrderEvaluateViewController *vc= [[OrderEvaluateViewController alloc] init];
            vc.orderId = model.ujID;
            vc.type = @"1";
            [self.navigationController pushViewController:vc animated:YES];
        }else {
            NIMSession *session = [NIMSession session:model.wy_accid type:NIMSessionTypeP2P];
//            NIMSessionViewController *vc = [[NIMSessionViewController alloc] initWithSession:session];
            NIMSessionViewController *vc = [[NIMSessionViewController alloc] initWithSession:session];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    if (index == 2) {
        JoinModel *model = joinArray[Section];
        NSLog(@"%ld  %ld",(long)index,(long)Section);
        if ([model.is_over isEqualToString:@"1"]) {
            NSLog(@"删除");
            [self deleteactivity:Section];
        }else {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:nil message:@"请输入理由" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //响应事件
                //得到文本信息
                NSString *str = alert.textFields.lastObject.text;
                NSLog(@"%@",alert.textFields.lastObject.text);
                if (str == nil || [str isEqualToString:@""]) {
                    return ;
                }
                [self cancelActivity:str withSection:Section];
            }];
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            
            [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                textField.placeholder = @"请输入理由";
            }];
            
            [alert addAction:okAction];
            [alert addAction:cancelAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }
}

// 删除
- (void)deleteactivity:(NSInteger )index {
    JoinModel *model = joinArray[index];
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_activity/del_activity",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"type"    : @"1",
                          @"ujID"    : model.ujID
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            [LCProgressHUD showMessage:@"删除成功"];
            [joinArray removeObjectAtIndex:index];
            [weakSelf.tableView reloadData];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

// 进入聊天室接口
- (void)addTeamSection:(NSInteger )index {
    JoinModel *model = joinArray[index];
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_activity/GroupActives",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key"   : md5Url,
                          @"uid"   : GetUserDefault(userID),
                          @"activity_id"      : model.pfID
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            NIMSession *session = [NIMSession session:resultObject[@"obj"][@"roomid"] type:NIMSessionTypeTeam];
            NIMSessionViewController *vc = [[NIMSessionViewController alloc] initWithSession:session];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        [LCProgressHUD showMessage:@"取消失败"];
    }];
}


// 取消活动接口
- (void)cancelActivity:(NSString *)string withSection:(NSInteger )section {
    JoinModel *model = joinArray[section];
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_activity/activity_cancel",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key"   : md5Url,
                          @"user_id"   : GetUserDefault(userID),
                          @"pfID"      : model.pfID,
                          @"info"      : string
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            [LCProgressHUD showMessage:@"取消成功"];
            [joinArray removeObjectAtIndex:section];
            [weakSelf.tableView reloadData];
        }else {
            [LCProgressHUD showMessage:@"取消失败"];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        [LCProgressHUD showMessage:@"取消失败"];
    }];
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
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [_tableView registerClass:[JoinActTableViewCell class] forCellReuseIdentifier:@"JoinActCell"];
        [_tableView registerClass:[StartFunctionTableViewCell class] forCellReuseIdentifier:@"StartFunctionCell"];
        [self setRefreshing:_tableView setTarget:self setHeaderAction:@selector(headerRereshingData) setFooterAction:@selector(footerRereshingData)];
    }
    return _tableView;
}
@end
