//
//  EditTogetherViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/11.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "EditTogetherViewController.h"
#import "CityListViewController.h"
#import "ReplenishViewController.h"
#import "LDYSelectivityAlertView.h"

#import "TogetherTitleTableViewCell.h"   // 标题cell
#import "TogetherContentTableViewCell.h" // 内容cell
#import "EditimgTableViewCell.h"          // 图片cell
#import "TogetherOtherTableViewCell.h"
#import "PickerView.h"
#import "CostView.h"
#import "RequireView.h"
#import "DataView.h"

#import "TogetherModel.h"
#import "TagModel.h"

@interface EditTogetherViewController ()<UITableViewDataSource , UITableViewDelegate ,TogetherContentCellDelegate ,DeleteImgDelegate ,UINavigationControllerDelegate,UIImagePickerControllerDelegate ,PickerViewResultDelegate ,CostDelegate ,RequireDelegate,LDYSelectivityAlertViewDelegate ,DatePickerViewDelegate ,TogetherTitleCellDelegate>


@property (strong , nonatomic) UITableView *tableView;

@property (strong , nonatomic) NSIndexPath *selectIndexPath;

@property (strong , nonatomic) TogetherModel *model;

@property (strong , nonatomic) CostView *costView;

@property (strong , nonatomic) RequireView *requireView;

@property (strong, nonatomic) DataView *dateView;


@end

@implementation EditTogetherViewController {
    NSArray *nameArr;
    NSArray *picArr;
    NSString *picUrl;
    NSMutableArray *tagArr;
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
    tagArr = [NSMutableArray array];
    nameArr = @[@"开始时间",@"结束时间",@"活动地点",@"人均费用",@"人数要求",@"活动要求",@"标签",@"进入活动"];
    picArr = @[@"img1",@"img2",@"img3",@"创建行程-费用",@"person",@"activities-require",@"标签",@"enter-activity"];
    
    [self getTagDataFromUrl];
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:@"修改活动" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
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

- (void)setEditAcModel:(EditActModel *)editAcModel {
    _editAcModel = editAcModel;
    self.model = [[TogetherModel alloc] init];
    self.model.title = _editAcModel.pftitle;
    
    self.model.content = _editAcModel.pfcontent;
    picUrl = _editAcModel.pfpic;
    self.model.startTime = _editAcModel.pfgotime;
    self.model.endTime = _editAcModel.pfendtime;
    self.model.site = _editAcModel.city_name;
    self.model.siteId = _editAcModel.city;
    self.model.cost = _editAcModel.pfspend;
    self.model.price_type = _editAcModel.pfspendtype;
    self.model.price_info = _editAcModel.pfspendexplain;
    self.model.min_num = _editAcModel.min_num;
    self.model.max_num = _editAcModel.max_num;
    self.model.peoplesex = _editAcModel.pfpeoplesex;
    self.model.age_begin = _editAcModel.pfagebegin;
    self.model.age_end = _editAcModel.pfageend;
    self.model.marry = _editAcModel.pfmarry;
    self.model.follow_info = _editAcModel.pfexplain;
    self.model.warning = _editAcModel.pfwarning;
    self.model.follow_pass = _editAcModel.pfpwd;
    self.model.tagStr = _editAcModel.lable_name;
    self.model.tagID = _editAcModel.pflable;
    
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
    NSLog(@"%@",_model.title);
    if (_model.title == nil || _model.content == nil || _model.startTime == nil || _model.endTime == nil || _model.siteId == nil || _model.cost == nil || _model.price_type == nil || _model.min_num == nil || _model.max_num == nil || _model.peoplesex == nil || _model.age_begin == nil || _model.age_end == nil || _model.marry == nil) {
        [LCProgressHUD showInfoMsg:@"请补全信息"];
        return;
    }
    if (_model.img == nil && picUrl == nil) {
        [LCProgressHUD showMessage:@"请添加图片"];
        return;
    }
    [self issueJourney];
    
}

// 发布
- (void)issueJourney {
    NSString *if_pic;
    if (picUrl != nil) {
        if_pic = @"0";
    }else {
        if_pic = @"1";
    }
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_activity/update_activity",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key"   : md5Url,
                          @"if_pic"    : if_pic,
                          @"activity_id" : self.activityId,
                          @"pftitle"     : _model.title,
                          @"pfcontent"   : _model.content,
                          @"pfgotime": _model.startTime,
                          @"pfendtime"  : _model.endTime,
                          @"city_id"      : _model.siteId,
                          @"pfspendtype": _model.price_type,
                          @"pfspend"     : _model.cost,
                          @"pfspendexplain": _model.price_info,
                          @"min_num"   : _model.min_num,
                          @"max_num"   : _model.max_num,
                          @"pfpeoplesex" : _model.peoplesex,
                          @"pfagebegin" : _model.age_begin,
                          @"pfageend"   : _model.age_end,
                          @"pfmarry"     : _model.marry,
                          @"pfexplain" : _model.follow_info,
                          @"pfwarning"   : _model.warning,
                          @"pfpwd" : _model.follow_pass,
                          @"user_id"   : GetUserDefault(userID),
                          @"pflable"   : _model.tagID
                          };
    __weak typeof(self)weakSelf = self;
    if (picUrl != nil) {
        
        [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
            if ([resultObject[@"code"] integerValue] == 200) {
                [LCProgressHUD showMessage:@"成功"];
                [weakSelf.navigationController popViewControllerAnimated:YES];
            }
        } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
            [LCProgressHUD showMessage:resultObject[@"message"]];
        }];
        
    }else {
        [SwpRequest swpPOSTAddFile:url parameters:dic isEncrypt:NO fileName:@"file_img" fileData:_model.img swpResultSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull resultObject) {
            if ([resultObject[@"code"] integerValue] == 200) {
                [LCProgressHUD showMessage:@"成功"];
                [weakSelf.navigationController popViewControllerAnimated:YES];
            }else {
                [LCProgressHUD showMessage:resultObject[@"message"]];
            }
        } swpResultError:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error, NSString * _Nonnull errorMessage) {
            NSLog(@"ffff");
            
        }];
    }
}

// 获取标签
- (void)getTagDataFromUrl {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_public/Label",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"type"    : @"0"
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

#pragma  mark - UITableViewDelegate ,UITableViewDataSource
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 11;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    if (indexPath.section == 0) {
        TogetherTitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TogetherTitleCell"];
        cell.model = _model;
        cell.delegate = self;
        return cell;
    }
    if (indexPath.section == 1) {
        TogetherContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TogetherContentCell"];
        cell.model = _model;
        cell.delegate = self;
        return cell;
    }
    if (indexPath.section == 2) {
        EditimgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EditimgCell"];
        cell.delegate = self;
        cell.picUrl = picUrl;
        cell.index = indexPath;
        
        return cell;
    }else {
        TogetherOtherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TogetherOtherCell"];
        cell.img.image = [UIImage imageNamed:picArr[indexPath.section-3]];
        cell.titleLabel.text = nameArr[indexPath.section-3];
        cell.indexSection = indexPath.section;
        cell.model = _model;
        return cell;
    }
    
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        return 200;
    }
    if (indexPath.section == 2) {
        return 185;
    }
    return 45;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 10;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.1;
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
//                                                                 _model.title = text.text;
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
    if (indexPath.section == 2) {
        
        [self openPicker];
    }
    if (indexPath.section == 3 || indexPath.section == 4) {
        [UIView animateWithDuration:0.3 animations:^{
            self.dateView.frame = CGRectMake(0, self.view.frame.size.height - 300, self.view.frame.size.width, 300);
            [self.dateView show];
        }];
    }
    if (indexPath.section == 5) {
        CityListViewController *vc = [[CityListViewController alloc] init];
        __weak typeof(self)weakSelf = self;
        vc.selectedCityBlock = ^(CityList *city) {
            
            _model.site = city.cityName;
            _model.siteId = [NSString stringWithFormat:@"%ld",(long)city.cityCode];
            [weakSelf.tableView reloadRowsAtIndexPaths:@[_selectIndexPath] withRowAnimation:UITableViewRowAnimationNone];
        };
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.section == 6) {
        UIApplication *ap = [UIApplication sharedApplication];
        [ap.keyWindow addSubview:self.costView];
        [_costView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
    if (indexPath.section == 7) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"人数要求" preferredStyle:UIAlertControllerStyleAlert];
        
        //增加取消按钮；
        [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
        
        //增加确定按钮；
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //获取第1个输入框；
            UITextField *userNameTextField = alertController.textFields.firstObject;
            
            //获取第2个输入框；
            UITextField *passwordTextField = alertController.textFields.lastObject;
            
            _model.min_num = userNameTextField.text;
            _model.max_num = passwordTextField.text;
            [self.tableView reloadRowsAtIndexPaths:@[_selectIndexPath] withRowAnimation:UITableViewRowAnimationNone];
            NSLog(@"用户名 = %@，密码 = %@",userNameTextField.text,passwordTextField.text);
            
        }]];
        
        
        
        //定义第一个输入框；
        [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"请输入最少人数";
            textField.layer.cornerRadius = 6;
            [textField.layer setMasksToBounds:YES];
        }];
        //定义第二个输入框；
        [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"请输入最多人数";
            textField.layer.cornerRadius = 6;
            [textField.layer setMasksToBounds:YES];
        }];
        
        [self presentViewController:alertController animated:true completion:nil];
    }
    if (indexPath.section == 8) {
        UIApplication *ap = [UIApplication sharedApplication];
        [ap.keyWindow addSubview:self.requireView];
        [_requireView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
    if (indexPath.section == 9) {
        if (tagArr.count == 0) {
            [LCProgressHUD showMessage:@"暂无标签"];
            return;
        }
        LDYSelectivityAlertView *ldySAV = [[LDYSelectivityAlertView alloc]initWithTitle:@"标签" datas:tagArr ifSupportMultiple:NO];
        ldySAV.type = 7;
        ldySAV.delegate = self;
        [ldySAV show];
    }
    if (indexPath.section == 10) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"密码" message:@"请设置密码" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //响应事件
            //得到文本信息
            for(UITextField *text in alert.textFields){
                NSLog(@"text = %@", text.text);
                _model.follow_pass = text.text;
            }
            [self.tableView reloadRowsAtIndexPaths:@[_selectIndexPath] withRowAnimation:UITableViewRowAnimationNone];
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
    
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
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
    EditimgTableViewCell *cell = (EditimgTableViewCell *)[_tableView cellForRowAtIndexPath:_selectIndexPath];
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    cell.img.image = image;
    cell.deleteBtn.hidden = NO;
    cell.firstLabel.hidden = NO;
    NSData  *data   = UIImageJPEGRepresentation(cell.img.image, 1);
    _model.img = data;
    
}

#pragma mark - CostViewDelegate  费用代理
- (void)costInformationType:(NSString *)chooseType withMoney:(NSString *)money withExplain:(NSString *)explain {
    _model.price_type = chooseType;
    _model.cost = money;
    _model.price_info = explain;
    [self.tableView reloadRowsAtIndexPaths:@[_selectIndexPath] withRowAnimation:UITableViewRowAnimationNone];
    [UIView animateWithDuration:0.4 animations:^{
        _costView.alpha = 0;
        
    }completion:^(BOOL finished) {
        [_costView removeFromSuperview];
        _costView = nil;
        
    }];
}

- (void)hiddenCost {
    [UIView animateWithDuration:0.4 animations:^{
        _costView.alpha = 0;
        
    }completion:^(BOOL finished) {
        [_costView removeFromSuperview];
        _costView = nil;
        
    }];
}

#pragma mark - RequireDelegate  其他要求代理
- (void)requireInformationMixAge:(NSString *)mixAge maxAge:(NSString *)maxAge withSex:(NSString *)sex withMarry:(NSString *)marry withOther:(NSString *)other {
    _model.age_begin = mixAge;
    _model.age_end = maxAge;
    _model.peoplesex = sex;
    _model.marry = marry;
    _model.follow_info = other;
    [self.tableView reloadRowsAtIndexPaths:@[_selectIndexPath] withRowAnimation:UITableViewRowAnimationNone];
    [UIView animateWithDuration:0.4 animations:^{
        _requireView.alpha = 0;
        
    }completion:^(BOOL finished) {
        [_requireView removeFromSuperview];
        _requireView = nil;
        
    }];
    
}

- (void)hiddenRequireView {
    [UIView animateWithDuration:0.4 animations:^{
        _requireView.alpha = 0;
        
    }completion:^(BOOL finished) {
        [_requireView removeFromSuperview];
        _requireView = nil;
        
    }];
}



#pragma mark - PickerViewResultDelegate
-(void)pickerView:(UIView *)pickerView result:(NSString *)string{
    
    NSLog(@"结果：%@",string);
    if (pickerView.tag-100 == 3) {
        _model.startTime = string;
        [self.tableView reloadRowsAtIndexPaths:@[_selectIndexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
    if (pickerView.tag-100 == 4) {
        _model.endTime = string;
        [self.tableView reloadRowsAtIndexPaths:@[_selectIndexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
}

#pragma mark - THDatePickerViewDelegate
/**
 保存按钮代理方法
 
 @param timer 选择的数据
 */
- (void)datePickerViewSaveBtnClickDelegate:(NSString *)timer {
    NSLog(@"保存点击");
    if (_selectIndexPath.section == 3) {
        _model.startTime = timer;
        [self.tableView reloadRowsAtIndexPaths:@[_selectIndexPath] withRowAnimation:UITableViewRowAnimationNone];
    }else {
        _model.endTime = timer;
        [self.tableView reloadRowsAtIndexPaths:@[_selectIndexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
    [UIView animateWithDuration:0.3 animations:^{
        self.dateView.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 300);
    }];
    
}

// 删除图片
- (void)deleteImgIndex:(NSIndexPath *)index {
    EditimgTableViewCell *cell = (EditimgTableViewCell *)[_tableView cellForRowAtIndexPath:index];
    _model.img = nil;
    picUrl = nil;
    cell.img.image = [UIImage imageNamed:@"compose"];
    cell.deleteBtn.hidden = YES;
    cell.firstLabel.hidden = YES;
//    [self.tableView reloadRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationNone];
    NSLog(@"删除图片");
    
}



// textView
- (void)TogetherChangeTextView:(NSString *)text {
    
    _model.content = text;
}

- (void)togetherTitleTextView:(NSString *)text {
    _model.title = text;
}


#pragma mark - 标签  与 活动 返回数据代理
- (void)singleChoiceBlockData:(NSString *)data withDataID:(NSString *)dataID {
    
    _model.tagStr = data;
    _model.tagID = dataID;
    [self.tableView reloadRowsAtIndexPaths:@[_selectIndexPath] withRowAnimation:UITableViewRowAnimationNone];
}

-(void)multipleChoiceBlockDatas:(NSArray *)datas{
    
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
        [_tableView registerClass:[TogetherTitleTableViewCell class] forCellReuseIdentifier:@"TogetherTitleCell"];
        [_tableView registerClass:[TogetherContentTableViewCell class] forCellReuseIdentifier:@"TogetherContentCell"];
        [_tableView registerClass:[EditimgTableViewCell class] forCellReuseIdentifier:@"EditimgCell"];
        [_tableView registerClass:[TogetherOtherTableViewCell class] forCellReuseIdentifier:@"TogetherOtherCell"];
    }
    return _tableView;
}

- (CostView *)costView {
    if (!_costView) {
        _costView = [[CostView alloc] initForAutoLayout];
        _costView.delegate = self;
        
    }
    return _costView;
}
- (RequireView *)requireView {
    if (!_requireView) {
        _requireView = [[RequireView alloc] initForAutoLayout];
        _requireView.delegate = self;
        
    }
    return _requireView;
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
