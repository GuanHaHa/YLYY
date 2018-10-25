//
//  SignUpViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/13.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "SignUpViewController.h"

#import "SignUpTableViewCell.h"
#import "AskForTableViewCell.h"
#import "AmountTableViewCell.h"
#import "AnonymityTableViewCell.h"

//#import "BtnTableViewCell.h"


@interface SignUpViewController ()<UITableViewDelegate , UITableViewDataSource ,SignUpCellTextDelegate>

@property (strong , nonatomic) UITableView *tableView;

@property (strong , nonatomic) UIButton *btn;



@end

@implementation SignUpViewController {
    NSInteger amount;  // 显示的数量
    NSArray *titleArray; // 姓名联系方式数组
    NSArray *askForArr;    // 性别 年龄  是否单身
    NSArray *otherArr;
    NSArray *arr;
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
    amount = 1;
    titleArray = @[@"姓名:",@"联系方式:"];
    askForArr = @[@"性别要求:",@"年龄要求:",@"是否单身:",@"是否匿名:"];
    otherArr = @[@"费用:",@"支付方式:"];
    arr = @[@"费用:",@"",@"支付方式:"];
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}


- (void)setNavigationBar {
    [self setNavigationBarTitle:@"报名" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}


- (void)setUpUI {
    [self.view addSubview:self.btn];
    [self.view addSubview:self.tableView];
}


- (void)setUIAutoLayout {
    [_btn autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
    [_btn autoSetDimension:ALDimensionHeight toSize:50];
}

- (void)getDataFromUrl {
    
}

// 结束编辑，键盘就消失
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.view endEditing:YES];
}

- (void)setModel:(ActivityModel *)model {
    _model = model;
    _model.noname = @"0";
}

#pragma  mark - UITableViewDelegate ,UITableViewDataSource
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }else if (section == 1) {
        return 5;
    }else {
        if ([self.model.peoplesex isEqualToString:@"无限制"]) {
            if ([self.type isEqualToString:@"1"]) {
                return 2;
            }
            return 3;
        }
        return 2;
    }
    
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    if (indexPath.section == 0) {
        SignUpTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SignUpCell"];
        cell.type = self.type;
        cell.index = indexPath;
        cell.model = self.model;
        cell.delegate = self;
        cell.titleLabel.text = titleArray[indexPath.row];
        return cell;
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            AskForTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AskForCell"];
            cell.model = self.model;
            return cell;
        }
        if (indexPath.row == 4) {
            AnonymityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AnonymityCell"];
            cell.model = self.model;
            return cell;
        }
        else {
            SignUpTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SignUpCell"];
            cell.type = self.type;
            cell.index = indexPath;
            cell.model = self.model;
            cell.titleLabel.text = askForArr[indexPath.row-1];
            return cell;
        }
    }else {
        if ([self.model.peoplesex isEqualToString:@"无限制"]) {
            if ([self.type isEqualToString:@"1"]) {
                SignUpTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SignUpCell"];
                cell.type = self.type;
                cell.index = indexPath;
                cell.model = self.model;
                cell.titleLabel.text = otherArr[indexPath.row];
                return cell;
                
            }else {
                if (indexPath.row == 1) {
                    AmountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AmountCell"];
                    cell.amountLabel.text = [NSString stringWithFormat:@"%ld",(long)amount];
                    [cell.addButton addTarget:self action:@selector(addButton:) forControlEvents:UIControlEventTouchUpInside];
                    [cell.subtractButton addTarget:self action:@selector(subtractButton:) forControlEvents:UIControlEventTouchUpInside];
                    return cell;
                }
                SignUpTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SignUpCell"];
                cell.type = self.type;
                cell.index = indexPath;
                cell.model = self.model;
                cell.titleLabel.text = arr[indexPath.row];
                return cell;
            }
            
        }else {
            SignUpTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SignUpCell"];
            cell.index = indexPath;
            cell.model = self.model;
            cell.type = self.type;
            cell.titleLabel.text = otherArr[indexPath.row];
            return cell;
        }
    }
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        return 150;
    }
    if (indexPath.section == 1 && indexPath.row == 4) {
        return 55;
    }
    return 45;
    
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
    [self.view endEditing:YES];
    if (indexPath.section == 1 && indexPath.row == 4) {
        UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            _model.noname = @"1";
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:4 inSection:1];
            //2.将indexPath添加到数组
            NSArray <NSIndexPath *> *indexPathArray = @[indexPath];
            //3.传入数组，对当前cell进行刷新
            [tableView reloadRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationNone];
            
            
        }];
        UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            _model.noname = @"0";
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:4 inSection:1];
            //2.将indexPath添加到数组
            NSArray <NSIndexPath *> *indexPathArray = @[indexPath];
            //3.传入数组，对当前cell进行刷新
            [tableView reloadRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationNone];
        }];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击了取消");
        }];
        [actionSheet addAction:action1];
        [actionSheet addAction:action2];
        [actionSheet addAction:action3];
        [self presentViewController:actionSheet animated:YES completion:nil];
    }
    
    
}

// 报名接口
- (void)signAction {
    if (self.model.user_tel == nil || [self.model.user_tel isEqualToString:@""]) {
        [LCProgressHUD showMessage:@"请填写联系电话"];
        return;
    }
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_order/user_join",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"user_id" : GetUserDefault(userID),
                          @"num"     : [NSString stringWithFormat:@"%ld",(long)amount],
                          @"pfid"    : _model.pfID,
                          @"need_paytype" : @"0" ,
                          @"phone"   : _model.user_tel,
                          @"id"      : self.inviteId
                          };
    
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 201) {
            [LCProgressHUD showMessage:resultObject[@"message"]];
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
        [LCProgressHUD showMessage:resultObject[@"message"]];

    }];
}

#pragma mark - 加减数量的按钮
- (void)addButton:(UIButton *)button {
    amount++;
    [self.tableView reloadData];
    
}
- (void)subtractButton:(UIButton *)button {
    if (amount > 1) {
        amount--;
        [self.tableView reloadData];
    }
    
}


- (void)changeTextView:(NSString *)text {
    self.model.user_tel = text;
}

#pragma mark - 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-JCNew64-50) style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.estimatedRowHeight = 0;
//        _tableView.backgroundColor = [UIColor whiteColor];
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
        [_tableView registerClass:[SignUpTableViewCell class] forCellReuseIdentifier:@"SignUpCell"];
        [_tableView registerClass:[AskForTableViewCell class] forCellReuseIdentifier:@"AskForCell"];
        [_tableView registerClass:[AmountTableViewCell class] forCellReuseIdentifier:@"AmountCell"];
        [_tableView registerClass:[AnonymityTableViewCell class] forCellReuseIdentifier:@"AnonymityCell"];
    }
    return _tableView;
}
- (UIButton *)btn {
    if (!_btn) {
        _btn = [[UIButton alloc] initForAutoLayout];
        [_btn setBackgroundColor:UIColorFromRGB(0xff9d00)];
        [_btn setTitle:@"报名" forState:UIControlStateNormal];
        [_btn setTitle:@"报名" forState:UIControlStateSelected];
        [_btn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _btn.titleLabel.font = [UIFont systemFontOfSize:14];
//        _btn.layer.cornerRadius = 6;
//        [_btn.layer setMasksToBounds:YES];
        [_btn addTarget:self action:@selector(signAction) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _btn;
}



@end
