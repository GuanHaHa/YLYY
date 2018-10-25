//
//  RemDetailsViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/23.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "RemDetailsViewController.h"
#import "TeamViewController.h"
#import "LoginViewController.h"
#import "RemCommentViewController.h"
#import "PartyViewController.h"
#import "PageViewController.h"

#import "RemDetailsTableViewCell.h"
#import "RelatedTableViewCell.h"
#import "RemTripTableViewCell.h"
#import "RemTripImgTableViewCell.h"
#import "InformationTableViewCell.h"
#import "RemPersonTableViewCell.h"
#import "ShareAlertView.h"


#import "UIView+XLExtension.h"
#import "XLPhotoBrowser.h"
#import "UIButton+XLExtension.h"

#import "ContentModel.h"
#import "ActivityInfoModel.h"
#import "RenewModel.h"
#import "ShareCollectModel.h"

@interface RemDetailsViewController ()<UITableViewDelegate , UITableViewDataSource ,collectionViewDidDelegate,XLPhotoBrowserDelegate, XLPhotoBrowserDatasource>

@property (strong , nonatomic) UITableView *tableView;


@property (strong , nonatomic) ContentModel *contentModel;

@property (strong , nonatomic) ActivityInfoModel *actModel;

@property (strong , nonatomic) UIView *bottomView;

@property (strong , nonatomic) UIButton *btn1;
@property (strong , nonatomic) UIButton *btn2;
@property (strong , nonatomic) UIButton *btn3;
@property (strong , nonatomic) UIButton *btn4;
@property (strong , nonatomic) UIButton *btn5;

@property (nonatomic ,strong) ShareAlertView *sharView;

@property (nonatomic, strong) NSMutableDictionary *heightDict;

@end

@implementation RemDetailsViewController {
    NSMutableArray *renewArray; // 续写
    NSMutableArray *infoArray;
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
    renewArray = [NSMutableArray new];
    infoArray = [NSMutableArray new];
    picUrlArr = [NSMutableArray array];
    [self getDataFromUrl];
    [self getShareData];
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:@"友记详情" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}


- (void)setUpUI {
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
    [self addRightButton];
    
    
    
    
}


- (void)setUIAutoLayout {
    [_bottomView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
    [_bottomView autoSetDimension:ALDimensionHeight toSize:50];
    
   
    
    
}

- (void)addBottomButton {
    if ([_contentModel.inserTtext isEqualToString:@"1"]) {
        [self.bottomView addSubview:self.btn1];
        [self.bottomView addSubview:self.btn2];
        [self.bottomView addSubview:self.btn3];
        [self.bottomView addSubview:self.btn4];
        [self.bottomView addSubview:self.btn5];
    }else {
        [self.bottomView addSubview:self.btn2];
        [self.bottomView addSubview:self.btn3];
        [self.bottomView addSubview:self.btn4];
        [self.bottomView addSubview:self.btn5];
    }
    if ([_contentModel.inserTtext isEqualToString:@"1"]) {
        [_btn1 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeRight];
        [_btn1 autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/5];
        
        [_btn2 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
        [_btn2 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
        [_btn2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_btn1 withOffset:0];
        [_btn2 autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/5];
        
        [_btn3 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
        [_btn3 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
        [_btn3 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_btn2 withOffset:0];
        [_btn3 autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/5];
        
        [_btn4 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
        [_btn4 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
        [_btn4 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_btn3 withOffset:0];
        [_btn4 autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/5];
        
        [_btn5 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
        [_btn5 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
        [_btn5 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_btn4 withOffset:0];
        [_btn5 autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/5];
    }else {
        [_btn2 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeRight];
        [_btn2 autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/4];
        
        [_btn3 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
        [_btn3 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
        [_btn3 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_btn2 withOffset:0];
        [_btn3 autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/4];
        
        [_btn4 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
        [_btn4 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
        [_btn4 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_btn3 withOffset:0];
        [_btn4 autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/4];
        
        [_btn5 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
        [_btn5 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
        [_btn5 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_btn4 withOffset:0];
        [_btn5 autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/4];
    }
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
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否举报此文章" preferredStyle:UIAlertControllerStyleAlert];
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
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/ArticleContent",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    if (GetUserDefault(userID) == nil) {
        SetUserDefault(@"", userID);
    }
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"id"      : self.articleId,
                          @"uid"     : GetUserDefault(userID),
                          @"type"    : @"ios"
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
          _contentModel = [ContentModel arrayWithDic:resultObject[@"obj"][@"content"]];
            if (![_contentModel.fmgotime isEqualToString:@""]) {
                NSString *str = [NSString stringWithFormat:@"开始时间:%@",_contentModel.fmgotime];
                NSDictionary *dic = @{
                                      @"text" : str,
                                      @"img"  : @"img1"
                                      };
                [infoArray addObject:dic];
            }
            if (![_contentModel.fmendtime isEqualToString:@""]) {
                NSString *str = [NSString stringWithFormat:@"结束时间:%@",_contentModel.fmendtime];
                NSDictionary *dic = @{
                                      @"text" : str,
                                      @"img"  : @"img2"
                                      };
                [infoArray addObject:dic];
            }
            if (![_contentModel.percapitacost isEqualToString:@""] && ![_contentModel.percapitacost isEqualToString:@"0.00"]) {
                NSString *str = [NSString stringWithFormat:@"人均费用:%@",_contentModel.percapitacost];
                NSDictionary *dic = @{
                                      @"text" : str,
                                      @"img"  : @"img4"
                                      };
                [infoArray addObject:dic];
            }
            if (![_contentModel.fmaddress isEqualToString:@""]) {
                NSString *str = [NSString stringWithFormat:@"活动地点:%@",_contentModel.fmaddress];
                NSDictionary *dic = @{
                                      @"text" : str,
                                      @"img"  : @"img3"
                                      };
                [infoArray addObject:dic];
            }
            
            
            if ([_contentModel.Collection isEqualToString:@"0"]) {
                weakSelf.btn5.selected = NO;
            }else {
                weakSelf.btn5.selected = YES;
            }
            if ([_contentModel.give isEqualToString:@"0"]) {
                weakSelf.btn4.selected = NO;
            }else {
                weakSelf.btn4.selected = YES;
               weakSelf.btn4.userInteractionEnabled = NO;
                
            }
            _actModel = [ActivityInfoModel arrayWithDic:resultObject[@"obj"][@"activityInfo"]];
            renewArray = [weakSelf renewDataArray:resultObject[@"obj"][@"Renew"]];
            [weakSelf addBottomButton];
            [weakSelf.tableView reloadData];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
    
}

- (NSMutableArray *) renewDataArray:(NSMutableArray *)param {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in param) {
        RenewModel *model = [RenewModel arrayWithDic:dic];
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
                          @"id"      : self.articleId,
                          @"type"    : @"1"
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
        return infoArray.count +1;
    }
    if (section == 1) {
        if ([_actModel.pfID isEqualToString:@""]) {
            return 0;
        }
        return 1;
    }
    RenewModel *model = renewArray[section-2];
    return model.picArr.count+1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return renewArray.count+2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            RemDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RemDetailsCell"];
            [cell.zanBtn addTarget:self action:@selector(attentionAction:) forControlEvents:(UIControlEventTouchUpInside)];
            cell.model = _contentModel;
            UITapGestureRecognizer * tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(headImageViewClick:)];
            tap.numberOfTouchesRequired = 1; //手指数
            tap.numberOfTapsRequired = 1; //tap次数
            cell.headImg.contentMode = UIViewContentModeScaleToFill;
            [cell.headImg addGestureRecognizer:tap];
            return cell;
        }else {
            InformationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InformationCell"];
            cell.dic = infoArray[indexPath.row - 1];
            return cell;
        }
    }
    if (indexPath.section == 1) {
        RelatedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RelatedCell"];
        cell.model = _actModel;
        return cell;
    }else {
        RenewModel *model = renewArray[indexPath.section-2];
        if (indexPath.row == 0) {
            if ([model.type isEqualToString:@"0"]) {
                RemTripTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RemTripCell"];
                cell.model = model;
                return cell;
            }else {
                RemPersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RemPersonCell"];
                cell.model = model;
                cell.zanBtn.tag = 102 + indexPath.section-2;
                [cell.zanBtn addTarget:self action:@selector(attentionPersonAction:) forControlEvents:(UIControlEventTouchUpInside)];
                return cell;
            }
        }else {
            RemTripImgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RemTripImgCell"];
            RenewModel *model = renewArray[indexPath.section-2];
            cell.dic = model.picArr[indexPath.row-1];
            NSDictionary *dic = model.picArr[indexPath.row-1];
            NSString *url = dic[@"ffpurl"];
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
        if (indexPath.row == 0) {
            return 370;
        }
        return 40;
    }
    if (indexPath.section == 1) {
        return 130;
    }else {
        if (indexPath.row == 0) {
            
            RenewModel *model = renewArray[indexPath.section-2];
            CGRect rect = [model.ffcontect boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-40, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
            if ([model.type isEqualToString:@"0"]) {
                
                return rect.size.height +70;
            }else {
                
                return rect.size.height +100;
                
            }
        }else {
            
            RenewModel *model = renewArray[indexPath.section-2];
            NSDictionary *dic = model.picArr[indexPath.row-1];
            CGRect rect = [dic[@"ffptitle"] boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-40, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil];
            
//            return rect.size.height+30+[[self.heightDict objectForKey:dic[@"ffpurl"]] floatValue];
            return rect.size.height+30+SCREEN_WIDTH;
        }
    }
    
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
//    if (section == 2) {
//        return 50;
//    }
    
    return 0.1;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    if (section == 0 || section == 1) {
        return 10;
    }
    
    return 0.1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    if (section == 2) {
//        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
//        view.backgroundColor = [UIColor whiteColor];
//        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH, 50)];
//        label.font = [UIFont fontWithName:@"Arial-BoldMT" size:17];
//        label.text = @"行程介绍";
//        [view addSubview:label];
//
//        return view;
//    }
    
    return nil;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        PartyViewController *vc = [[PartyViewController alloc] init];
        vc.activityId = _actModel.pfID;
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.section >= 2) {
        if (indexPath.row > 0) {
            [picUrlArr removeAllObjects];
            RenewModel *model = renewArray[indexPath.section-2];
            for (NSDictionary *dic in model.picArr) {
                [picUrlArr addObject:dic[@"ffpurl"]];
            }
            // 快速创建并进入浏览模式
            XLPhotoBrowser *browser = [XLPhotoBrowser showPhotoBrowserWithCurrentImageIndex:indexPath.row-1 imageCount:picUrlArr.count datasource:self];
            
            // 设置长按手势弹出的地步ActionSheet数据,不实现此方法则没有长按手势
            //    [browser setActionSheetWithTitle:@"这是一个类似微信/微博的图片浏览器组件" delegate:self cancelButtonTitle:nil deleteButtonTitle:@"删除" otherButtonTitles:@"发送给朋友",@"保存图片",@"收藏",@"投诉",nil];
            
            // 自定义一些属性
            browser.pageDotColor = [UIColor purpleColor]; ///< 此属性针对动画样式的pagecontrol无效
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

// 点击跳个人中心
- (void)headImageViewClick:(UITapGestureRecognizer *)tap {
    PageViewController *vc = [[PageViewController alloc] init];
    vc.u_id = _contentModel.uid;
    [self.navigationController pushViewController:vc animated:YES];
    NSLog(@"%ld",(long)index);
    
}

// 关注队长
- (void)attentionAction:(UIButton *)button {
    if ([GetUserDefault(isLogin) boolValue] == NO) {
        LoginViewController*vc = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    button.selected = !button.selected;
    [self attentionWithId:_contentModel.uid];
    
}

// 关注续写用户
- (void)attentionPersonAction:(UIButton *)button {
    if ([GetUserDefault(isLogin) boolValue] == NO) {
        LoginViewController*vc = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    button.selected = !button.selected;
    NSInteger sectionIndex = button.tag-102;
    RenewModel *model = renewArray[sectionIndex];
    [self attentionWithId:model.uID];
}

- (void)attentionWithId:(NSString *)u_id {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_user/attention_captain",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"userID"     : GetUserDefault(userID),
                          @"attention_userID"  : u_id
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
        LoginViewController *vc = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    TeamViewController *vc = [[TeamViewController alloc] init];
    vc.friendId = _contentModel.fmID;
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)btn2Action:(UIButton *)button {
    if ([GetUserDefault(isLogin) boolValue] == NO) {
        LoginViewController *vc = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    RemCommentViewController *vc = [[RemCommentViewController alloc] init];
    vc.articleId = self.articleId;
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)btn3Action:(UIButton *)button {
    if ([GetUserDefault(isLogin) boolValue] == NO) {
        LoginViewController *vc = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    [self.sharView showMenuView];
}
- (void)btn4Action:(UIButton *)button {
    if ([GetUserDefault(isLogin) boolValue] == NO) {
        LoginViewController *vc = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    button.selected = !button.selected;
    if (button.selected == YES) {
        [self zanArticle];
    }
    
}
- (void)btn5Action:(UIButton *)button {
    if ([GetUserDefault(isLogin) boolValue] == NO) {
        LoginViewController*vc = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    button.selected = !button.selected;
    if (button.selected == YES) {
        [self collectionArticle:@"0"];
    }else {
        [self collectionArticle:@"1"];
    }
}

// 点赞
- (void)zanArticle {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/Give",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"id"      : _contentModel.fmID,
                          @"uid"    : GetUserDefault(userID)
                          };
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            _btn4.userInteractionEnabled = NO;
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
    
}
// 收藏
- (void)collectionArticle:(NSString *)type {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/Collection",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"id"      : _contentModel.fmID,
                          @"type"    : type,
                          @"uid"     : GetUserDefault(userID)
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
        
        //        [ShareCollectModel getCollect:@"1"];
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
        //        _mineTableView.backgroundColor = [UIColor blackColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView . sectionFooterHeight = 1.0;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [_tableView registerClass:[RemDetailsTableViewCell class] forCellReuseIdentifier:@"RemDetailsCell"];
        [_tableView registerClass:[InformationTableViewCell class] forCellReuseIdentifier:@"InformationCell"];
        [_tableView registerClass:[RelatedTableViewCell class] forCellReuseIdentifier:@"RelatedCell"];
        [_tableView registerClass:[RemTripTableViewCell class] forCellReuseIdentifier:@"RemTripCell"];
        [_tableView registerClass:[RemTripImgTableViewCell class] forCellReuseIdentifier:@"RemTripImgCell"];
        [_tableView registerClass:[RemPersonTableViewCell class] forCellReuseIdentifier:@"RemPersonCell"];
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
        [_btn1 setImage:[UIImage imageNamed:@"details-article"] forState:(UIControlStateNormal)];
        [_btn1 setTitle:@"插文" forState:UIControlStateNormal];
        [_btn1 setTitleColor:UIColorFromRGB(0x333333) forState:(UIControlStateNormal)];
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
        [_btn2 setImage:[UIImage imageNamed:@"details-comments"] forState:(UIControlStateNormal)];
        [_btn2 setTitle:@"评论" forState:UIControlStateNormal];
        [_btn2 setTitleColor:UIColorFromRGB(0x333333) forState:(UIControlStateNormal)];
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
        [_btn3 setImage:[UIImage imageNamed:@"details-share"] forState:(UIControlStateNormal)];
        [_btn3 setTitle:@"分享" forState:UIControlStateNormal];
        [_btn3 setTitleColor:UIColorFromRGB(0x333333) forState:(UIControlStateNormal)];
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
        [_btn4 setImage:[UIImage imageNamed:@"details-praise"] forState:(UIControlStateNormal)];
        [_btn4 setImage:[UIImage imageNamed:@"details-parise0"] forState:UIControlStateSelected];
        [_btn4 setTitleColor:UIColorFromRGB(0xff9d00) forState:(UIControlStateSelected)];
        [_btn4 setTitle:@"点赞" forState:UIControlStateNormal];
        [_btn4 setTitle:@"点赞" forState:UIControlStateSelected];
        [_btn4 setTitleColor:UIColorFromRGB(0x333333) forState:(UIControlStateNormal)];
        _btn4.titleLabel.font = [UIFont systemFontOfSize:12];
        [_btn4 addTarget:self action:@selector(btn4Action:) forControlEvents:(UIControlEventTouchUpInside)];
        _btn4.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
        [_btn4 setImageEdgeInsets:UIEdgeInsetsMake(-15, 0, 0, -30)];
        [_btn4 setTitleEdgeInsets:UIEdgeInsetsMake(0, -15, -20, 0)];
    }
    return _btn4;
}
- (UIButton *)btn5 {
    if (!_btn5) {
        _btn5 = [[UIButton alloc] initForAutoLayout];
        [_btn5 setTitle:@"收藏" forState:UIControlStateNormal];
        [_btn5 setTitle:@"收藏" forState:UIControlStateSelected];
        [_btn5 setImage:[UIImage imageNamed:@"details-Star"] forState:(UIControlStateNormal)];
        [_btn5 setTitleColor:UIColorFromRGB(0x333333) forState:(UIControlStateNormal)];
        [_btn5 setImage:[UIImage imageNamed:@"collection"] forState:(UIControlStateSelected)];
        [_btn5 setTitleColor:UIColorFromRGB(0xff9d00) forState:(UIControlStateSelected)];
        _btn5.titleLabel.font = [UIFont systemFontOfSize:12];
        [_btn5 addTarget:self action:@selector(btn5Action:) forControlEvents:(UIControlEventTouchUpInside)];
        _btn5.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;//使图片和文字水平居中显示
        [_btn5 setImageEdgeInsets:UIEdgeInsetsMake(-15, 0, 0, -30)];
        [_btn5 setTitleEdgeInsets:UIEdgeInsetsMake(0, -15, -20, 0)];
    }
    return _btn5;
}

- (NSMutableDictionary *)heightDict {
    if (!_heightDict) {
        _heightDict = @{}.mutableCopy;
    }
    return _heightDict;
}


@end
