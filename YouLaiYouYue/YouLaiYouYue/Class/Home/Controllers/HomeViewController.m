//
//  HomeViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/16.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "HomeViewController.h"
#import "SDCycleScrollView.h" // 轮播
#import "LoginViewController.h"
#import "SearchViewController.h"
#import "PartyViewController.h" // 友聚详情
#import "CityListViewController.h"
#import "RemDetailsViewController.h"  // 友记详情
#import "MessageViewController.h"
#import "PageViewController.h"  // 个人主页
#import "VideoViewController.h"


#import "PlaceTableViewCell.h" // 地点  搜索框 cell
#import "RecommendTableViewCell.h"
#import "BigImgTableViewCell.h"
#import "SlidTableViewCell.h"
#import "ActivityTableViewCell.h"

// Model
#import "PolyModel.h"
#import "RecommendModel.h"
#import "VideoModel.h"
#import "BannerModel.h"



@interface HomeViewController ()<UITableViewDelegate , UITableViewDataSource , SDCycleScrollViewDelegate ,SlideCollectionDelegate>

@property (strong , nonatomic) UITableView *tableView;

@property (nonatomic ,strong) SDCycleScrollView *cycleScrollView; // 轮播

@property (copy , nonatomic) NSIndexPath *selectIndexPath;

@property (strong , nonatomic) UIButton *btn1; // 推荐btn
@property (strong , nonatomic) UIButton *btn2; // 热门btn
@property (strong , nonatomic) UIButton *btn3; // 关注btn

@end

@implementation HomeViewController {
    NSMutableArray *polyArray;  // 友来友聚 数据
    NSMutableArray *recommendArray; // 推荐作品
    NSArray *videoArray;
    NSString *cityName;
    NSString *cityId;
    int page;
    NSString *type;
    NSMutableArray *bannerArr;
    NSMutableArray *bannerData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.fd_prefersNavigationBarHidden = YES;
    
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
    bannerData = [NSMutableArray array];
    bannerArr = [NSMutableArray array];
    polyArray = [NSMutableArray new];
    recommendArray = [NSMutableArray new];
    videoArray = [NSArray new];
    type = @"1";
    self.btn1.selected = YES;
    [self getbannerDataFromUrl];
    [self getRecommendDataFromUrl];
    [self getActivityDataFromUrl];
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:@"首页" textColor:UIColorFromRGB(0x0c0c0c) titleFontSize:nil];
}


- (void)setUpUI {
    [self.view addSubview:self.tableView];
}


- (void)setUIAutoLayout {
    
}

// 轮播接口
- (void)getbannerDataFromUrl {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/article_slide",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"type"    : @"1"
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            [bannerArr removeAllObjects];
            bannerData = [weakSelf bannerDataArray:resultObject[@"obj"]];
            for (NSInteger i = 0; i < [resultObject[@"obj"] count]; i++) {
                [bannerArr addObject:resultObject[@"obj"][i][@"pic"] ];
                
            }
            weakSelf.cycleScrollView.imageURLStringsGroup = bannerArr;
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

- (NSMutableArray *)bannerDataArray:(NSMutableArray *)param {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in param) {
        BannerModel *model = [BannerModel arrayWithDic:dic];
        [array addObject:model];
    }
    return array;
}

// 推荐作品数据
- (void)getRecommendDataFromUrl {
    NSString *u_id;
    if (GetUserDefault(userID) == nil) {
        u_id = @"0";
    }else {
        u_id = GetUserDefault(userID);
    }
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/index_fmrecommend",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"type"    : type,
                          @"uid"     : u_id
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            recommendArray = [weakSelf recommendDataArray:resultObject[@"obj"][@"info"]];
            videoArray = [weakSelf videoDataArray:resultObject[@"obj"][@"video"]];
            [weakSelf.tableView reloadData];
        }
    } swpResultError:^(id resultObject, NSString *errorMessage) {
        
    }];
}

- (NSMutableArray *) recommendDataArray:(NSMutableArray *)param {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in param) {
        RecommendModel *model = [RecommendModel arrayWithDic:dic];
        [array addObject:model];
    }
    return array;
}

- (NSMutableArray *) videoDataArray:(NSMutableArray *)param {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in param) {
        VideoModel *model = [VideoModel arrayWithDic:dic];
        [array addObject:model];
    }
    return array;
}



// 友来有聚
- (void)getActivityDataFromUrl {
    if (GetUserDefault(@"cityId") == nil) {
        SetUserDefault(@"0", @"cityId");
    }
    NSString *u_id;
    if (GetUserDefault(userID) == nil) {
        u_id = @"0";
    }else {
        u_id = GetUserDefault(userID);
    }
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_activity/index_activity",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url ,
                          @"page"    : [NSString stringWithFormat:@"%d",page],
                          @"city_id" : GetUserDefault(@"cityId"),
                          @"uid"     : u_id
                          };
    
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            if (page == 1) {
                [polyArray removeAllObjects];
            }
            [polyArray addObjectsFromArray:[weakSelf dataArray:resultObject[@"obj"]]];
            [weakSelf.tableView reloadData];
        }
    } swpResultError:^(id resultObject, NSString *errorMessage) {
        
    }];
    
}

- (NSMutableArray *) dataArray:(NSMutableArray *)param{
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dict in param) {
        PolyModel *model = [PolyModel arrayWithDic:dict];
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
    if (section == 1) {
        return recommendArray.count;
    }
    if (section == 2) {
        if (videoArray.count == 0) {
            return 0;
        }
        return 1;
    }
    return polyArray.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    if (indexPath.section == 0) {
        PlaceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"placecell"];
        if (GetUserDefault(@"city") == nil) {
            SetUserDefault(@"选择城市", @"city");
        }
        [cell.cityBtn setTitle:GetUserDefault(@"city") forState:(UIControlStateNormal)];
        [cell.cityBtn addTarget:self action:@selector(cityAction:) forControlEvents:(UIControlEventTouchUpInside)];
        cell.cityBtn.tag = 1000;
        [cell.messageBtn addTarget:self action:@selector(cityAction:) forControlEvents:(UIControlEventTouchUpInside)];
        cell.messageBtn.tag = 1001;
        [cell.searchBtn addTarget:self action:@selector(searchAction) forControlEvents:(UIControlEventTouchUpInside)];    
        return cell;
    }
    if (indexPath.section == 1) {
        RecommendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RecommendCell"];
        cell.model = recommendArray[indexPath.row];
        cell.headImg.tag = 101 + indexPath.row;
        UITapGestureRecognizer * tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headImageViewClick:)];
        tap.numberOfTouchesRequired = 1; //手指数
        tap.numberOfTapsRequired = 1; //tap次数
        cell.headImg.contentMode = UIViewContentModeScaleToFill;
        [cell.headImg addGestureRecognizer:tap];
        cell.zanBtn.tag = 102 + indexPath.row;
        [cell.zanBtn addTarget:self action:@selector(attentionAction:) forControlEvents:(UIControlEventTouchUpInside)];
        return cell;
    }
    if (indexPath.section == 2) {
        SlidTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"slidCell"];
        cell.videoArr = videoArray;
        cell.delegate = self;
        return cell;
    }else {
        ActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActivityCell"];
        cell.model = polyArray[indexPath.row];
        cell.headImg.tag = 102 + indexPath.row;
        UITapGestureRecognizer * tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(activityHeadImageViewClick:)];
        tap.numberOfTouchesRequired = 1; //手指数
        tap.numberOfTapsRequired = 1; //tap次数
//        tap.delegate = self;
        cell.headImg.contentMode = UIViewContentModeScaleToFill;
        [cell.headImg addGestureRecognizer:tap];
        cell.activityBtn.tag = 103 + indexPath.row;
        [cell.activityBtn addTarget:self action:@selector(activityBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
        return cell;
    }
    return nil;

}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 55;
    }
    if (indexPath.section == 1) {
        return 340;
    }
    if (indexPath.section == 2) {
        return 235;
    }
    return 210*Balance_Heith;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 200;
    }
    if (section == 1) {
        return 56;
    }
    if (section == 2) {
        return 10;
    }
    return 57;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
        view.backgroundColor = [UIColor grayColor];
        [view addSubview:self.cycleScrollView];
        return view;
    }else if(section == 1){
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 55)];
        view.backgroundColor = UIColorFromRGB(0xf8f8f8);
        [view addSubview:self.btn1];
        [view addSubview:self.btn2];
        [view addSubview:self.btn3];
        
        [_btn1 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 1, 0) excludingEdge:ALEdgeRight];
        [_btn1 autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/3];
        [_btn2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_btn1 withOffset:0];
        [_btn2 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
        [_btn2 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:1];
        [_btn2 autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/3];
        [_btn3 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_btn2 withOffset:0];
        [_btn3 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
        [_btn3 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:1];
        [_btn3 autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/3];
        
        return view;
    }
    if (section == 3) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 57)];
        view.backgroundColor = UIColorFromRGB(0xf8f8f8);
        
        UIView *bgView = [[UIView alloc] initForAutoLayout];
        bgView.backgroundColor = [UIColor whiteColor];
        [view addSubview:bgView];
        [bgView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 0, 0, 0)];
        
        UIButton *btn = [[UIButton alloc] initForAutoLayout];
        btn.titleLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:18];
        [btn setTitleColor:UIColorFromRGB(0xff7f00) forState:UIControlStateNormal];
        [btn setImage:[[UIImage imageNamed:@"wine_glass"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        [btn setTitle:@"友来友聚" forState:(UIControlStateNormal)];
        btn.titleEdgeInsets = UIEdgeInsetsMake(0,  -(btn.imageView.frame.origin.x+btn.imageView.frame.size.width+4), 0, 0);
        //button图片的偏移量
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, -(btn.imageView.frame.origin.x +10), 0, btn.imageView.frame.origin.x);
        [bgView addSubview:btn];
        
        [btn autoAlignAxisToSuperviewMarginAxis:(ALAxisVertical)];
        [btn autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
        [btn autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
        [btn autoSetDimension:ALDimensionWidth toSize:100];
        
        return view;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _selectIndexPath = indexPath;
    if (indexPath.section == 1) {
        RecommendModel *model = recommendArray[indexPath.row];
        if ([model.accesspassword isEqualToString:@""]) {
            RemDetailsViewController *vc = [[RemDetailsViewController alloc] init];
            vc.articleId = model.fmID;
            vc.title = model.fmtitle;
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
                        vc.title = model.fmtitle;
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
    if (indexPath.section == 3) {
        PolyModel *model = polyArray[indexPath.row];
        if ([model.pfpwd isEqualToString:@""]) {
            PartyViewController *vc = [[PartyViewController alloc] init];
            vc.activityId = model.pfID;
            vc.title = model.pftitle;
            [self.navigationController pushViewController:vc animated:YES];
        }else {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入密码" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //响应事件
                //得到文本信息
                for(UITextField *text in alert.textFields){
                    NSLog(@"text = %@", text.text);
                    if ([text.text isEqualToString:model.pfpwd]) {
                        PartyViewController *vc = [[PartyViewController alloc] init];
                        vc.activityId = model.pfID;
                        vc.title = model.pftitle;
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

#pragma  mark - 选择城市  搜索  消息 点击事件
- (void)cityAction:(UIButton *)button {
    if (button.tag == 1000) {
        CityListViewController *vc = [[CityListViewController alloc] init];
        __weak typeof(self)weakSelf = self;
        vc.selectedCityBlock = ^(CityList *city) {
            
            cityName = city.cityName;
            cityId = [NSString stringWithFormat:@"%ld",(long)city.cityCode];
            SetUserDefault(city.cityName, @"city");
            SetUserDefault(cityId,@"cityId");
            page = 1;
            self.btn1.selected = YES;
            self.btn2.selected = NO;
            self.btn3.selected = NO;
            type = @"1";
            [weakSelf getRecommendDataFromUrl];
            [weakSelf getActivityDataFromUrl];

        };
        vc.resetCityBlock = ^(NSString *cityId, NSString *cityName) {
            
            SetUserDefault(cityName, @"city");
            SetUserDefault(cityId,@"cityId");
            page = 1;
            self.btn1.selected = YES;
            self.btn2.selected = NO;
            self.btn3.selected = NO;
            type = @"1";
            [weakSelf getRecommendDataFromUrl];
            [weakSelf getActivityDataFromUrl];
        };
        [self.navigationController pushViewController:vc animated:YES];
        NSLog(@"选择城市");
    }else {
        
        MessageViewController *vc = [[MessageViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        NSLog(@"消息");
    }
}

// 点击搜索跳转
- (void)searchAction {
    SearchViewController *vc = [[SearchViewController alloc] init];
    vc.type = @"1";
    [self.navigationController pushViewController:vc animated:YES];
}


// 点击头像跳转个人主页
- (void)headImageViewClick:(UITapGestureRecognizer *)tap {
    RecommendTableViewCell *cell = (RecommendTableViewCell *) [tap.view.superview superview];
    NSInteger index = cell.headImg.tag - 101;
    PageViewController *vc = [[PageViewController alloc] init];
    RecommendModel *model = recommendArray[index];
    vc.u_id = model.useID;
    [self.navigationController pushViewController:vc animated:YES];
    NSLog(@"%ld",(long)index);
    
}
- (void)activityHeadImageViewClick:(UITapGestureRecognizer *)tap {
    ActivityTableViewCell *cell = (ActivityTableViewCell *) [tap.view.superview superview];
    NSInteger index = cell.headImg.tag - 102;
    PageViewController *vc = [[PageViewController alloc] init];
    PolyModel *model = polyArray[index];
    vc.u_id = model.captain;
    [self.navigationController pushViewController:vc animated:YES];
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
    RecommendModel *model = recommendArray[index];
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_user/attention_captain",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"userID"     : GetUserDefault(userID),
                          @"attention_userID"  : model.useID
                          };
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            model.follow = resultObject[@"obj"][@"attention"];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
    
}

// 关注活动
- (void)activityBtnAction:(UIButton *)button {
    if ([GetUserDefault(isLogin) boolValue] == NO) {
        LoginViewController*vc = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    NSInteger index = button.tag - 103;
    button.selected = !button.selected;
    [self attentionArticle:index];
}
// 关注活动
- (void)attentionArticle:(NSInteger )index {
    PolyModel *model = polyArray[index];
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_activity/follow_attention",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"pfID"      : model.pfID,
                          @"userID"     : GetUserDefault(userID)
                          };
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            model.follow = resultObject[@"obj"];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

#pragma mark - 刷新  加载
- (void)headerRereshingData {
    page = 1;
    [self getbannerDataFromUrl];
    [self getRecommendDataFromUrl];
    [self getActivityDataFromUrl];
    [self.tableView.mj_header endRefreshing];
}

- (void)footerRereshingData {
    page++;
    [self getActivityDataFromUrl];
    [self.tableView.mj_footer endRefreshing];
}
#pragma mark - SDCycleScrollViewDelegate  轮播代理
// 点击轮播
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    BannerModel *model = bannerData[index];
    if ([model.first_type isEqualToString:@"0"]) {
        PartyViewController *vc = [[PartyViewController alloc] init];
        vc.activityId = model.leftid;
        [self.navigationController pushViewController:vc animated:YES];
    }else {
        RemDetailsViewController *vc = [[RemDetailsViewController alloc] init];
        vc.articleId = model.leftid;
        [self.navigationController pushViewController:vc animated:YES];
    }

    
}
/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{
    //    NSLog(@"%ld",index);
}

// 点击视频
- (void)didCollectionCellItem:(NSInteger)item {
    
    VideoViewController *vc = [[VideoViewController alloc] init];
    vc.model = videoArray[item];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 推荐 热门 关注
- (void)btn1Action:(UIButton *)button {
    button.selected = !button.selected;
    self.btn2.selected = NO;
    self.btn3.selected = NO;
    type = @"1";
    [self getRecommendDataFromUrl];
}
- (void)btn2Action:(UIButton *)button {
    button.selected = !button.selected;
    self.btn1.selected = NO;
    self.btn3.selected = NO;
    type = @"2";
    [self getRecommendDataFromUrl];
}
- (void)btn3Action:(UIButton *)button {
    if ([GetUserDefault(isLogin) boolValue] == NO) {
        LoginViewController*vc = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    button.selected = !button.selected;
    self.btn1.selected = NO;
    self.btn2.selected = NO;
    type = @"3";
    [self getRecommendDataFromUrl];
}

#pragma mark - 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        if (StatusHeight == 44) {
            _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-TabBarH-34) style:UITableViewStyleGrouped];
        }else {
            
            _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-TabBarH) style:UITableViewStyleGrouped];
        }
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [_tableView registerClass:[PlaceTableViewCell class] forCellReuseIdentifier:@"placecell"];
        [_tableView registerClass:[RecommendTableViewCell class] forCellReuseIdentifier:@"RecommendCell"];
        [_tableView registerClass:[BigImgTableViewCell class] forCellReuseIdentifier:@"bigImgCell"];
        [_tableView registerClass:[SlidTableViewCell class] forCellReuseIdentifier:@"slidCell"];
        [_tableView registerClass:[ActivityTableViewCell class] forCellReuseIdentifier:@"ActivityCell"];
        
        [self setRefreshing:_tableView setTarget:self setHeaderAction:@selector(headerRereshingData) setFooterAction:@selector(footerRereshingData)];
    }
    return _tableView;
}

// 创建轮播图

- (SDCycleScrollView *)cycleScrollView
{
    if (!_cycleScrollView) {
        _cycleScrollView = [[SDCycleScrollView alloc] init];
        _cycleScrollView.frame =CGRectMake(0, 0, SCREEN_WIDTH, 200);
        _cycleScrollView.backgroundColor =  UIColorFromRGB(0xf6f6f6);
        _cycleScrollView.infiniteLoop = YES;
        _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _cycleScrollView.delegate = self;
        //如果有一张图片时不显示pagecontroll
        _cycleScrollView.hidesForSinglePage = YES;
        _cycleScrollView.autoScrollTimeInterval = 5.0;
    }
    return _cycleScrollView;
}

- (UIButton *)btn1 {
    if (!_btn1) {
        _btn1 = [[UIButton alloc] initForAutoLayout];
        [_btn1 setTitle:@"推荐" forState:UIControlStateNormal];
        _btn1.backgroundColor = UIColorFromRGB(0xffffff);
        [_btn1 setTitleColor:UIColorFromRGB(0x333333) forState:(UIControlStateNormal)];
        [_btn1 setTitleColor:UIColorFromRGB(0xff9d00) forState:(UIControlStateSelected)];
        _btn1.titleLabel.font = [UIFont systemFontOfSize:18];
        [_btn1 addTarget:self action:@selector(btn1Action:) forControlEvents:(UIControlEventTouchUpInside)];
        _btn1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居
    }
    return _btn1;
}

- (UIButton *)btn2 {
    if (!_btn2) {
        _btn2 = [[UIButton alloc] initForAutoLayout];
        [_btn2 setTitle:@"热门" forState:UIControlStateNormal];
        _btn2.backgroundColor = UIColorFromRGB(0xffffff);
        [_btn2 setTitleColor:UIColorFromRGB(0x333333) forState:(UIControlStateNormal)];
        [_btn2 setTitleColor:UIColorFromRGB(0xff9d00) forState:(UIControlStateSelected)];
        _btn2.titleLabel.font = [UIFont systemFontOfSize:18];
        [_btn2 addTarget:self action:@selector(btn2Action:) forControlEvents:(UIControlEventTouchUpInside)];
        _btn2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
    }
    return _btn2;
}

- (UIButton *)btn3 {
    if (!_btn3) {
        _btn3 = [[UIButton alloc] initForAutoLayout];
        [_btn3 setTitle:@"关注" forState:UIControlStateNormal];
        _btn3.backgroundColor = UIColorFromRGB(0xffffff);
        [_btn3 setTitleColor:UIColorFromRGB(0x333333) forState:(UIControlStateNormal)];
        [_btn3 setTitleColor:UIColorFromRGB(0xff9d00) forState:(UIControlStateSelected)];
        _btn3.titleLabel.font = [UIFont systemFontOfSize:18];
        [_btn3 addTarget:self action:@selector(btn3Action:) forControlEvents:(UIControlEventTouchUpInside)];
        _btn3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
    }
    return _btn3;
}


@end
