//
//  EditRemViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/24.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "EditRemViewController.h"
#import "EditFriengViewController.h"
#import "EditInsertViewController.h"
#import "ReplenishViewController.h"
#import "InsertTextViewController.h"

#import "EditRemTableViewCell.h"
#import "EditRemInsterTableViewCell.h"

#import "MyRemModel.h"
#import "EditInserModel.h"

@interface EditRemViewController ()

@property (strong , nonatomic) UITableView *tableView;
@property (strong , nonatomic) UIButton *addBtn;
@property (strong , nonatomic) MyRemModel *editRemModel;

@end

@implementation EditRemViewController {
    NSMutableArray *editInsertArr;
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
    editInsertArr = [NSMutableArray array];
    [self getDataFromUrl];
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:@"编辑友记" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}


- (void)setUpUI {
    [self.view addSubview:self.addBtn];
    [self.view addSubview:self.tableView];
}


- (void)setUIAutoLayout {
    [_addBtn autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
    [_addBtn autoSetDimension:ALDimensionHeight toSize:50];
}

- (void)setType:(NSString *)type {
    _type = type;
    if ([_type isEqualToString:@"1"]) {
        [self addRightButton];
    }
}

// 右侧按钮
- (void)addRightButton {
    UIButton *rightBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:@"发布" forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    rightBtn.frame = CGRectMake(0, 0, 44, 44);
    UIBarButtonItem* rightBtnItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    [rightBtn addTarget:self action:@selector(rightButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setRightBarButtonItem:rightBtnItem];
}

- (void)rightButton:(UIButton *)button {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/draftRadio",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"id"      : self.activityId
                          };
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            [LCProgressHUD showMessage:@"发布成功"];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
    
}

- (void)getDataFromUrl {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/Friendeditor",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"id" : self.activityId
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            _editRemModel = [MyRemModel arrayWithDic:resultObject[@"obj"][@"FriendsList"]];
            editInsertArr = [weakSelf dataArray:resultObject[@"obj"][@"RenewList"]];
            [weakSelf.tableView reloadData];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {

    }];
}

- (NSMutableArray *)dataArray:(NSMutableArray *)param {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in param) {
        EditInserModel *model = [EditInserModel arrayWithDic:dic];
        [array addObject:model];
    }
    return array;
}

#pragma  mark - UITableViewDelegate ,UITableViewDataSource
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    
    return editInsertArr.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    if (indexPath.section == 0) {
        EditRemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EditRemCell"];
        cell.model = _editRemModel;
        return cell;
    }else {
        EditRemInsterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EditRemInsterCell"];
        cell.model = editInsertArr[indexPath.row];
        return cell;
    }
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 180;
    }
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.1;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        EditFriengViewController *vc = [[EditFriengViewController alloc] init];
        vc.actId = self.activityId;
        [self.navigationController pushViewController:vc animated:YES];
    }else {
        EditInsertViewController *vc = [[EditInsertViewController alloc] init];
        EditInserModel *model = editInsertArr[indexPath.row];;
        vc.actId = model.ffID;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

// 定义编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        
        return UITableViewCellEditingStyleNone;
    }
    return UITableViewCellEditingStyleDelete;
}

// 进入编辑模式，按下出现的编辑按钮后,进行删除操作
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        ContinueModel *model = continueArray[indexPath.row];
//        [continueArray removeObjectAtIndex:indexPath.row];
//        [self.tableView reloadData];
//        [self cancelCollect:model.continueId];
    }
}
// 修改编辑按钮文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}

#pragma mark - 删除
- (void)cancelCollect:(NSString *)index {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_activity/del_activity_info",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"title_id"  : index
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}




// 新增内容
- (void)addAction {
    InsertTextViewController *vc = [[InsertTextViewController alloc] init];
    vc.friendId = self.activityId;
    [self.navigationController pushViewController:vc animated:YES];
}



#pragma mark - 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-JCNew64-50) style:UITableViewStyleGrouped];
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
        [_tableView registerClass:[EditRemTableViewCell class] forCellReuseIdentifier:@"EditRemCell"];
        [_tableView registerClass:[EditRemInsterTableViewCell class] forCellReuseIdentifier:@"EditRemInsterCell"];
        
    }
    return _tableView;
}

- (UIButton *)addBtn {
    if (!_addBtn) {
        _addBtn = [[UIButton alloc] initForAutoLayout];
        [_addBtn setBackgroundColor:UIColorFromRGB(0xff9d00)];
        [_addBtn setTitle:@"新增内容" forState:UIControlStateNormal];
        [_addBtn setTitle:@"新增内容" forState:UIControlStateSelected];
        [_addBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _addBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        //        _logoutBtn.layer.cornerRadius = 6;
        //        [_logoutBtn.layer setMasksToBounds:YES];
        [_addBtn addTarget:self action:@selector(addAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addBtn;
}


@end
