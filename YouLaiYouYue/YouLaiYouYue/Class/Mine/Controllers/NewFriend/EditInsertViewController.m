//
//  EditInsertViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/27.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "EditInsertViewController.h"
#import "MyRememberViewController.h"
#import "AddDescribeViewController.h"



#import "InsertTableViewCell.h"
#import "InsertContentTableViewCell.h"
#import "InsertImgTableViewCell.h"
#import "EditRemImgTableViewCell.h"
#import "AlertDescribeView.h"

#import "HXPhotoPicker.h"

@interface EditInsertViewController ()<UITableViewDelegate , UITableViewDataSource ,InsertContentCellDelegate,InsertImgViewDelegate,EditRemImgTableViewCellDelegate ,InsertTitleCellDelegate>

@property (strong , nonatomic) UITableView *tableView;

@property (strong ,nonatomic) NSIndexPath *selectIndexPath;

@property (strong, nonatomic) NSMutableArray *dataArray;

@property (strong, nonatomic) HXDatePhotoToolManager *toolManager;


@end

@implementation EditInsertViewController {
    
    NSMutableArray *imgArray;
    NSMutableArray *textArr;
    NSString *title;  // 标题
    NSString *content; // 内容
    NSMutableArray *imgList;
    NSInteger imgCount;
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
    imgArray = [NSMutableArray new];
    textArr = [NSMutableArray new];
    imgList = [NSMutableArray new];
    self.dataArray = [NSMutableArray array];
    MoreImgModel *model = [[MoreImgModel alloc] init];
    [self.dataArray addObject:model];
    [self getDataFromUrl];
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:@"修改内容" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}


- (void)setUpUI {
    [self addRightButton];
    [self.view addSubview:self.tableView];
}


- (void)setUIAutoLayout {
    
}

- (void)getDataFromUrl {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/RenewInfo",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"id"      : self.actId
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            title = resultObject[@"obj"][@"info"][@"fftitle"];
            content = resultObject[@"obj"][@"info"][@"ffcontect"];
            imgList = resultObject[@"obj"][@"imagesArr"];
            imgCount = imgList.count;
            [weakSelf.tableView reloadData];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

// 右侧按钮
- (void)addRightButton {
    UIButton *rightBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:@"保存" forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    rightBtn.frame = CGRectMake(0, 0, 44, 44);
    UIBarButtonItem* rightBtnItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    [rightBtn addTarget:self action:@selector(rightButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setRightBarButtonItem:rightBtnItem];
}



- (void)rightButton:(UIButton *)button {
    [self.view endEditing:YES];

    
    if (title == nil || [title isEqualToString:@""]) {
        [LCProgressHUD showInfoMsg:@"请填写标题"];
        return;
    }
    if (content == nil || [content isEqualToString:@""]) {
        [LCProgressHUD showInfoMsg:@"请填写内容"];
        return;
    }
//    if (imgArray.count == 0) {
//        [LCProgressHUD showInfoMsg:@"请添加图片"];
//        return;
//    }
    
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"发布" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了按钮1，进入按钮1的事件");
        [self issue];
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"编辑图片描述" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self editorDescribe];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了取消");
    }];
    
    [actionSheet addAction:action1];
    [actionSheet addAction:action2];
    if (imgArray.count == 0) {
        
    }else {
        [actionSheet addAction:action3];
    }
    
    [self presentViewController:actionSheet animated:YES completion:nil];
    
}

- (void)issue {
    NSString *string = [textArr componentsJoinedByString:@"|"];
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/SaveRenewInfo",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"title"   : title,
                          @"content" : content,
                          @"id"      : self.actId,
                          @"uid"     : GetUserDefault(userID),
                          @"describe" : string
                          };
    [LCProgressHUD showLoading:@"正在上传..."];
    __weak typeof(self)weakSelf = self;
    [SwpRequest swpPOSTAddFiles:url parameters:dic isEncrypt:NO fileName:@"images" fileDatas:imgArray swpResultSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            [LCProgressHUD hide];
            [LCProgressHUD showMessage:@"修改成功"];
            for (BaseViewController *controller in self.navigationController.viewControllers) {
                if ([controller isKindOfClass:[MyRememberViewController class]]) {
                    MyRememberViewController *vc = (MyRememberViewController *)controller;
                    [weakSelf.navigationController popToViewController:vc animated:YES];
                }
            }
        }
    } swpResultError:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error, NSString * _Nonnull errorMessage) {
        [LCProgressHUD showFailure:@"修改失败"];
    }];
}

- (void)editorDescribe {
    NSString *string = [textArr componentsJoinedByString:@"|"];
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/SaveRenewInfo",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"title"   : title,
                          @"content" : content,
                          @"id"      : self.actId,
                          @"user_id"     : GetUserDefault(userID),
                          @"describe" : string
                          };
    [LCProgressHUD showLoading:@"正在上传..."];
    __weak typeof(self)weakSelf = self;
    [SwpRequest swpPOSTAddFiles:url parameters:dic isEncrypt:NO fileName:@"images" fileDatas:imgArray swpResultSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            [LCProgressHUD hide];
            [LCProgressHUD showMessage:@"修改成功"];
            AddDescribeViewController *vc = [[AddDescribeViewController alloc] init];
            vc.titleID = weakSelf.actId;
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }
    } swpResultError:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error, NSString * _Nonnull errorMessage) {
        [LCProgressHUD showFailure:@"修改失败"];
    }];
    
}


// 删除图片接口
- (void)deleteImg:(NSString *)imgId {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/SaveDescribe",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" :md5Url,
                          @"id" : imgId,
                          @"type"    : @"1"
                          };
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
//            [LCProgressHUD showMessage:@"删除成功"];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

// 修改描述
- (void)editDescribe:(NSString *)describe withImgId:(NSString *)imgId {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/SaveDescribe",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" :md5Url,
                          @"id" : imgId,
                          @"describe" : describe,
                          @"type"    : @"0"
                          };
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
//            [LCProgressHUD showMessage:@"修改描述成功"];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

#pragma  mark - UITableViewDelegate ,UITableViewDataSource
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    if (indexPath.section == 0) {
        InsertTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InsertCell"];
        cell.title = title;
        cell.delegate = self;
        return cell;
    }
    if (indexPath.section == 1) {
        InsertContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InsertContentCell"];
        cell.delegate = self;
        cell.content = content;
        return cell;
    }
    if (indexPath.section == 2) {
        InsertImgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InsertImgCell"];
        cell.model = self.dataArray[indexPath.section-2];
        cell.delegate = self;
//        cell.imgCount = imgCount;
        __weak typeof(self) weakSelf = self;
        [cell setPhotoViewChangeHeightBlock:^(UITableViewCell *mycell) {
            [weakSelf.tableView reloadRowsAtIndexPaths:@[[weakSelf.tableView indexPathForCell:mycell]] withRowAnimation:0];
        }];
        return cell;
    }
    if (indexPath.section == 3) {
        EditRemImgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EditRemImgTableViewCell"];
        cell.deletage = self;
        cell.imgArr = imgList;
        return cell;
    }
    return nil;
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 40;
    }
    if (indexPath.section == 1) {
        return 200;
    }
    if (indexPath.section == 2) {
        MoreImgModel *model = self.dataArray[indexPath.section-2];
        return model.cellHeight;
    }
    if (indexPath.section == 3) {
        
        return SCREEN_WIDTH+20;
    }
    
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.1;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _selectIndexPath = indexPath;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.view endEditing:YES];

}

// TextView Delegate
- (void)changeInsertTextView:(NSString *)text {
    
    content = text;
}

// title Delegate
- (void)insertTitleTextView:(NSString *)text {
    title = text;
}

- (void)changePhoto:(HXPhotoView *)photoView with:(NSArray<HXPhotoModel *> *)allList {
    [imgArray removeAllObjects];
    [imgArray removeAllObjects];
    // 获取图片
    [self.toolManager getSelectedImageList:allList requestType:HXDatePhotoToolManagerRequestTypeOriginal success:^(NSArray<UIImage *> *imageList) {
        for (UIImage *image in imageList) {
            NSData *data = UIImageJPEGRepresentation(image, 1);
            NSString *str = @"";
            [imgArray addObject:data];
            [textArr addObject:str];
        }
    } failed:^{
        
    }];
}

- (void)deletePhoto:(HXPhotoView *)photoView currentDeleteModel:(HXPhotoModel *)model currentIndex:(NSInteger)index {
    
}

- (void)deleteImgIndexPath:(NSInteger )index {
    NSDictionary *dic = imgList[index];
    [self deleteImg:dic[@"ffpID"]];
    [imgList removeObjectAtIndex:index];
    imgCount = imgList.count;
    NSLog(@"%@",imgList);
    NSIndexPath *inde = [NSIndexPath indexPathForRow:0 inSection:3];
    NSIndexPath *indexf = [NSIndexPath indexPathForRow:0 inSection:2];
    [self.tableView reloadRowsAtIndexPaths:@[inde,indexf] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)changeImgDescribeIndexPath:(NSInteger)index with:(UILabel *)label {
    
    AlertDescribeView *alertView = [AlertDescribeView new];
    [alertView show];
    
    alertView.ytAlertViewMakeSureBlock = ^(NSString *repulse_evaluate_str) {
        NSLog(@"打回了------VC");
        label.text = repulse_evaluate_str;
        NSDictionary *dic = imgList[index];
        [dic setValue:repulse_evaluate_str forKey:@"ffptitle"];
        [self editDescribe:repulse_evaluate_str withImgId:dic[@"ffpID"]];
        
        NSIndexPath *inde = [NSIndexPath indexPathForRow:0 inSection:3];
        [self.tableView reloadRowsAtIndexPaths:@[inde] withRowAnimation:UITableViewRowAnimationNone];
        
    };
    alertView.ytAlertViewCloseBlock = ^{
        NSLog(@"取消了------VC");
    };
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
        [_tableView registerClass:[InsertTableViewCell class] forCellReuseIdentifier:@"InsertCell"];
        [_tableView registerClass:[InsertContentTableViewCell class] forCellReuseIdentifier:@"InsertContentCell"];
        [_tableView registerClass:[InsertImgTableViewCell class] forCellReuseIdentifier:@"InsertImgCell"];
        [_tableView registerClass:[EditRemImgTableViewCell class] forCellReuseIdentifier:@"EditRemImgTableViewCell"];
    }
    return _tableView;
}

- (HXDatePhotoToolManager *)toolManager {
    if (!_toolManager) {
        _toolManager = [[HXDatePhotoToolManager alloc] init];
    }
    return _toolManager;
}

@end
