//
//  TeamViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/9/4.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "TeamViewController.h"
#import "AddDescribeViewController.h"

#import "InsertTableViewCell.h"
#import "InsertContentTableViewCell.h"
#import "InsertImgTableViewCell.h"
#import "TeamTableViewCell.h"
#import "LDYSelectivityAlertView.h"

#import "EditInserModel.h"
#import "HXPhotoPicker.h"
@interface TeamViewController ()<UITableViewDelegate , UITableViewDataSource ,InsertContentCellDelegate , HXPhotoViewDelegate ,InsertImgViewDelegate ,LDYSelectivityAlertViewDelegate ,InsertTitleCellDelegate>

@property (strong , nonatomic) UITableView *tableView;

@property (strong ,nonatomic) NSIndexPath *selectIndexPath;

@property (strong, nonatomic) HXDatePhotoToolManager *toolManager;

@property (strong, nonatomic) NSMutableArray *dataArray;


@end

@implementation TeamViewController {
    
    NSMutableArray *imgArray;
    NSMutableArray *textArray;
    NSString *describeStr;  // 图片描述字符串
    NSString *title;  // 标题
    NSString *content; // 内容
    NSString *placeID;  // 位置id
    NSString *placeStr; // 位置文字
    NSArray *placeArray;
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
    placeStr = @"";
    placeID = @"";
    placeArray = [NSArray new];
    imgArray = [NSMutableArray new];
    textArray = [NSMutableArray new];
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
    [self setNavigationBarTitle:@"添加插文" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}


- (void)setUpUI {
    [self addRightButton];
    [self.view addSubview:self.tableView];
}


- (void)setUIAutoLayout {
    
}

- (void)getDataFromUrl {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/IntercalationPosition",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"id"      : self.friendId
                          };
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            placeArray = [self placeDataArray:resultObject[@"obj"]];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

- (NSMutableArray *)placeDataArray:(NSMutableArray *)param {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in param) {
        EditInserModel *model = [EditInserModel arrayWithDic:dic];
        [array addObject:model];
    }
    return array;
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
    
    if (title == nil || [title isEqualToString:@""] || content == nil || [content isEqualToString:@""] || imgArray.count == 0) {
        
        [LCProgressHUD showInfoMsg:@"请补全信息!"];
        
        return;
    }
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
    [actionSheet addAction:action3];
    [self presentViewController:actionSheet animated:YES completion:nil];
    
    
    
    
    
    
}

// 添加描述
- (void)editorDescribe {
    NSString *describeStr = [textArray componentsJoinedByString:@"|"];
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/Intercalation",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"title"   : title,
                          @"content" : content,
                          @"id"      : self.friendId,
                          @"uid"     : GetUserDefault(userID),
                          @"describe": describeStr,
                          @"position" : placeID
                          };
    [LCProgressHUD showLoading:@"正在上传..."];
    __weak typeof(self)weakSelf = self;
    [SwpRequest swpPOSTAddFiles:url parameters:dic isEncrypt:NO fileName:@"images" fileDatas:imgArray swpResultSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            [LCProgressHUD hide];
            [LCProgressHUD showMessage:@"上传成功成功"];
            AddDescribeViewController *vc = [[AddDescribeViewController alloc] init];
            vc.titleID = resultObject[@"obj"];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        }
        
    } swpResultError:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error, NSString * _Nonnull errorMessage) {
        [LCProgressHUD showFailure:@"发布失败"];
    }];
}

// 发布
- (void)issue {
    NSString *describeStr = [textArray componentsJoinedByString:@"|"];
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/Intercalation",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"title"   : title,
                          @"content" : content,
                          @"id"      : self.friendId,
                          @"uid"     : GetUserDefault(userID),
                          @"describe": describeStr,
                          @"position" : placeID
                          };
    [LCProgressHUD showLoading:@"正在发布..."];
    __weak typeof(self)weakSelf = self;
    [SwpRequest swpPOSTAddFiles:url parameters:dic isEncrypt:NO fileName:@"images" fileDatas:imgArray swpResultSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            [LCProgressHUD hide];
            [LCProgressHUD showMessage:@"发布成功"];
            [weakSelf.navigationController popToRootViewControllerAnimated:YES];
            
        }
        
    } swpResultError:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error, NSString * _Nonnull errorMessage) {
        [LCProgressHUD showFailure:@"发布失败"];
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
        return cell;
    }
    if (indexPath.section == 2) {
        InsertImgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InsertImgCell"];
        cell.model = self.dataArray[indexPath.section-2];
        cell.delegate = self;
        __weak typeof(self) weakSelf = self;
        [cell setPhotoViewChangeHeightBlock:^(UITableViewCell *mycell) {
            [weakSelf.tableView reloadRowsAtIndexPaths:@[[weakSelf.tableView indexPathForCell:mycell]] withRowAnimation:0];
        }];
        return cell;
    }
    TeamTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TeamCell"];
    cell.str = placeStr;
    return cell;
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
    
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.1;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _selectIndexPath = indexPath;
    if (indexPath.section == 0) {
//        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"标题"
//                                                                       message:@"请输入标题"
//                                                                preferredStyle:UIAlertControllerStyleAlert];
//
//        UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
//                                                         handler:^(UIAlertAction * action) {
//                                                             //响应事件
//                                                             //得到文本信息
//                                                             for(UITextField *text in alert.textFields){
//                                                                 NSLog(@"text = %@", text.text);
//                                                                 title = text.text;
//                                                                 [self.tableView reloadRowsAtIndexPaths:@[_selectIndexPath] withRowAnimation:UITableViewRowAnimationNone];
//                                                             }
//                                                         }];
//        UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel
//                                                             handler:^(UIAlertAction * action) {
//                                                                 //响应事件
//                                                                 NSLog(@"action = %@", alert.textFields);
//                                                             }];
//        [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
//            textField.placeholder = @"标题";
//        }];
//
//        [alert addAction:okAction];
//        [alert addAction:cancelAction];
//        [self presentViewController:alert animated:YES completion:nil];
    }
    if (indexPath.section == 3) {
        if (placeArray.count == 0) {
            [LCProgressHUD showMessage:@"暂无插文"];
            return;
        }
        LDYSelectivityAlertView *ldySAV = [[LDYSelectivityAlertView alloc]initWithTitle:@"活动标题" datas:placeArray ifSupportMultiple:NO];
        ldySAV.type = 4;
        ldySAV.delegate = self;
        [ldySAV show];
    }
}

/*
 *(单选)返回数据
 */
- (void)singleChoiceBlockData:(NSString *)data withDataID:(NSString *)dataID withType:(NSString *)typeStr {
    placeStr = data;
    placeID = dataID;
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:3];
    [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationNone];
    
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
    [textArray removeAllObjects];
    // 获取图片
    [self.toolManager getSelectedImageList:allList requestType:HXDatePhotoToolManagerRequestTypeOriginal success:^(NSArray<UIImage *> *imageList) {
        
        for (UIImage *image in imageList) {
            NSData *data = UIImageJPEGRepresentation(image, 1);
            [imgArray addObject:data];
            NSString *str = @"";
            [textArray addObject:str];
        }
    } failed:^{
        
    }];
}


- (void)deletePhoto:(HXPhotoView *)photoView currentDeleteModel:(HXPhotoModel *)model currentIndex:(NSInteger)index {
    
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
        [_tableView registerClass:[TeamTableViewCell class] forCellReuseIdentifier:@"TeamCell"];
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
