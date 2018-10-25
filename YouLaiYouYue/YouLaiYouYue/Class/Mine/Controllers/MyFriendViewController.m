//
//  MyFriendViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/28.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "MyFriendViewController.h"
#import "NIMSessionViewController.h"
#import "BlacklistViewController.h"
#import "PageViewController.h"

#import "MyFriendTableViewCell.h"

#import "MyFriendModel.h"
#import "FriendDataHelper.h"
#import "NSString+Utils.h"

@interface MyFriendViewController ()<UITableViewDelegate , UITableViewDataSource ,UISearchBarDelegate,UISearchDisplayDelegate>
{
    NSString * _addName;
    BOOL _isSearch;
}

@property (strong , nonatomic) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *sectionTitles;
@property (nonatomic,strong) NSMutableArray *contactsSource;
@property (nonatomic,strong) NSMutableArray * foldArray;
@property (nonatomic,strong) UISearchBar *searchBar;//搜索框

@property (nonatomic,strong) NSMutableArray *searchResultArr;//搜索结果


@end

@implementation MyFriendViewController {
//    NSMutableArray *friendArr;
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
    _sectionTitles = [[NSMutableArray alloc] init];
    _contactsSource = [[NSMutableArray alloc] init];
    _foldArray = [[NSMutableArray alloc] init];
    _searchResultArr = [[NSMutableArray alloc] init];
    [self getDataFromUrl];
    
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:@"我的好友" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
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
    [rightBtn setTitle:@"黑名单" forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    rightBtn.frame = CGRectMake(0, 0, 44, 44);
    UIBarButtonItem* rightBtnItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    [rightBtn addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setRightBarButtonItem:rightBtnItem];
}

- (void)rightButtonAction:(UIButton *)button {
    BlacklistViewController *vc = [[BlacklistViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)getDataFromUrl {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_user/Myfriend",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"uid"     : GetUserDefault(userID)
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            weakSelf.contactsSource = [weakSelf dataArray:resultObject[@"obj"]];
            //用ContactDataHelper进行排序
            [weakSelf sortDataArrayWithContactDataHelper];
            //获得折叠状态数组
            [weakSelf getFoldStateArray];
            [weakSelf.tableView reloadData];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

- (NSMutableArray *)dataArray:(NSMutableArray *)param {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in param) {
        MyFriendModel *model = [MyFriendModel arrayWithDic:dic];
        [array addObject:model];
    }
    return array;
}

// 删除好友
- (void)deleteFriend:(NSIndexPath *)index {
    MyFriendModel * model = self.contactsSource[index.section][index.row];
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_user/DeleteUser",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"id"      : model.user_id
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            [LCProgressHUD showMessage:@"删除成功"];
            [weakSelf.contactsSource[index.section] removeObjectAtIndex:index.row];
            if ([weakSelf.contactsSource[index.section] count] == 0) {
                [weakSelf.sectionTitles removeObjectAtIndex:index.section + 1];
                [weakSelf.contactsSource removeObjectAtIndex:index.section];
            }
            [weakSelf.tableView reloadData];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

// 加入黑名单
- (void)addBlacklist:(NSIndexPath *)index {
    MyFriendModel * model = self.contactsSource[index.section][index.row];
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_user/BlackUser",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"id"      : model.user_id
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            [LCProgressHUD showMessage:@"成功加入黑名单"];
            [weakSelf.contactsSource[index.section] removeObjectAtIndex:index.row];
            if ([weakSelf.contactsSource[index.section] count] == 0) {
                [weakSelf.sectionTitles removeObjectAtIndex:index.section + 1];
                [weakSelf.contactsSource removeObjectAtIndex:index.section];
            }
            [weakSelf.tableView reloadData];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

- (void)getFoldStateArray{
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"old"] == nil) {
        for (int i = 0; i < self.sectionTitles.count - 1; i++) {
            NSNumber * isHidden = @0;
            [self.foldArray addObject:isHidden];
        }
        NSArray * foldArr = [NSArray arrayWithArray:self.foldArray];
        [[NSUserDefaults standardUserDefaults] setObject:foldArr forKey:@"old"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }else{
        
        NSArray * foldArr = [[NSUserDefaults standardUserDefaults] objectForKey:@"old"];
        self.foldArray = [NSMutableArray arrayWithArray:foldArr];
    }
}

/**
 *  通讯录排序
 *
 */

- (void)sortDataArrayWithContactDataHelper{
    
    NSMutableArray *contactsSource = [NSMutableArray arrayWithArray:self.contactsSource];
    [self.contactsSource removeAllObjects];
    [self.sectionTitles removeAllObjects];
    
    self.contactsSource = [FriendDataHelper getFriendListDataBy:contactsSource];
    
    self.sectionTitles = [FriendDataHelper getFriendListSectionBy:[self.contactsSource mutableCopy]];
}

- (void)btnClicked:(UIButton *)btn{
    
    NSInteger section = btn.tag;
    BOOL isHidden = ![self.foldArray[section] boolValue];
    [self.foldArray removeObjectAtIndex:section];
    [self.foldArray insertObject:[NSNumber numberWithBool:isHidden] atIndex:section];
    NSArray * foldArr = [NSArray arrayWithArray:self.foldArray];
    [[NSUserDefaults standardUserDefaults] setObject:foldArr forKey:@"fold"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:NO];
    
}

//监听UITextField中内容变化
- (void)handleTextFieldTextDidChangeNotification:(NSNotification *)notification {
    UITextField *textField = notification.object;
    _addName = textField.text;
    
}

#pragma  mark - UITableViewDelegate ,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (([self.foldArray[section] boolValue] == YES ||self.contactsSource.count == 0) && _isSearch == 0) {
        return 0;
    }
    
    if (_isSearch == 1) {
        return self.searchResultArr.count;
    }
    return [self.contactsSource[section] count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.contactsSource.count == 0) {
        return 0;
    }
    if (_isSearch == 1) {
        return 1;
    }
    return self.sectionTitles.count - 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    MyFriendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyFriendCell"];
    
    if (_isSearch == 1) {
        
        MyFriendModel * model = self.searchResultArr[indexPath.row];
        cell.nameLabel.text = model.username;
        [cell.img sd_setImageWithURL:[NSURL URLWithString:model.userpic] placeholderImage:nil];
        return cell;
    }
    MyFriendModel * model = self.contactsSource[indexPath.section][indexPath.row];
    cell.nameLabel.text = model.username;
    [cell.img sd_setImageWithURL:[NSURL URLWithString:model.userpic] placeholderImage:nil];
    return cell;
    
    
    return cell;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    if (_isSearch == 1) {
        return nil;
    }
    return self.sectionTitles;
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (_isSearch == 1) {
        return 0;
    }
    return 20;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if(_isSearch == 1){
        return nil;
    }
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    view.backgroundColor = UIColorFromRGB(0xf4f4f4);
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(25, 0, 30, 20)];
    [btn setTitle:self.sectionTitles[section + 1] forState:UIControlStateNormal];
    [btn setTitleColor:UIColorFromRGB(0x333333) forState:(UIControlStateNormal)];
    btn.tag = section;
    
    // 折叠的点击事件
//    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [view addSubview:btn];
    return view;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_isSearch == 1) {
        MyFriendModel *model = self.searchResultArr[indexPath.row];
        NIMSession *session = [NIMSession session:model.wy_accid type:NIMSessionTypeP2P];
        NIMSessionViewController *vc = [[NIMSessionViewController alloc] initWithSession:session];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else {
        MyFriendModel *model = self.contactsSource[indexPath.section][indexPath.row];
        NIMSession *session = [NIMSession session:model.wy_accid type:NIMSessionTypeP2P];
        NIMSessionViewController *vc = [[NIMSessionViewController alloc] initWithSession:session];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
//
    
    
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_isSearch == 1) {
        return NO;
    }
    return YES;
}



-(NSString*)tableView:(UITableView*)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath*)indexpath{
    return @"删除";
}


- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    //添加一个删除按钮
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:(UITableViewRowActionStyleDestructive) title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSLog(@"点击了删除");
        [self deleteFriend:indexPath];
    }];
    
    //--------加入黑名单
    UITableViewRowAction *moreRowAction = [UITableViewRowAction rowActionWithStyle:(UITableViewRowActionStyleNormal) title:@"加入黑名单" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        [self addBlacklist:indexPath];
    }];
    
    // 查看个人信息
    UITableViewRowAction *lookRowAction = [UITableViewRowAction rowActionWithStyle:(UITableViewRowActionStyleNormal) title:@"查看信息" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        MyFriendModel * model = self.contactsSource[indexPath.section][indexPath.row];
        PageViewController *vc = [[PageViewController alloc] init];
        vc.u_id = model.u_id;
        [self.navigationController pushViewController:vc animated:YES];
    }];
    lookRowAction.backgroundColor = [UIColor orangeColor];
    //将设置好的按钮方到数组中返回
    return @[deleteAction,moreRowAction,lookRowAction];
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    // 取出要拖动的模型数据
    MyFriendModel *model = self.contactsSource[sourceIndexPath.section][sourceIndexPath.row];
    //删除之前行的数据
    [self.contactsSource[sourceIndexPath.section] removeObject:model];
    // 插入数据到新的位置
    [self.contactsSource[destinationIndexPath.section] insertObject:model atIndex:destinationIndexPath.row];
    if([self.contactsSource[sourceIndexPath.section] count] == 0){
        [self.sectionTitles removeObjectAtIndex:sourceIndexPath.section + 1];
        [self.contactsSource removeObjectAtIndex:sourceIndexPath.section];
        [tableView reloadData];
    }
}

#pragma mark searchBar delegate
//searchBar开始编辑时改变取消按钮的文字
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    
    searchBar.showsCancelButton = YES;
    for(UIView *view in  [[[searchBar subviews] objectAtIndex:0] subviews]) {
        if([view isKindOfClass:[NSClassFromString(@"UINavigationButton") class]]) {
            UIButton * cancel =(UIButton *)view;
            [cancel setTitle:@"取消" forState:UIControlStateNormal];
            cancel.titleLabel.font = [UIFont systemFontOfSize:14];
        }
    }
}
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    return YES;
}
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    return YES;
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    //取消
    [searchBar resignFirstResponder];
    searchBar.text = nil;
    _isSearch = 0;
    searchBar.showsCancelButton = NO;
    [self.tableView reloadData];
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    _isSearch = 1;
    [self.searchResultArr removeAllObjects];
    
    NSMutableArray *tempResults = [NSMutableArray array];
    NSUInteger searchOptions = NSCaseInsensitiveSearch | NSDiacriticInsensitiveSearch;
    
    NSMutableArray *contactsSource = [NSMutableArray arrayWithArray:self.contactsSource];
    
    for (NSArray * array in contactsSource) {
        for (MyFriendModel * model in array) {
            [tempResults addObject:model];
        }
    }
    
    for (int i = 0; i < tempResults.count; i++) {
        NSString *storeString = [[(MyFriendModel *)tempResults[i] username] pinyin];
        
        NSRange storeRange = NSMakeRange(0, storeString.length);
        
        //  NSRange storeRange = NSMakeRange(0,searchText.pinyin.length);
        
        if (storeString.length < storeRange.length) {
            continue;
        }
        
        
        NSRange foundRange = [storeString rangeOfString:searchText.pinyin options:searchOptions range:storeRange];
        if (foundRange.length) {
            
            [self.searchResultArr addObject:tempResults[i]];
        }
    }
    
    [self.tableView reloadData];
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"ninini");
}

#pragma mark - 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-JCNew64) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView setSectionIndexBackgroundColor:[UIColor clearColor]];
        [_tableView setSectionIndexColor:[UIColor darkGrayColor]];
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
        _tableView.tableHeaderView = self.searchBar;
        [_tableView registerClass:[MyFriendTableViewCell class] forCellReuseIdentifier:@"MyFriendCell"];
    }
    return _tableView;
}

- (UISearchBar *)searchBar{
    if (!_searchBar) {
        _searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
        [_searchBar setBackgroundImage:[UIImage imageNamed:@"ic_searchBar_bgImage"]];
        [_searchBar sizeToFit];
        [_searchBar setPlaceholder:@"搜索"];
        [_searchBar.layer setBorderWidth:0.5];
        [_searchBar.layer setBorderColor:[UIColor whiteColor].CGColor];
        _searchBar.barTintColor = [UIColor whiteColor];
        _searchBar.translucent = YES;
        [_searchBar setDelegate:self];
        [_searchBar setKeyboardType:UIKeyboardTypeDefault];
    }
    return _searchBar;
}
@end
