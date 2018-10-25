//
//  EvaluateViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/20.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "EvaluateViewController.h"
#import "PartyViewController.h"
#import "LoginViewController.h"

#import "EvaluateTableViewCell.h"
#import "EvaluateReplyTableViewCell.h"
#import "XHInputView.h"

#import "EvaluateModel.h"


@interface EvaluateViewController ()<UITableViewDelegate , UITableViewDataSource ,XHInputViewDelagete>

@property (strong , nonatomic) UITableView *tableView;

@property (nonatomic, strong) XHInputView *inputViewStyleDefault;

@end

@implementation EvaluateViewController {
    NSMutableArray *evaluateArray;
    NSString *comment_id;  // 要回复的那条评论的id，在列表中返回
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.fd_prefersNavigationBarHidden = YES;
    
    [self setUI];
    [self setData];
    
    //样式一
    __weak typeof(self) weakSelf = self;
    self.inputViewStyleDefault = [self inputViewWithStyle:InputViewStyleDefault];
    self.inputViewStyleDefault.delegate = self;
    [self.view addSubview:self.inputViewStyleDefault];
    /** 发送按钮点击事件 */
    self.inputViewStyleDefault.sendBlcok = ^(NSString *text) {
        [weakSelf.inputViewStyleDefault hide];//隐藏输入框
        
        [weakSelf sendComment:text];
        
    };
    
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
    evaluateArray = [NSMutableArray array];
    [self getDataFromUrl];
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:@"往期活动评价" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}


- (void)setUpUI {
    [self.view addSubview:self.tableView];
}


- (void)setUIAutoLayout {
    
}

- (void)getDataFromUrl {
    if (GetUserDefault(userID) == nil) {
        SetUserDefault(@"", userID);
    }
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_activity/activity_comment_list",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"pfID"    : self.activityId,
                          @"userID"  : GetUserDefault(userID)
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            evaluateArray = [weakSelf evaluateDataArray:resultObject[@"obj"]];
            [weakSelf.tableView reloadData];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

- (NSMutableArray *)evaluateDataArray:(NSMutableArray *)param {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in param) {
        EvaluateModel *model = [EvaluateModel arrayWithDic:dic];
        [array addObject:model];
    }
    return array;
}

// 评价
- (void)sendComment:(NSString *)text {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_activity/reply_activity_comment",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key"     : md5Url,
                          @"comment_id"  : comment_id,
                          @"content"     : text,
                          @"userID"      : GetUserDefault(userID)
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            [LCProgressHUD showMessage:@"评论成功"];
            [weakSelf getDataFromUrl];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

/**
 XHInputView 将要显示
 */
-(void)xhInputViewWillShow:(XHInputView *)inputView
{
    /*
     //如果你工程中有配置IQKeyboardManager,并对XHInputView造成影响,请在XHInputView将要显示时将其关闭
     [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
     [IQKeyboardManager sharedManager].enable = NO;
     */
    
}

/**
 XHInputView 将要影藏
 */
-(void)xhInputViewWillHide:(XHInputView *)inputView{
    
    /*
     //如果你工程中有配置IQKeyboardManager,并对XHInputView造成影响,请在XHInputView将要影藏时将其打开
     [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
     [IQKeyboardManager sharedManager].enable = YES;
     */
}

-(XHInputView *)inputViewWithStyle:(InputViewStyle)style{
    
    XHInputView *inputView = [[XHInputView alloc] initWithStyle:style];
    //设置最大输入字数
    inputView.maxCount = 50;
    //输入框颜色
    inputView.textViewBackgroundColor = [UIColor groupTableViewBackgroundColor];
    //占位符
    inputView.placeholder = @"请输入...";
    return inputView;
    
    //XHInputView 支持一下属性设置,详见XHInputView.h文件
    
    //    /** 最大输入字数 */
    //    @property (nonatomic, assign) NSInteger maxCount;
    //    /** 字体 */
    //    @property (nonatomic, strong) UIFont * font;
    //    /** 占位符 */
    //    @property (nonatomic, copy) NSString *placeholder;
    //    /** 占位符颜色 */
    //    @property (nonatomic, strong) UIColor *placeholderColor;
    //    /** 输入框背景颜色 */
    //    @property (nonatomic, strong) UIColor* textViewBackgroundColor;
    //    /** 发送按钮背景色 */
    //    @property (nonatomic, strong) UIColor *sendButtonBackgroundColor;
    //    /** 发送按钮Title */
    //    @property (nonatomic, copy) NSString *sendButtonTitle;
    //    /** 发送按钮圆角大小 */
    //    @property (nonatomic, assign) CGFloat sendButtonCornerRadius;
    //    /** 发送按钮字体 */
    //    @property (nonatomic, strong) UIFont * sendButtonFont;
    
}


#pragma  mark - UITableViewDelegate ,UITableViewDataSource
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    EvaluateModel *model = evaluateArray[section];
    return model.list.count+1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return evaluateArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    EvaluateModel *model = evaluateArray[indexPath.section];
    if (indexPath.row == 0) {
        EvaluateTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EvaluateCell"];
        cell.model = model;
        return cell;
    }else {
        EvaluateReplyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EvaluateReplyCell"];
        cell.dic = model.list[indexPath.row - 1];
        return cell;
    }    
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 120;
    }
    EvaluateModel *model = evaluateArray[indexPath.section];
    NSDictionary *dic = model.list[indexPath.row - 1];
    NSString *str = [NSString stringWithFormat:@"%@:%@",dic[@"username"],dic[@"content"]];
    CGRect rect = [str boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-50, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil];
    return rect.size.height+20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.1;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    EvaluateModel *model = evaluateArray[section];
//    if (model.list.count == 0) {
//        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
//        UILabel *label = [[UILabel alloc] initForAutoLayout];
//        [view addSubview:label];
//        [label autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 20, 0, 20)];
//        label.text = @"暂无评价";
//        return view;
//    }else {
//        return nil;
//    }
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
    view.backgroundColor = UIColorFromRGB(0xf7f7f7);
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EvaluateModel *model = evaluateArray[indexPath.section];
    if (indexPath.row == 0) {
        PartyViewController *vc = [[PartyViewController alloc] init];
        vc.activityId = model.pfID;
        [self.navigationController pushViewController:vc animated:YES];
    }else {
        if ([GetUserDefault(isLogin) boolValue] == NO) {
            LoginViewController *vc = [[LoginViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            return;
        }
        if ([model.reply isEqualToString:@"1"]) {
            NSDictionary *dic = model.list[indexPath.row - 1];
            comment_id = dic[@"comment_id"];
            [self.inputViewStyleDefault show];
        }
    }
}


#pragma mark - 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-JCNew64) style:UITableViewStyleGrouped];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = UIColorFromRGB(0xffffff);
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
        [_tableView registerClass:[EvaluateTableViewCell class] forCellReuseIdentifier:@"EvaluateCell"];
        [_tableView registerClass:[EvaluateReplyTableViewCell class] forCellReuseIdentifier:@"EvaluateReplyCell"];
    }
    return _tableView;
}


@end
