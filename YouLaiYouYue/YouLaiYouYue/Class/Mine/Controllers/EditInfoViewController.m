//
//  EditInfoViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/25.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "EditInfoViewController.h"
#import "NameViewController.h"
#import "SignViewController.h"
#import "RealNameViewController.h"
#import "ShowNameViewController.h"

#import "EditHeadTableViewCell.h"
#import "EditTableViewCell.h"
#import "PickerView.h"

@interface EditInfoViewController ()<UITableViewDelegate , UITableViewDataSource , UIImagePickerControllerDelegate ,UINavigationControllerDelegate , PickerViewResultDelegate>

@property (strong , nonatomic) UITableView *tableView;

@property (strong ,nonatomic) NSIndexPath *selectIndexPath;


@end

@implementation EditInfoViewController {
    NSArray *nameArr;
    NSArray *picArr;
    NSString *sexStr;
    NSDictionary *attestationDic; // 验证实名认证
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
    [self getDataFromUrl];
    nameArr = @[@"昵称",@"签名",@"性别",@"生日",@"实名认证",@"所在地",@"是否单身",@"等级",@"注册时间"];
    picArr = @[@"user-1",@"person_sign",@"sex",@"person_birthday",@"person_real_name",@"person_location",@"person_is_single",@"person_rank",@"person_register_time"];
    
    
    
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:@"编辑个人信息" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}


- (void)setUpUI {
    [self addRightButton];
    [self.view addSubview:self.tableView];
}


- (void)setUIAutoLayout {
    
}

- (void)getDataFromUrl {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_user/Realdisplay",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"id"      : GetUserDefault(userID)
                          };
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            attestationDic = resultObject[@"obj"];
            
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


#pragma  mark - UITableViewDelegate ,UITableViewDataSource
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    if (indexPath.section == 0) {
        EditHeadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EditHeadCell"];
        cell.model = _model;
        return cell;
    }else {
        
        EditTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EditCell"];
        cell.titleLabel.text = nameArr[indexPath.section - 1];
        cell.img.image = [UIImage imageNamed:picArr[indexPath.section - 1]];
        cell.indexSection = indexPath.section;
        cell.model = _model;
        
        return cell;
    }
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 122;
    }
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.1;
    }
    return 10;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _selectIndexPath = indexPath;
    
    if (indexPath.section == 0) {
        [self openPicker];
    }
    if (indexPath.section == 1) {
        NameViewController *vc = [[NameViewController alloc] init];
        __weak typeof(self) thisSelf = self;
        [vc getNameBlock:^(NSString *nameString) {
            _model.username = nameString;
            [thisSelf.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        }];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.section == 2) {
        SignViewController *vc = [[SignViewController alloc] init];
        __weak typeof(self)thisSelf = self;
        [vc getSignBlock:^(NSString *signString) {
            
            _model.userautograph = signString;
            [thisSelf.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        }];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (indexPath.section == 3) {
        PickerView *vi = [[PickerView alloc] init];
        vi.delegate = self;
        vi.tag = indexPath.section +100;
        vi.type = PickerViewTypeSex;
        [self.view addSubview:vi];
    }
    if (indexPath.section == 4) {
        
    }
    if (indexPath.section == 5) {
        if ([attestationDic[@"usercodeok"] isEqualToString:@"0"] || [attestationDic[@"usercodeok"] isEqualToString:@"3"]) {
            RealNameViewController *vc = [[RealNameViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }else {
            ShowNameViewController *vc = [[ShowNameViewController alloc] init];
            vc.dic = attestationDic;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    if (indexPath.section == 6) {
        PickerView *vi = [[PickerView alloc] init];
        vi.delegate = self;
        vi.tag = indexPath.section +100;
        vi.type = PickerViewTypeCity;
        [self.view addSubview:vi];
    }
    if (indexPath.section == 7) {
        PickerView *vi = [[PickerView alloc] init];
        vi.delegate = self;
        vi.tag = indexPath.section +100;
        vi.type = PickerViewTypemarr;
        [self.view addSubview:vi];
    }
    if (indexPath.section == 8) {
        
    }
    
    
    
}

#pragma mark - PickerViewResultDelegate
-(void)pickerView:(UIView *)pickerView result:(NSString *)string{
    
    NSLog(@"结果：%@",string);
    
    if (pickerView.tag-100==3) {
        if ([string isEqualToString:@"男"]) {
            _model.sex = @"0";
        }
        if ([string isEqualToString:@"女"]) {
            _model.sex = @"1";
        }
        [self.tableView reloadRowsAtIndexPaths:@[_selectIndexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
    if (pickerView.tag-100==6) {
        
        _model.useraddress = string;
        [self.tableView reloadRowsAtIndexPaths:@[_selectIndexPath] withRowAnimation:UITableViewRowAnimationNone];
    }    
    if (pickerView.tag-100 == 7) {
        if ([string isEqualToString:@"是"]) {
            _model.usermarry = @"1";
        }
        if ([string isEqualToString:@"否"]) {
            _model.usermarry = @"2";
        }
        [self.tableView reloadRowsAtIndexPaths:@[_selectIndexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
    
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
    //    UIImage* image = [info objectForKey:@"UIImagePickerControllerEditedImage"]; // 裁剪后的图片
    EditHeadTableViewCell *cell = (EditHeadTableViewCell *)[_tableView cellForRowAtIndexPath:_selectIndexPath];
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    cell.headImg.image = image;
    NSData  *data   = UIImageJPEGRepresentation(cell.headImg.image, 1);
    
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_user/UploadSheader",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"uid"     : GetUserDefault(userID)
                          };
    [SwpRequest swpPOSTAddFile:url parameters:dic isEncrypt:NO fileName:@"images" fileData:data swpResultSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            
        }
    } swpResultError:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error, NSString * _Nonnull errorMessage) {
        
    }];
}

// 右侧保存按钮
- (void)rightButton:(UIButton *)button {
    [self uploadPersonInfoData];
}

- (void)uploadPersonInfoData {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_user/saveUserinfo",baseUrl];
    NSString *mdUrl = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : mdUrl,
                          @"userpic"  : _model.headeimg,
                          @"usersex"     : _model.sex,
                          @"username" : _model.username,
                          @"userautograph" : _model.userautograph,
                          @"userbirthday"  : _model.userbirthday,
                          @"usermarry"   : _model.usermarry,
                          @"usertime"    : _model.usertime,
                          @"useraddress" : _model.useraddress,
                          @"uid"         : GetUserDefault(userID)
                          };
    
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            [LCProgressHUD showMessage:@"修改成功"];
            [self.navigationController popViewControllerAnimated:YES];
            
        }
        
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
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
        [_tableView registerClass:[EditHeadTableViewCell class] forCellReuseIdentifier:@"EditHeadCell"];
        [_tableView registerClass:[EditTableViewCell class] forCellReuseIdentifier:@"EditCell"];
    }
    return _tableView;
}



@end
