//
//  TogetherViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/16.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "TogetherViewController.h"
#import "CityListViewController.h"
#import "SearchViewController.h"
#import "PartyViewController.h"
#import "NIMSessionViewController.h"
#import "EvaluateViewController.h" // 评论
#import "PageViewController.h"
#import "LoginViewController.h"


#import "SDCycleScrollView.h" // 轮播
#import "ButtonTableViewCell.h"
#import "FriendTableViewCell.h"
#import "FunctionTableViewCell.h"
#import "TagTableViewCell.h"
#import "SegementView.h"

#import "ActivitlModel.h"
#import "TagModel.h"
@interface TogetherViewController ()<UITableViewDelegate , UITableViewDataSource ,SDCycleScrollViewDelegate ,SegementViewDelegate>

@property (strong , nonatomic) UITableView *tableView;
@property (nonatomic ,strong) SDCycleScrollView *cycleScrollView; // 轮播

@property (strong , nonatomic) SegementView *segeView;


@end

@implementation TogetherViewController {
    int page;
    NSString *sign;
    NSMutableArray *togetherArray;
    NSString *togetherCityName;
    NSString *togetherCityId;
    NSMutableArray *tagArray;
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
    sign = @"";
    togetherArray = [NSMutableArray new];
    
    [self getTagData];
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:@"友聚" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
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
                          @"type"    : @"0"
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
    if (GetUserDefault(@"togetherCityId") == nil) {
        SetUserDefault(@"0", @"togetherCityId");
    }
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_activity/activity_all_list",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key"    : md5Url,
                          @"page"       : [NSString stringWithFormat:@"%d",page],
                          @"city_id"    : GetUserDefault(@"togetherCityId"),
                          @"sign"       : sign,
                          @"userID"     : GetUserDefault(userID)
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            if (page == 1) {
                [togetherArray removeAllObjects];
            }
            
            [togetherArray addObjectsFromArray:[weakSelf togetherDataArray:resultObject[@"obj"]]];
            [weakSelf.tableView reloadData];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

- (NSMutableArray *)togetherDataArray:(NSMutableArray *)param {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in param) {
        ActivitlModel *model = [ActivitlModel arrayWithDic:dic];
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
    
    return 2;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return togetherArray.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    if (indexPath.section == 0) {
        ButtonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ButtonCell"];
        if (GetUserDefault(@"togetherCity") == nil) {
            SetUserDefault(@"城市选择", @"togetherCity");
        }
        cell.btnView1.titleLabel.text = GetUserDefault(@"togetherCity");
        UITapGestureRecognizer *gesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickBtnView1:)];
        [cell.btnView1 addGestureRecognizer:gesture1];
        
        [cell.searchBtn addTarget:self action:@selector(searchAction) forControlEvents:(UIControlEventTouchUpInside)];
        
        return cell;
    }else {
        if (indexPath.row == 0) {
            FriendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FriendCell"];
            cell.model = togetherArray[indexPath.section -1];
            cell.headImg.tag = 101 + indexPath.section -1;
            UITapGestureRecognizer * tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headImageViewClick:)];
            tap.numberOfTouchesRequired = 1; //手指数
            tap.numberOfTapsRequired = 1; //tap次数
            cell.headImg.contentMode = UIViewContentModeScaleToFill;
            [cell.headImg addGestureRecognizer:tap];
            
            return cell;
        }else {
            FunctionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FunctionCell"];
            cell.model = togetherArray[indexPath.section -1];
            cell.btn1.tag = 1001+indexPath.section-1;
            cell.btn2.tag = 1002+indexPath.section-1;
            cell.btn3.tag = 1003+indexPath.section-1;
            [cell.btn1 addTarget:self action:@selector(btn1Action:) forControlEvents:(UIControlEventTouchUpInside)];
            [cell.btn2 addTarget:self action:@selector(btn2Action:) forControlEvents:(UIControlEventTouchUpInside)];
            [cell.btn3 addTarget:self action:@selector(btn3Action:) forControlEvents:(UIControlEventTouchUpInside)];
            return cell;
        }
    }
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 55;
    }else {
        if (indexPath.row == 0) {
            return 360;
        }else {
            return 55;
        }
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

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    if (section == 0) {
//        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
//        view.backgroundColor = [UIColor grayColor];
//        [view addSubview:self.cycleScrollView];
//        return view;
//    }
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 0) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
        
        
        [view addSubview:self.segeView];
        
        return view;
    }
    return nil;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section >= 1) {
        ActivitlModel *model = togetherArray[indexPath.section-1];
        if ([model.pfpwd isEqualToString:@""]) {
            PartyViewController *vc = [[PartyViewController alloc] init];
            vc.activityId = model.pfID;
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

- (void)clickBtnView1:(UITapGestureRecognizer *)tap {
    CityListViewController *vc = [[CityListViewController alloc] init];
    __weak typeof(self)weakSelf = self;
    vc.selectedCityBlock = ^(CityList *city) {
        
        togetherCityName = city.cityName;
        togetherCityId = [NSString stringWithFormat:@"%ld",(long)city.cityCode];
        SetUserDefault(city.cityName, @"togetherCity");
        SetUserDefault(togetherCityId,@"togetherCityId");
        page = 1;
        [weakSelf getDataFromUrl];
        
    };
    vc.resetCityBlock = ^(NSString *cityId, NSString *cityName) {
        
        SetUserDefault(cityName, @"togetherCity");
        SetUserDefault(cityId,@"togetherCityId");
        page = 1;
        [weakSelf getDataFromUrl];
    };
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)searchAction {
    SearchViewController *vc = [[SearchViewController alloc] init];
    vc.type = @"1";
    [self.navigationController pushViewController:vc animated:YES];
}

// 点击头像跳个人主页
- (void)headImageViewClick:(UITapGestureRecognizer *)tap {
    FriendTableViewCell *cell = (FriendTableViewCell *) [tap.view.superview superview];
    NSInteger index = cell.headImg.tag - 101;
    PageViewController *vc = [[PageViewController alloc] init];
    ActivitlModel *model = togetherArray[index];
    vc.u_id = model.captain;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 查看评价  咨询队长  关注活动点击事件
- (void)btn1Action:(UIButton *)button {
    NSInteger indexScetion = button.tag - 1001;
    ActivitlModel *model = togetherArray[indexScetion];
    EvaluateViewController *vc = [[EvaluateViewController alloc] init];
    vc.activityId = model.pfID;
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (void)btn2Action:(UIButton *)button {
    NSInteger indexScetion = button.tag - 1002;
    
    ActivitlModel *model = togetherArray[indexScetion];
    NIMSession *session = [NIMSession session:model.wy_accid type:NIMSessionTypeP2P];
    NIMSessionViewController *vc = [[NIMSessionViewController alloc] initWithSession:session];
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (void)btn3Action:(UIButton *)button {
    if ([GetUserDefault(isLogin) boolValue] == NO) {
        LoginViewController*vc = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    NSInteger indexScetion = button.tag - 1003;
    button.selected = !button.selected;
    [self attentionArticleId:indexScetion];
}

// 关注活动
- (void)attentionArticleId:(NSInteger )index {
    ActivitlModel *model = togetherArray[index];
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_activity/follow_attention",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"pfID"      : model.pfID,
                          @"userID"     : GetUserDefault(userID)
                          };
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            model.focusOn = resultObject[@"obj"];
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
        [_tableView registerClass:[ButtonTableViewCell class] forCellReuseIdentifier:@"ButtonCell"];
        [_tableView registerClass:[TagTableViewCell class] forCellReuseIdentifier:@"tagCell"];
        [_tableView registerClass:[FriendTableViewCell class] forCellReuseIdentifier:@"FriendCell"];
        [_tableView registerClass:[FunctionTableViewCell class] forCellReuseIdentifier:@"FunctionCell"];
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
        //        _cycleScrollView.scrollDirection = UICollectionViewScrollDirectionVertical;
        _cycleScrollView.infiniteLoop = YES;
        //        cycleScrollView.pageControlStyle =  SDCycleScrollViewPageContolStyleClassic;
        _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _cycleScrollView.delegate = self;
        //    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        _cycleScrollView.showPageControl = NO;
        //如果有一张图片时不显示pagecontroll
        _cycleScrollView.hidesForSinglePage = YES;
        
        _cycleScrollView.autoScrollTimeInterval = 5.0;
        
        _cycleScrollView.localizationImageNamesGroup = @[@"1.jpg",@"2.jpg",@"3.jpg"];
        _cycleScrollView.titlesGroup = @[@"法拉开始放假了的撒娇",@"发链接刷卡机发的说",@"弗兰克撒酒疯拉萨的"];
        _cycleScrollView.titleLabelHeight = 45;
    }
    return _cycleScrollView;
}

- (SegementView *)segeView {
    if (!_segeView) {
        _segeView = [[SegementView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        _segeView.delegate = self;
        _segeView.isShowUnderLine = NO;
    }
    return _segeView;
}



@end
