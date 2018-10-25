//
//  PartyViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/18.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "PartyViewController.h"
#import "SignUpViewController.h"
#import "SignPayViewController.h"
#import "NIMSessionViewController.h"
#import "LoginViewController.h"
#import "PageViewController.h"


#import "DetailsTableViewCell.h"
#import "ParticipantTableViewCell.h"
#import "TripTableViewCell.h"
#import "TripImgTableViewCell.h"
#import "ShareAlertView.h"

#import "UIView+XLExtension.h"
#import "XLPhotoBrowser.h"
#import "UIButton+XLExtension.h"

#import "ActivityModel.h"
#import "InfoActModel.h"
#import "SignModel.h"
#import "ShareCollectModel.h"

#import <UIImageView+WebCache.h>

@interface PartyViewController ()<UITableViewDelegate , UITableViewDataSource ,collectionViewDidDelegate ,XLPhotoBrowserDelegate, XLPhotoBrowserDatasource ,ParticipantCollectionDelegate>

@property (strong , nonatomic) UITableView *tableView;

@property (strong , nonatomic) ActivityModel *ActivityModel;

@property (strong , nonatomic) UIView *bottomView;

@property (nonatomic ,strong) ShareAlertView *sharView;

@property (strong , nonatomic) UIButton *btn1;
@property (strong , nonatomic) UIButton *btn2;
@property (strong , nonatomic) UIButton *btn3;
@property (strong , nonatomic) UIButton *btn4;

@property (nonatomic, strong) NSMutableDictionary *heightDict;

@end

@implementation PartyViewController {
    NSArray *infoArray; // 内容
    NSArray *signArray; // 报名人 数组
    NSDictionary *shareDic;
    NSMutableArray *picUrlArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];

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
    shareDic = [NSDictionary new];
    picUrlArr = [NSMutableArray array];
    [self getDataFromUrl];
    [self getShareData];
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self addRightButton];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:@"友聚详情" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}


- (void)setUpUI {
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
    [self.bottomView addSubview:self.btn1];
    [self.bottomView addSubview:self.btn2];
    [self.bottomView addSubview:self.btn3];
    [self.bottomView addSubview:self.btn4];
    
}


- (void)setUIAutoLayout {
    
    [_bottomView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
    [_bottomView autoSetDimension:ALDimensionHeight toSize:50];
    
    [_btn1 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeRight];
    [_btn1 autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/2/3];
    
    [_btn2 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [_btn2 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    [_btn2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_btn1 withOffset:0];
    [_btn2 autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/2/3];
    
    [_btn3 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [_btn3 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    [_btn3 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_btn2 withOffset:0];
    [_btn3 autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/2/3];
    
    [_btn4 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [_btn4 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    [_btn4 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_btn3 withOffset:0];
    [_btn4 autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/2];
}

// 右侧按钮
- (void)addRightButton {
    UIButton *rightBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:@"举报" forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    rightBtn.frame = CGRectMake(0, 0, 44, 44);
    UIBarButtonItem* rightBtnItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    [rightBtn addTarget:self action:@selector(rightButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setRightBarButtonItem:rightBtnItem];
}

- (void)rightButton:(UIButton *)button {
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否举报此活动" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"举报" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
       
        [LCProgressHUD showMessage:@"举报成功"];
        
    }];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertVC addAction:cancel];
    [alertVC addAction:ok];
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)getDataFromUrl {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_activity/activity_info",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    if (GetUserDefault(userID) == nil) {
        SetUserDefault(@"", userID);
    }
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"pfID"      : self.activityId,
                          @"userID"     : GetUserDefault(userID)
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            
            _ActivityModel = [ActivityModel arrayWithDic:resultObject[@"obj"]];
            infoArray = [weakSelf infoDataArray:resultObject[@"obj"][@"info_list"]];
            signArray = [weakSelf signDataArray:resultObject[@"obj"][@"user_list"]];
            if ([_ActivityModel.attention isEqualToString:@"0"]) {
                _btn3.selected = NO;
            }else {
                _btn3.selected = YES;
            }
            [weakSelf.tableView reloadData];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
    
}

- (NSMutableArray *) infoDataArray:(NSMutableArray *)param {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in param) {
        InfoActModel *model = [InfoActModel arrayWithDic:dic];
        [array addObject:model];
    }
    return array;
}

- (NSMutableArray *) signDataArray:(NSMutableArray *)param {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in param) {
        SignModel *model = [SignModel arrayWithDic:dic];
        [array addObject:model];
    }
    return array;
}

// 获取分享信息
- (void)getShareData {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_activity/SharingInformation",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"id"      : self.activityId,
                          @"type"    : @"0"
                          };
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            shareDic = resultObject[@"obj"];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

#pragma  mark - UITableViewDelegate ,UITableViewDataSource
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return 1;
    }
    InfoActModel *model = infoArray[section-2];
    return model.image_list.count+1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return infoArray.count+2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    if (indexPath.section == 0) {
        DetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailsCell"];
        cell.model = _ActivityModel;
        [cell.zanBtn addTarget:self action:@selector(attentionAction:) forControlEvents:(UIControlEventTouchUpInside)];
        UITapGestureRecognizer * tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headImageViewClick:)];
        tap.numberOfTouchesRequired = 1; //手指数
        tap.numberOfTapsRequired = 1; //tap次数
        cell.headImg.contentMode = UIViewContentModeScaleToFill;
        [cell.headImg addGestureRecognizer:tap];
        return cell;
    }
    if (indexPath.section == 1) {
        ParticipantTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PartCell"];
        cell.model = _ActivityModel;
        cell.signArray = signArray;
        cell.delegate = self;
        return cell;
    }else {
        if (indexPath.row == 0) {
            TripTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TripCell"];
            cell.model = infoArray[indexPath.section-2];
            return cell;
        }else {
            TripImgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TripImgCell"];
            InfoActModel *model = infoArray[indexPath.section-2];
            cell.dic = model.image_list[indexPath.row-1];
            NSDictionary *dic = model.image_list[indexPath.row-1];
            NSString *url = dic[@"pic"];
            
            [cell.img sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil options:SDWebImageRetryFailed completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                if (image.size.height) {
                    /**  < 图片宽度 >  */
                    CGFloat imageW = [UIScreen mainScreen].bounds.size.width;
                    /**  <根据比例 计算图片高度 >  */
                    CGFloat ratio = image.size.height / image.size.width;
                    /**  < 图片高度 + 间距 >  */
                    CGFloat imageH = ratio * imageW;
                                        
                    /**  < 缓存图片高度 没有缓存则缓存 刷新indexPath >  */
                    if (![[self.heightDict allKeys] containsObject:url]) {
                        [self.heightDict setObject:@(imageH) forKey:url];
                        [self.tableView beginUpdates];
                        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
                        [self.tableView endUpdates];
                    }
                }
            }];
            return cell;
        }
    }
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return 640;
    }
    if (indexPath.section == 1) {
        return 130;
    }else {
        if (indexPath.row == 0) {
            InfoActModel *model = infoArray[indexPath.section-2];
            CGRect rect = [model.content boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-40, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
            
            return rect.size.height +70;
            
        }else {
            InfoActModel *model = infoArray[indexPath.section-2];
            NSDictionary *dic = model.image_list[indexPath.row-1];
            CGRect rect = [dic[@"text_info"] boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-40, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
            
//            return rect.size.height +[[self.heightDict objectForKey:dic[@"pic"]] floatValue] +30;
            return rect.size.height + SCREEN_WIDTH +30;
        }
    }
    
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section == 2) {
        return 0.1;
    }
    
    return 0.1;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    if (section == 0 || section == 1) {
        return 10;
    }
    
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section >= 2) {
        if (indexPath.row > 0) {
            [picUrlArr removeAllObjects];
            InfoActModel *model = infoArray[indexPath.section-2];
            for (NSDictionary *dic in model.image_list) {
                [picUrlArr addObject:dic[@"pic"]];
            }
            // 快速创建并进入浏览模式
            XLPhotoBrowser *browser = [XLPhotoBrowser showPhotoBrowserWithCurrentImageIndex:indexPath.row-1 imageCount:picUrlArr.count datasource:self];
            
            // 设置长按手势弹出的地步ActionSheet数据,不实现此方法则没有长按手势
            //    [browser setActionSheetWithTitle:@"这是一个类似微信/微博的图片浏览器组件" delegate:self cancelButtonTitle:nil deleteButtonTitle:@"删除" otherButtonTitles:@"发送给朋友",@"保存图片",@"收藏",@"投诉",nil];
            
            // 自定义一些属性
            browser.pageDotColor = [UIColor grayColor]; ///< 此属性针对动画样式的pagecontrol无效
            browser.currentPageDotColor = [UIColor grayColor];
            browser.pageControlStyle = XLPhotoBrowserPageControlStyleAnimated;///< 修改底部pagecontrol的样式为系统样式,默认是弹性动画的样式
            
        }
    }
}

/**
 *  返回指定位置的高清图片URL
 *
 *  @param browser 浏览器
 *  @param index   位置索引
 *
 *  @return 返回高清大图索引
 */
- (NSURL *)photoBrowser:(XLPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index
{
    return [NSURL URLWithString:picUrlArr[index]];
}

- (void)didCollectionCellItem:(NSInteger)item {
    SignModel *model = signArray[item];
    if ([model.noname isEqualToString:@"1"]) {
        [LCProgressHUD showMessage:@"无法查看匿名信息"];
        return;
    }else {
        PageViewController *vc = [[PageViewController alloc] init];
        vc.u_id = model.u_ID;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

// 点击跳个人中心
- (void)headImageViewClick:(UITapGestureRecognizer *)tap {
    PageViewController *vc = [[PageViewController alloc] init];
    vc.u_id = _ActivityModel.captain;
    [self.navigationController pushViewController:vc animated:YES];
    NSLog(@"%ld",(long)index);
    
}

// 关注领队
- (void)attentionAction:(UIButton *)button {
    if ([GetUserDefault(isLogin) boolValue] == NO) {
        LoginViewController*vc = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    button.selected = !button.selected;
    [self attention];
}
// 关注领队
- (void)attention {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_user/attention_captain",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"userID"     : GetUserDefault(userID),
                          @"attention_userID"  : _ActivityModel.captain
                          };
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
    
}


#pragma mark - 底部 咨询 分享 关注
- (void)btn1Action:(UIButton *)button {
    if ([GetUserDefault(isLogin) boolValue] == NO) {
        LoginViewController*vc = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    NIMSession *session = [NIMSession session:_ActivityModel.wy_accid type:NIMSessionTypeP2P];
    NIMSessionViewController *vc = [[NIMSessionViewController alloc] initWithSession:session];
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (void)btn2Action:(UIButton *)button {
    [self.sharView showMenuView];
}

// 关注活动
- (void)btn3Action:(UIButton *)button {
    if ([GetUserDefault(isLogin) boolValue] == NO) {
        LoginViewController*vc = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    button.selected = !button.selected;
    [self attentionArticle];
    
}

#pragma mark - 得判断一下用户是否实名认证(在我的资料实名认证)   不认证不让报名
- (void)btn4Action:(UIButton *)button {
    if ([GetUserDefault(isLogin) boolValue] == NO) {
        LoginViewController*vc = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    if ([_ActivityModel.real_name isEqualToString:@"0"]) {
        [LCProgressHUD showInfoMsg:@"请去个人资料实名认证"];
        return;
    }else {
        if ([_ActivityModel.if_pay isEqualToString:@"2"]) {
            SignPayViewController *vc = [[SignPayViewController alloc] init];
            vc.model = _ActivityModel;
            vc.inviteId = @"";
            [self.navigationController pushViewController:vc animated:YES];
        }else {
            SignUpViewController *vc = [[SignUpViewController alloc] init];
            vc.model = _ActivityModel;
            vc.inviteId = @"";
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    
    
}

// 关注活动
- (void)attentionArticle {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_activity/follow_attention",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"pfID"      : _ActivityModel.pfID,
                          @"userID"     : GetUserDefault(userID)
                          };
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}



- (ShareAlertView *)sharView
{
    if (!_sharView) {
        _sharView = [[ShareAlertView alloc] init];
        _sharView.delegate = self;
        _sharView.isShare = YES;
        _sharView.isCollect = NO;
    }
    return _sharView;
}
- (void)collectionViewDid:(NSInteger)didItem
{
    if (didItem < 3) {
        [ShareCollectModel shareTextToPlatformType:didItem withDataDic:shareDic];
    }
    if (didItem == 3) {
        
    }
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
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView . sectionFooterHeight = 1.0;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [_tableView registerClass:[DetailsTableViewCell class] forCellReuseIdentifier:@"DetailsCell"];
        [_tableView registerClass:[ParticipantTableViewCell class] forCellReuseIdentifier:@"PartCell"];
        [_tableView registerClass:[TripTableViewCell class] forCellReuseIdentifier:@"TripCell"];
        [_tableView registerClass:[TripImgTableViewCell class] forCellReuseIdentifier:@"TripImgCell"];
    }
    return _tableView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initForAutoLayout];
    }
    return _bottomView;
}

- (UIButton *)btn1 {
    if (!_btn1) {
        _btn1 = [[UIButton alloc] initForAutoLayout];
        [_btn1 setImage:[UIImage imageNamed:@"consult"] forState:(UIControlStateNormal)];
        [_btn1 setTitle:@"咨询" forState:UIControlStateNormal];
        [_btn1 setTitleColor:UIColorFromRGB(0x979797) forState:(UIControlStateNormal)];
        _btn1.titleLabel.font = [UIFont systemFontOfSize:12];
        [_btn1 addTarget:self action:@selector(btn1Action:) forControlEvents:(UIControlEventTouchUpInside)];
        _btn1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
        [_btn1 setImageEdgeInsets:UIEdgeInsetsMake(-15, 0, 0, -25)];
        [_btn1 setTitleEdgeInsets:UIEdgeInsetsMake(0, -15, -20, 0)];
    }
    return _btn1;
}
- (UIButton *)btn2 {
    if (!_btn2) {
        _btn2 = [[UIButton alloc] initForAutoLayout];
        [_btn2 setImage:[UIImage imageNamed:@"share-y"] forState:(UIControlStateNormal)];
        [_btn2 setTitle:@"分享" forState:UIControlStateNormal];
        [_btn2 setTitleColor:UIColorFromRGB(0x979797) forState:(UIControlStateNormal)];
        _btn2.titleLabel.font = [UIFont systemFontOfSize:12];
        [_btn2 addTarget:self action:@selector(btn2Action:) forControlEvents:(UIControlEventTouchUpInside)];
        _btn2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
        [_btn2 setImageEdgeInsets:UIEdgeInsetsMake(-15, 0, 0, -25)];
        [_btn2 setTitleEdgeInsets:UIEdgeInsetsMake(0, -15, -20, 0)];
    }
    return _btn2;
}

- (UIButton *)btn3 {
    if (!_btn3) {
        _btn3 = [[UIButton alloc] initForAutoLayout];
        [_btn3 setImage:[UIImage imageNamed:@"attentioned"] forState:(UIControlStateNormal)];
        [_btn3 setImage:[UIImage imageNamed:@"con"] forState:UIControlStateSelected];
        [_btn3 setTitleColor:UIColorFromRGB(0x979797) forState:(UIControlStateSelected)];
        [_btn3 setTitle:@"关注" forState:UIControlStateNormal];
        [_btn3 setTitle:@"关注" forState:UIControlStateSelected];
        [_btn3 setTitleColor:UIColorFromRGB(0x979797) forState:(UIControlStateNormal)];
        _btn3.titleLabel.font = [UIFont systemFontOfSize:12];
        [_btn3 addTarget:self action:@selector(btn3Action:) forControlEvents:(UIControlEventTouchUpInside)];
        _btn3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
        [_btn3 setImageEdgeInsets:UIEdgeInsetsMake(-15, 0, 0, -25)];
        [_btn3 setTitleEdgeInsets:UIEdgeInsetsMake(0, -15, -20, 0)];
    }
    return _btn3;
}

- (UIButton *)btn4 {
    if (!_btn4) {
        _btn4 = [[UIButton alloc] initForAutoLayout];
        [_btn4 setTitle:@"报名参加" forState:UIControlStateNormal];
        _btn4.backgroundColor = UIColorFromRGB(0xff9d00);
        [_btn4 setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        _btn4.titleLabel.font = [UIFont systemFontOfSize:12];
        [_btn4 addTarget:self action:@selector(btn4Action:) forControlEvents:(UIControlEventTouchUpInside)];
        _btn4.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
    }
    return _btn4;
}

- (NSMutableDictionary *)heightDict {
    if (!_heightDict) {
        _heightDict = @{}.mutableCopy;
    }
    return _heightDict;
}


@end
