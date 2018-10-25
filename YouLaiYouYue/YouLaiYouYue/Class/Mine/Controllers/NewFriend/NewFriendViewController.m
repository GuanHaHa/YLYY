//
//  NewFriendViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/27.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "NewFriendViewController.h"
#import "InsertTextViewController.h"


#import "NewTitleTableViewCell.h"
#import "NewImgTableViewCell.h"
#import "NewOtherTableViewCell.h"
#import "PickerView.h"
#import "LDYSelectivityAlertView.h"
#import "DataView.h"


#import "HeadlineModel.h"  // 活动标题
#import "NewModel.h"
#import "TagModel.h"  // 标签model

@interface NewFriendViewController ()<UITableViewDelegate , UITableViewDataSource ,UINavigationControllerDelegate ,UIImagePickerControllerDelegate , DeleteImgDelegate ,PickerViewResultDelegate ,LDYSelectivityAlertViewDelegate ,DatePickerViewDelegate , NewCellCityDelegate ,NewTitleCellDelegate>

@property (strong , nonatomic) UITableView *tableView;

@property (strong ,nonatomic) NSIndexPath *selectIndexPath;

// 活动标题   与 标题
@property (nonatomic, strong) NSIndexPath *selAlertIndexPath;

@property (strong , nonatomic) NewModel *model;

@property (nonatomic, strong) NSMutableArray * dataArr;
@property (nonatomic, strong) NSMutableArray * boolArr;

@property (strong, nonatomic) DataView *dateView;

@end

@implementation NewFriendViewController {
    
    NSArray *nameArr;
    NSArray *picArr;
    
    NSArray *headLineArr;  // 活动标题数组
    NSMutableArray *tagArr; // 标签
    
   
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
    
    NSArray * rowsArr = @[@(7)];
    NSMutableArray * friendArr = [[NSMutableArray alloc] init];
    for (int j = 0; j < [rowsArr[0] intValue]; j++) {
        
        [friendArr addObject:@(j)];
    }
    [self.dataArr addObject:friendArr];
    [self.boolArr addObject:@NO];
    
    self.model = [[NewModel alloc] init];
    self.model.insertatext = @"1";
    self.model.startTime = @"";
    self.model.endTime = @"";
    self.model.site = @"";
    self.model.cost = @"";
    self.model.tagId = @"";
    self.model.password = @"";
    self.model.activityTitleId = @"";
    nameArr = @[@"活动地点",@"人均费用",@"开始时间",@"结束时间",@"活动标题",@"浏览加密",@"是否允许队友插文"];
    picArr = @[@"img3",@"img4",@"img1",@"img2",@"activities-require",@"创建文章-锁",@"person_is_single-1"];
    headLineArr = [NSArray new];
    tagArr = [NSMutableArray new];
    
    
    [self getActivityDataFromUrl];
    [self getTagDataFromUrl];
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:@"创建友记" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}


- (void)setUpUI {
    [self addRightButton];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.dateView];
}


- (void)setUIAutoLayout {
    
}

- (void)getDataFromUrl {
    
    
}

// 右侧按钮
- (void)addRightButton {
    UIButton *rightBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:@"完成" forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    rightBtn.frame = CGRectMake(0, 0, 44, 44);
    UIBarButtonItem* rightBtnItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    [rightBtn addTarget:self action:@selector(rightButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setRightBarButtonItem:rightBtnItem];
}

- (void)rightButton:(UIButton *)button {
    
    if ([_model.title isEqualToString:@""] || _model.title == nil || _model.img == nil || _model.tagId == nil || [_model.tagId isEqualToString:@""] ) {

        [LCProgressHUD showMessage:@"请补全信息"];

        return;

    }
    
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:nil
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * action) {
                                                             //响应事件
                                                             NSLog(@"action = %@", action);
                                                         }];

    UIAlertAction* saveAction = [UIAlertAction actionWithTitle:@"发布" style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * action) {
                                                           // 保存草稿
                                                           [self issue:@"0"];
                                                           NSLog(@"action = %@", action);
                                                       }];
    UIAlertAction* nextAction = [UIAlertAction actionWithTitle:@"下一步" style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * action) {
                                                           
                                                           // 下一步
                                                           
                                                           [self next:@"1"];
                                                           NSLog(@"action = %@", action);
                                                       }];
    
    
    [alert addAction:cancelAction];
//    [alert addAction:deleteAction];
    [alert addAction:saveAction];
    [alert addAction:nextAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}



// 获取活动标题数据
- (void)getActivityDataFromUrl {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/FriendsList",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url ,
                          @"uid"     : GetUserDefault(userID)
                          };
    
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            headLineArr = [weakSelf dataArray:resultObject[@"obj"]];
        }
    } swpResultError:^(id resultObject, NSString *errorMessage) {
        
    }];
    
}

- (NSMutableArray *) dataArray:(NSMutableArray *)param{
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dict in param) {
        HeadlineModel *model = [HeadlineModel arrayWithDic:dict];
        [array addObject:model];
    }
    return array;
}

// 获取标签
- (void)getTagDataFromUrl {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_public/Label",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"type"    : @"1"
                          };
    
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            tagArr = [weakSelf tagArray:resultObject[@"obj"]];
        }
    } swpResultError:^(id resultObject, NSString *errorMessage) {
        
    }];
    
}

- (NSMutableArray *) tagArray:(NSMutableArray *)param{
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dict in param) {
        TagModel *model = [TagModel arrayWithDic:dict];
        [array addObject:model];
    }
    return array;
}

// 发布 保存草稿
- (void)issue:(NSString *)type {
    
    
    
    if (GetUserDefault(userID) == nil) {
        SetUserDefault(@"", userID);
    }
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/InsertArticle",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key"   : md5Url,
                          @"fmtitle"   : _model.title,
                          @"fmaddress" : _model.site,
                          @"uid"       : GetUserDefault(userID),
                          @"fmlable"   : _model.tagId,
                          @"fmgotime"  : _model.startTime,
                          @"fmendtime" : _model.endTime,
                          @"percapitacost"  : _model.cost,
                          @"accesspassword" : _model.password,
                          @"activity_id" : _model.activityTitleId,
                          @"fmpic"       : _model.img,
                          @"type"        : type,
                          @"insertatext" : _model.insertatext
                          };
    
    __weak typeof(self)weakSelf = self;
    [SwpRequest swpPOSTAddFile:url parameters:dic isEncrypt:NO fileName:@"fmpic" fileData:_model.img swpResultSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            [LCProgressHUD showMessage:@"发布成功"];
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }
    } swpResultError:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error, NSString * _Nonnull errorMessage) {
        
    }];
    
    
}

// 下一步
// 发布
- (void)next:(NSString *)type {
    
    if (GetUserDefault(userID) == nil) {
        SetUserDefault(@"", userID);
    }
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/InsertArticle",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key"   : md5Url,
                          @"fmtitle"   : _model.title,
                          @"fmaddress" : _model.site,
                          @"uid"       : GetUserDefault(userID),
                          @"fmlable"   : _model.tagId,
                          @"fmgotime"  : _model.startTime,
                          @"fmendtime" : _model.endTime,
                          @"percapitacost" : _model.cost,
                          @"accesspassword" : _model.password,
                          @"activity_id" : _model.activityTitleId,
                          @"fmpic"       : _model.img,
                          @"type"        : type,
                          @"insertatext" : _model.insertatext
                          };
    __weak typeof(self)weakSelf = self;
    [SwpRequest swpPOSTAddFile:url parameters:dic isEncrypt:NO fileName:@"fmpic" fileData:_model.img swpResultSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            
            
            InsertTextViewController *vc = [[InsertTextViewController alloc] init];
            vc.friendId = resultObject[@"obj"][@"id"];
            [weakSelf.navigationController pushViewController:vc animated:YES];
            
            
        }
    } swpResultError:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error, NSString * _Nonnull errorMessage) {
        
    }];
    
    
}


#pragma  mark - UITableViewDelegate ,UITableViewDataSource
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 3) {
        if ([self.boolArr[section - 3] boolValue] == NO) {
            
            return 0;
        }else {
            
            return [self.dataArr[section -3] count];
        }
    }
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    if (indexPath.section == 0) {
        
        NewTitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewTitleCell"];
        cell.model = _model;
        cell.delegate = self;
        return cell;
    }
    if (indexPath.section == 1) {
        NewImgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewImgCell"];
        cell.delegate = self;
        return cell;
    }else if (indexPath.section == 2){
        NewOtherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewOtherCell"];
        cell.index = indexPath;
        cell.img.image = [UIImage imageNamed:@"标签"];
        cell.titleLabel.text = @"标签";
        cell.model = self.model;
        return cell;
    }else {
        NewOtherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewOtherCell"];
        cell.index = indexPath;
        cell.img.image = [UIImage imageNamed:picArr[indexPath.row]];
        cell.titleLabel.text = nameArr[indexPath.row];
        cell.model = self.model;
        cell.delegate = self;
        return cell;
    }
    
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 1) {
        return 185;
    }
    
    return 45;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 3) {
        return 50;
    }
    return 0.1;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 3) {
        //创建header的view
        UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 5)];
        headerView.tag = 2016 + section;
        headerView.backgroundColor = [UIColor whiteColor];
        
        //添加imageview
        UIImageView * iv = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 20, 20)];
        
        //三目运算选择展开或者闭合时候的图标
        iv.image = [_boolArr[section -3] boolValue] ? [UIImage imageNamed:@"buddy_header_arrow_down"] : [UIImage imageNamed:@"buddy_header_arrow_right"];
        [headerView addSubview:iv];
        
        //添加标题label
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(35, 0, self.view.frame.size.width - 100, 50)];
        [headerView addSubview:label];
        
        //添加分组人数和在线人数显示的label
        UILabel * labelR = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width-60, 0, 60, 50)];
        labelR.textAlignment = NSTextAlignmentCenter;
        labelR.text = @"更多";
        [headerView addSubview:labelR];
        
        //添加轻扣手势
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGR:)];
        [headerView addGestureRecognizer:tap];
        
        return headerView;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _selectIndexPath = indexPath;
    if (indexPath.section == 0) {
        
    }
    if (indexPath.section == 1) {
        
        [self openPicker];
        
    }
    if (indexPath.section == 2) {
        if (tagArr.count == 0) {
            [LCProgressHUD showMessage:@"暂无标签"];
            return;
        }
        LDYSelectivityAlertView *ldySAV = [[LDYSelectivityAlertView alloc]initWithTitle:@"标签" datas:tagArr ifSupportMultiple:NO];
        ldySAV.type = 2;
        ldySAV.delegate = self;
        [ldySAV show];
    }else if (indexPath.section > 2){
        if (indexPath.row == 4) {
            
            if (headLineArr.count == 0) {
                [LCProgressHUD showMessage:@"暂无活动"];
                return;
            }
            LDYSelectivityAlertView *ldySAV = [[LDYSelectivityAlertView alloc]initWithTitle:@"活动标题" datas:headLineArr ifSupportMultiple:NO];
            ldySAV.type = 1;
            ldySAV.delegate = self;
            [ldySAV show];
        }
        if (indexPath.row == 0) {
            
        }
        if (indexPath.row == 1) {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"人均费用" message:nil preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //响应事件
                //得到文本信息
                for(UITextField *text in alert.textFields){
                    NSLog(@"text = %@", text.text);
                    _model.cost = text.text;
                    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:3];
                    //2.将indexPath添加到数组
                    NSArray <NSIndexPath *> *indexPathArray = @[indexPath];
                    //3.传入数组，对当前cell进行刷新
                    [self.tableView reloadRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationNone];
                }
            }];
            UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                textField.placeholder = @"人均费用";
                textField.keyboardType = UIKeyboardTypePhonePad;
            }];
            [alert addAction:okAction];
            [alert addAction:cancelAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
        if (indexPath.row == 2) {
            [UIView animateWithDuration:0.3 animations:^{
                self.dateView.frame = CGRectMake(0, self.view.frame.size.height - 300, self.view.frame.size.width, 300);
                [self.dateView show];
            }];
        }
        if (indexPath.row == 3) {
            [UIView animateWithDuration:0.3 animations:^{
                self.dateView.frame = CGRectMake(0, self.view.frame.size.height - 300, self.view.frame.size.width, 300);
                [self.dateView show];
            }];
            
        }
        if (indexPath.row == 5) {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"密码" message:@"请设置密码" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //响应事件
                //得到文本信息
                for(UITextField *text in alert.textFields){
                    NSLog(@"text = %@", text.text);
                    _model.password = text.text;
                    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:5 inSection:3];
                    //2.将indexPath添加到数组
                    NSArray <NSIndexPath *> *indexPathArray = @[indexPath];
                    //3.传入数组，对当前cell进行刷新
                    [self.tableView reloadRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationNone];
                }
            }];
            UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
                textField.placeholder = @"密码";
                textField.secureTextEntry = YES;
            }];
            
            [alert addAction:okAction];
            [alert addAction:cancelAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
        if (indexPath.row == 6) {
            UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
            
            UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"点击了按钮1，进入按钮1的事件");
                self.model.insertatext = @"0";
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:6 inSection:3];
                //2.将indexPath添加到数组
                NSArray <NSIndexPath *> *indexPathArray = @[indexPath];
                //3.传入数组，对当前cell进行刷新
                [self.tableView reloadRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationNone];
            }];
            
            UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                self.model.insertatext = @"1";
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:6 inSection:3];
                //2.将indexPath添加到数组
                NSArray <NSIndexPath *> *indexPathArray = @[indexPath];
                //3.传入数组，对当前cell进行刷新
                [self.tableView reloadRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationNone];

            }];
            
            UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"点击了取消");
            }];
            
            //把action添加到actionSheet里
            [actionSheet addAction:action1];
            [actionSheet addAction:action2];
            [actionSheet addAction:action3];
            
            //相当于之前的[actionSheet show];
            [self presentViewController:actionSheet animated:YES completion:nil];
        }
        
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

#pragma mark - action
- (void)tapGR:(UITapGestureRecognizer *)tapGR {
    
    //获取section
    NSInteger section = tapGR.view.tag - 2016;
    //判断改变bool值
    if ([_boolArr[section-3] boolValue] == YES) {
        [_boolArr replaceObjectAtIndex:section-3 withObject:@NO];
    }else {
        [_boolArr replaceObjectAtIndex:section-3 withObject:@YES];
    }
    //刷新某个section
    [_tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark - THDatePickerViewDelegate
/**
 保存按钮代理方法
 
 @param timer 选择的数据
 */
- (void)datePickerViewSaveBtnClickDelegate:(NSString *)timer {
    NSLog(@"保存点击");
    if (_selectIndexPath.section == 3) {
        if (_selectIndexPath.row == 2) {
            _model.startTime = timer;
            [self.tableView reloadRowsAtIndexPaths:@[_selectIndexPath] withRowAnimation:UITableViewRowAnimationNone];
        }else {
            _model.endTime = timer;
            [self.tableView reloadRowsAtIndexPaths:@[_selectIndexPath] withRowAnimation:UITableViewRowAnimationNone];
        }
        
    }
    [UIView animateWithDuration:0.3 animations:^{
        self.dateView.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 300);
    }];
    
}

/**
 取消按钮代理方法
 */
- (void)datePickerViewCancelBtnClickDelegate {
    NSLog(@"取消点击");
    
    [UIView animateWithDuration:0.3 animations:^{
        self.dateView.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 300);
    }];
}

- (void)cityTextView:(NSString *)text {

    self.model.site = text;
}

// 打开相机或相册
- (void)openPicker {
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *_Nonnull action) {
        
    }];
    
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"打开相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.mediaTypes = @[@"public.image"];
        imagePicker.delegate = self;
        imagePicker.allowsEditing = YES;
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        }
        [self presentViewController:imagePicker animated:YES completion:nil];
        
    }];
    
    UIAlertAction *picture = [UIAlertAction actionWithTitle:@"打开相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        UIImagePickerController *pickerImage = [[UIImagePickerController alloc] init];
        pickerImage.allowsEditing = YES;
        pickerImage.mediaTypes = @[@"public.image"];
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            pickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            //            pickerImage.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickerImage.sourceType];
            
        }
        pickerImage.delegate = self;
        [self presentViewController:pickerImage animated:YES completion:nil];
    }];
    [alertVc addAction:cancle];
    [alertVc addAction:camera];
    [alertVc addAction:picture];
    [self presentViewController:alertVc animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    NewImgTableViewCell *cell = (NewImgTableViewCell *)[_tableView cellForRowAtIndexPath:_selectIndexPath];
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    cell.img.image = image;
    cell.deleteBtn.hidden = NO;
    cell.firstLabel.hidden = NO;
    NSData  *data   = UIImageJPEGRepresentation(cell.img.image, 1);
    _model.img = data;
    
}

- (void)deleteImg {
    NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:1];
    _selectIndexPath = index;
    NewImgTableViewCell *cell = (NewImgTableViewCell *)[_tableView cellForRowAtIndexPath:index];
    cell.img.image = [UIImage imageNamed:@"compose"];
    cell.deleteBtn.hidden = YES;
    cell.firstLabel.hidden = YES;
    _model.img = nil;
    NSLog(@"删除图片");
    
}

#pragma mark - 标签  与 活动 返回数据代理
- (void)singleChoiceBlockData:(NSString *)data withDataID:(NSString *)dataID withType:(NSString *)typeStr {
    if (_selectIndexPath.section == 2) {
        _model.tag = data;
        _model.tagId = dataID;
        [self.tableView reloadRowsAtIndexPaths:@[_selectIndexPath] withRowAnimation:UITableViewRowAnimationNone];
        
    }else {
        _model.activityTitle = data;
        _model.activityTitleId = dataID;
        [self.tableView reloadRowsAtIndexPaths:@[_selectIndexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
}

-(void)multipleChoiceBlockDatas:(NSArray *)datas{
    
}


#pragma mark - NewContentCellDelegate  textView
- (void)changeTextView:(NSString *)text {
    
    _model.content = text;
    NSLog(@"%@",text);
}

// title代理
- (void)titleTextView:(NSString *)text {
    _model.title = text;
//    [self.tableView reloadRowsAtIndexPaths:@[_selectIndexPath] withRowAnimation:UITableViewRowAnimationNone];
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
        [_tableView registerClass:[NewTitleTableViewCell class] forCellReuseIdentifier:@"NewTitleCell"];
        [_tableView registerClass:[NewImgTableViewCell class] forCellReuseIdentifier:@"NewImgCell"];
        [_tableView registerClass:[NewOtherTableViewCell class] forCellReuseIdentifier:@"NewOtherCell"];
    }
    return _tableView;
}

- (NSMutableArray *)dataArr {
    
    if (!_dataArr) {
        
        _dataArr = [[NSMutableArray alloc] init];
    }
    return _dataArr;
}



- (NSMutableArray *)boolArr {
    
    if (!_boolArr) {
        
        _boolArr = [[NSMutableArray alloc] init];
    }
    return _boolArr;
}
- (DataView *)dateView {
    if (!_dateView) {
        _dateView = [[DataView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 300)];
        _dateView.delegate = self;
        _dateView.title = @"请选择时间";
    }
    return _dateView;
}

@end
