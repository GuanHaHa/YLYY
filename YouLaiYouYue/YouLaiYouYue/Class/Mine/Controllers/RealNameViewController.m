//
//  RealNameViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/14.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "RealNameViewController.h"


#import "RealTableViewCell.h"
#import "RealFrontTableViewCell.h"
#import "RealReverseTableViewCell.h"

@interface RealNameViewController ()<UITableViewDelegate , UITableViewDataSource ,RealCellTextDelegate ,UINavigationControllerDelegate ,UIImagePickerControllerDelegate ,RealDeleteImgDelegate ,RealReverseDeleteImgDelegate>

@property (strong , nonatomic) UITableView *tableView;

@property (strong , nonatomic) UIButton *submitBtn;

@property (strong , nonatomic) NSIndexPath *selectIndexPath;

@end

@implementation RealNameViewController {
    NSData *imgData1;
    NSData *imgData2;
    NSString *name;
    NSString *code;    // 身份证
    NSString *office;  // 签证机关
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
    
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:@"实名认证" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}


- (void)setUpUI {
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.submitBtn];
}


- (void)setUIAutoLayout {
    
    [_submitBtn autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
    [_submitBtn autoSetDimension:ALDimensionHeight toSize:50];
    
}

- (void)getDataFromUrl {
    
}

#pragma  mark - UITableViewDelegate ,UITableViewDataSource
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 5;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
//    if (indexPath.row == 0 || indexPath.row == 1) {
//        
//    }
    if (indexPath.row == 3) {
        RealFrontTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RealFrontCell"];
        cell.index = indexPath;
        cell.delegate = self;
        return cell;
    }
    if (indexPath.row == 4) {
        RealReverseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RealReverseCell"];
        cell.index = indexPath;
        cell.delegate = self;
        return cell;
    }
    RealTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RealCell"];
    cell.index = indexPath.row;
    cell.delegate = self;
    return cell;
    
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 3) {
        return 235;
    }
    if (indexPath.row == 4) {
        return 180;
    }
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.1;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _selectIndexPath = indexPath;
    if (indexPath.row == 3 || indexPath.row == 4) {
        [self openPicker];
    }

}



// 结束编辑，键盘就消失
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}
- (void)changeTextView:(UITextField *)text withIndex:(NSInteger )index {
    
    if (text.tag == 0) {
        NSLog(@"fffff");
        name = text.text;
    }else if (text.tag == 1){
        NSLog(@"9999");
        code = text.text;
    }else {
        office = text.text;
    }
    
}


// 提交点击事件
- (void)submitAction {
    if (name == nil || code == nil || imgData1 == nil || imgData2 == nil || office == nil) {
        [LCProgressHUD showMessage:@"请补全信息"];
        return;
    }
    NSMutableArray *Array = [NSMutableArray arrayWithObjects:imgData1,imgData2, nil];
    NSMutableArray *nameArray = [NSMutableArray arrayWithObjects:@"usercode",@"usercodeback", nil];
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_user/Realnameauthentication",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"name"    : name,
                          @"code"    : code,
                          @"uid"     : GetUserDefault(userID),
                          @"visa"    : office
                          };
    
    [SwpRequest swpPOSTAddWithFiles:url parameters:dic isEncrypt:NO fileNames:nameArray fileDatas:Array swpResultSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            [LCProgressHUD showMessage:@"认证成功"];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }else if ([resultObject[@"code"] integerValue] == 400){
            [LCProgressHUD showMessage:resultObject[@"message"]];
        }
    } swpResultError:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error, NSString * _Nonnull errorMessage) {
        [LCProgressHUD showMessage:errorMessage];
    }];
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
    
    if (_selectIndexPath.row == 3) {
        RealFrontTableViewCell *cell = (RealFrontTableViewCell *)[_tableView cellForRowAtIndexPath:_selectIndexPath];
        UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
        cell.img.image = image;
        cell.deleteBtn.hidden = NO;
        imgData1   = UIImageJPEGRepresentation(cell.img.image, 1);
    }else {
        RealReverseTableViewCell *cell = (RealReverseTableViewCell *)[_tableView cellForRowAtIndexPath:_selectIndexPath];
        UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
        cell.img.image = image;
        cell.deleteBtn.hidden = NO;
        imgData2   = UIImageJPEGRepresentation(cell.img.image, 1);
    }
}

#pragma mark - 删除按钮
- (void)deleteImgIndex:(NSIndexPath *)index {
    RealFrontTableViewCell *cell = (RealFrontTableViewCell *)[_tableView cellForRowAtIndexPath:index];
    imgData1 = nil;
//    picUrl = nil;
    cell.img.image = [UIImage imageNamed:@"taker_photo"];
    cell.deleteBtn.hidden = YES;
}

- (void)deleteTwoImgIndex:(NSIndexPath *)index {
    RealReverseTableViewCell *cell = (RealReverseTableViewCell *)[_tableView cellForRowAtIndexPath:index];
    imgData2 = nil;
    //    picUrl = nil;
    cell.img.image = [UIImage imageNamed:@"taker_photo"];
    cell.deleteBtn.hidden = YES;
}

#pragma mark - 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-JCNew64-50) style:UITableViewStylePlain];
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
        [_tableView registerClass:[RealTableViewCell class] forCellReuseIdentifier:@"RealCell"];
        [_tableView registerClass:[RealFrontTableViewCell class] forCellReuseIdentifier:@"RealFrontCell"];
        [_tableView registerClass:[RealReverseTableViewCell class] forCellReuseIdentifier:@"RealReverseCell"];
    }
    return _tableView;
}

- (UIButton *)submitBtn {
    if (!_submitBtn) {
        _submitBtn = [[UIButton alloc] initForAutoLayout];
        [_submitBtn setBackgroundColor:UIColorFromRGB(0xff9d00)];
        [_submitBtn setTitle:@"提交" forState:UIControlStateNormal];
        [_submitBtn setTitle:@"提交" forState:UIControlStateSelected];
        [_submitBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _submitBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        //        _logoutBtn.layer.cornerRadius = 6;
        //        [_logoutBtn.layer setMasksToBounds:YES];
        [_submitBtn addTarget:self action:@selector(submitAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _submitBtn;
}

@end
