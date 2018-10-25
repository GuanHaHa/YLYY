//
//  RemCommentViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/16.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "RemCommentViewController.h"


#import "CommentTableViewCell.h"
#import "ReplyTableViewCell.h"
#import "XHInputView.h"

#import "CommentModel.h"

@interface RemCommentViewController ()<UITableViewDelegate , UITableViewDataSource ,XHInputViewDelagete>

@property (strong , nonatomic) UITableView *tableView;

@property (strong , nonatomic) UIView *bottomView;

@property (strong , nonatomic) UILabel *label;

@property (nonatomic, strong) XHInputView *inputViewStyleDefault;

@property (copy , nonatomic) NSString *type; // 1 为回复文章   2 回复人

@end

@implementation RemCommentViewController {
    NSMutableArray *commentArray;
    NSDictionary *dic;
    NSString *commentid; // 小评论id
    NSString *first_fcID; // 小评论id
    NSString *oneID; // 大评论id
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
        
        if ([weakSelf.type isEqualToString:@"1"]) {
            // 评论文章
            [weakSelf sendComment:text];
        }
        if ([weakSelf.type isEqualToString:@"2"]) {
            [weakSelf sendPersonComment:text];
        }
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
    commentArray = [NSMutableArray new];
    [self getDataFromUrl];
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:@"评论" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}


- (void)setUpUI {
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
    [self.bottomView addSubview:self.label];
    
}


- (void)setUIAutoLayout {
    
    [_bottomView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
    [_bottomView autoSetDimension:ALDimensionHeight toSize:50];
    
    [_label autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 20, 10, 20)];
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

- (void)getDataFromUrl {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/ReviewList",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"fmID"      : self.articleId
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            commentArray = [weakSelf commentDataArray:resultObject[@"obj"]];
            [weakSelf.tableView reloadData];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

- (NSMutableArray *)commentDataArray:(NSMutableArray *)param {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in param) {
        CommentModel *model = [CommentModel arrayWithDic:dic];
        [array addObject:model];
    }
    return array;
}


// 评论文章
- (void)sendComment:(NSString *)text {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/ArticleReviews",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                        @"app_key" : md5Url,
                        @"id"      : self.articleId,
                        @"fctitle" : text,
                        @"uid"     : GetUserDefault(userID)
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

- (void)sendPersonComment:(NSString *)text {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/Reply",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key"   : md5Url,
                          @"ArticleId" : self.articleId,
                          @"fctitle"   : text,
                          @"uid"       : GetUserDefault(userID),
                          @"commentid" : commentid,
                          @"first_fcID" : first_fcID,
                          @"fctitle"    : text,
                          @"oneID"      : oneID
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


#pragma  mark - UITableViewDelegate ,UITableViewDataSource
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    CommentModel *model = commentArray[section];
    return model.pic.count+1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return commentArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    CommentModel *model = commentArray[indexPath.section];
    if (indexPath.row == 0) {
        CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell"];
        cell.model = model;
        cell.replyBtn.tag = 500+indexPath.section;
        [cell.replyBtn addTarget:self action:@selector(sendBigComment:) forControlEvents:(UIControlEventTouchUpInside)];
        return cell;
    }else {
        ReplyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ReplyCell"];
        cell.dic = model.pic[indexPath.row - 1];
        return cell;
    }
    
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CommentModel *model = commentArray[indexPath.section];
    if (indexPath.row == 0) {
        CGRect rect = [model.fctitle boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-150, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil];
        
        return rect.size.height + 140;
    }
    NSDictionary *dic = model.pic[indexPath.row - 1];
    CGRect rect = [dic[@"fctitle"] boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-120, 10000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil];
    return rect.size.height+20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.1;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return;
    }else {
        self.type = @"2";
        CommentModel *model = commentArray[indexPath.section];
        NSDictionary *dic = model.pic[indexPath.row - 1];
        oneID = model.fcID;
        commentid = dic[@"fcID"];
        first_fcID = dic[@"fcID"];
        [self.inputViewStyleDefault show];
    }
}



// 点击弹出键盘
- (void)tapSeachView {
    self.type = @"1";
    [self.inputViewStyleDefault show];
}

// 回复 大评论
- (void)sendBigComment:(UIButton *)button {
    NSInteger index = button.tag - 500;
    CommentModel *model = commentArray[index];
    oneID = model.fcID;
    commentid = model.fcID;
    first_fcID = model.fcID;
    self.type = @"2";
    [self.inputViewStyleDefault show];
}


#pragma mark - 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-JCNew64-50) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = UIColorFromRGB(0xffffff);
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
        [_tableView registerClass:[CommentTableViewCell class] forCellReuseIdentifier:@"CommentCell"];
        [_tableView registerClass:[ReplyTableViewCell class] forCellReuseIdentifier:@"ReplyCell"];
    }
    return _tableView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initForAutoLayout];
    }
    return _bottomView;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initForAutoLayout];
        _label.textColor = UIColorFromRGB(0xa7a7a7);
        _label.font = [UIFont systemFontOfSize:14];
        _label.layer.borderWidth = 0.8;
        _label.layer.borderColor = UIColorFromRGB(0xa7a7a7).CGColor;
        _label.layer.cornerRadius = 12;
        [_label.layer setMasksToBounds:YES];
        _label.text = @"输入评论...";
        _label.textAlignment = NSTextAlignmentCenter;
        _label.userInteractionEnabled = YES;
        // 默认单击
        
        
        UITapGestureRecognizer * PrivateLetterTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapSeachView)];
        PrivateLetterTap.numberOfTouchesRequired = 1; //手指数
        PrivateLetterTap.numberOfTapsRequired = 1; //tap次数
        [_label addGestureRecognizer:PrivateLetterTap];
    }
    return _label;
}




@end
