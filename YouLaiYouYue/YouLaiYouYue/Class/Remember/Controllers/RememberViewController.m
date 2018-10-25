//
//  RememberViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/16.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "RememberViewController.h"
#import "CityListViewController.h"
#import "SearchViewController.h"
#import "RememberTableViewCell.h"
#import "RemDetailsViewController.h"
#import "PageViewController.h"
#import "LoginViewController.h"

#import "SDCycleScrollView.h" // 轮播
#import "RemSearchTableViewCell.h"
#import "FriendTableViewCell.h"
#import "SegementView.h"

#import "RemModel.h"
#import "TagModel.h"

@interface RememberViewController ()<UITableViewDelegate , UITableViewDataSource ,SDCycleScrollViewDelegate ,SegementViewDelegate>

@property (strong , nonatomic) UITableView *tableView;

@property (nonatomic ,strong) SDCycleScrollView *cycleScrollView; // 轮播

@property (strong , nonatomic) SegementView *segeView;

@end

@implementation RememberViewController {
    int page;
    NSMutableArray *remArray;
    NSMutableArray *tagArray;
    NSString *sign;
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
    sign = @"";
    page = 1;
    remArray = [NSMutableArray new];
    [self getTagData];
    
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:@"友记" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}


- (void)setUpUI {
    [self.view addSubview:self.tableView];
}


- (void)setUIAutoLayout {
    
}

- (void)getTagData {
    
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_public/Label",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"type"    : @"1"
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            
            TagModel *model = [[TagModel alloc] init];
            model.lID = @"";
            model.lname = @"全部";
            model.luse = @"";
            tagArray = [weakSelf tagDataArray:resultObject[@"obj"]];
            [tagArray insertObject:model atIndex:0];
            weakSelf.segeView.titles = tagArray;
            [weakSelf getDataFromUrl];
            
            
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
    
    
}

- (NSMutableArray *)tagDataArray:(NSMutableArray *)param {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in param) {
        TagModel *model = [TagModel arrayWithDic:dic];
        [array addObject:model];
    }
    return array;
}

- (void)getDataFromUrl {
    if (GetUserDefault(userID) == nil) {
        SetUserDefault(@"", userID);
    }
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/article_list",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key"    : md5Url,
                          @"page"       : [NSString stringWithFormat:@"%d",page],
                          @"userID"     : GetUserDefault(userID),
                          @"table"      : sign
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            if (page == 1) {
                [remArray removeAllObjects];
            }
            [remArray addObjectsFromArray:[weakSelf remDataArray:resultObject[@"obj"]]];
            [weakSelf.tableView reloadData];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

- (NSMutableArray *)remDataArray:(NSMutableArray *)param {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in param) {
        RemModel *model = [RemModel arrayWithDic:dic];
        [array addObject:model];
    }
    return array;
}

#pragma  mark - UITableViewDelegate ,UITableViewDataSource
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return remArray.count +1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    if (indexPath.section == 0) {
        RemSearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RemSearchCell"];
        [cell.searchBtn addTarget:self action:@selector(searchAction) forControlEvents:(UIControlEventTouchUpInside)];
        return cell;
    }else {
        RememberTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RememberCell"];
        cell.model = remArray[indexPath.section -1];
        cell.headImg.tag = 101 + indexPath.section -1;
        UITapGestureRecognizer * tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headImageViewClick:)];
        tap.numberOfTouchesRequired = 1; //手指数
        tap.numberOfTapsRequired = 1; //tap次数
        cell.headImg.contentMode = UIViewContentModeScaleToFill;
        [cell.headImg addGestureRecognizer:tap];
        cell.zanBtn.tag = 102 + indexPath.section -1;
        [cell.zanBtn addTarget:self action:@selector(attentionAction:) forControlEvents:(UIControlEventTouchUpInside)];
        return cell;
    }
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 50;
    }else {
        return 340;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.1;
    }
    return 10;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 40;
    }
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 0) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
        
        
        [view addSubview:self.segeView];
        
        return view;
    }
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {

    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        
    }else {
        RemModel *model = remArray[indexPath.section-1];
        if ([model.accesspassword isEqualToString:@""]) {
            RemDetailsViewController *vc = [[RemDetailsViewController alloc] init];
            vc.articleId = model.fmID;
            [self.navigationController pushViewController:vc animated:YES];
        }else {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入密码" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //响应事件
                //得到文本信息
                for(UITextField *text in alert.textFields){
                    NSLog(@"text = %@", text.text);
                    if ([text.text isEqualToString:model.accesspassword]) {
                        RemDetailsViewController *vc = [[RemDetailsViewController alloc] init];
                        vc.articleId = model.fmID;
                        [self.navigationController pushViewController:vc animated:YES];
                    }else {
                        [LCProgressHUD showMessage:@"密码错误"];
                    }
                }
            }];
            UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                textField.placeholder = @"密码";
            }];
            [alert addAction:okAction];
            [alert addAction:cancelAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }
}

- (void)searchAction {
    SearchViewController *vc = [[SearchViewController alloc] init];
    vc.type = @"2";
    [self.navigationController pushViewController:vc animated:YES];
}

// 点击头像跳转个人主页
- (void)headImageViewClick:(UITapGestureRecognizer *)tap {
    RememberTableViewCell *cell = (RememberTableViewCell *) [tap.view.superview superview];
    NSInteger index = cell.headImg.tag - 101;
    PageViewController *vc = [[PageViewController alloc] init];
    RemModel *model = remArray[index];
    vc.u_id = model.uerID;
    [self.navigationController pushViewController:vc animated:YES];
    NSLog(@"%ld",(long)index);
    
}

// 友记关注人
- (void)attentionAction:(UIButton *)button {
    if ([GetUserDefault(isLogin) boolValue] == NO) {
        LoginViewController*vc = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    button.selected = !button.selected;
    NSInteger index = button.tag - 102;
    [self attentionWithIndex:index];
}

- (void)attentionWithIndex:(NSInteger )index {
    RemModel *model = remArray[index];
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_user/attention_captain",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"userID"     : GetUserDefault(userID),
                          @"attention_userID"  : model.uerID
                          };
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            model.look = resultObject[@"obj"][@"attention"];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
    
}

// 滑动标签
- (void)didSelectWithIndex:(NSInteger)index {
    TagModel *model = tagArray[index];
    sign = model.lID;
    [self getDataFromUrl];
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
        if (StatusHeight == 44) {
            _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-TabBarH-JCNew64-34) style:UITableViewStyleGrouped];
        }else {
            _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-TabBarH-JCNew64) style:UITableViewStyleGrouped];
        }
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
        [_tableView registerClass:[RemSearchTableViewCell class] forCellReuseIdentifier:@"RemSearchCell"];
        [_tableView registerClass:[RememberTableViewCell class] forCellReuseIdentifier:@"RememberCell"];
        [self setRefreshing:_tableView setTarget:self setHeaderAction:@selector(headerRereshingData) setFooterAction:@selector(footerRereshingData)];
    }
    return _tableView;
}

- (SegementView *)segeView {
    if (!_segeView) {
        _segeView = [[SegementView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        _segeView.delegate = self;
        _segeView.isShowUnderLine = NO;
    }
    return _segeView;
}

// 创建轮播图

- (SDCycleScrollView *)cycleScrollView
{
    if (!_cycleScrollView) {
        _cycleScrollView = [[SDCycleScrollView alloc] init];
        _cycleScrollView.frame =CGRectMake(0, 0, SCREEN_WIDTH, 200);
        _cycleScrollView.backgroundColor =  UIColorFromRGB(0xf6f6f6);
        //        _cycleScrollView.scrollDirection = UICollectionViewScrollDirectionVertical;
        _cycleScrollView.infiniteLoop = YES;
        //        cycleScrollView.pageControlStyle =  SDCycleScrollViewPageContolStyleClassic;
        _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _cycleScrollView.delegate = self;
        //    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        
        //如果有一张图片时不显示pagecontroll
        _cycleScrollView.hidesForSinglePage = YES;
        
        _cycleScrollView.autoScrollTimeInterval = 5.0;
        
        _cycleScrollView.localizationImageNamesGroup = @[@"1.jpg",@"2.jpg",@"3.jpg"];
        //        _cycleScrollView.titlesGroup = @[@"法拉开始放假了的撒娇",@"发链接刷卡机发的说",@"弗兰克撒酒疯拉萨的"];
        _cycleScrollView.titleLabelHeight = 45;
    }
    return _cycleScrollView;
}


@end
