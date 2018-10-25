//
//  MinePageViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/17.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "MinePageViewController.h"
#import "MinePageTableView.h"
#import "MLMSegmentManager.h"
#import "PageTabViewController.h"
#import "NIMSessionViewController.h"
#import "LoginViewController.h"
#import "MinePhotoViewController.h"
#import "OtherPhotoViewController.h"
#import "UILabel+SizeToFit.h"



@interface MinePageViewController ()<UITableViewDelegate , UITableViewDataSource>

@property (nonatomic,strong) MinePageTableView *tableView;
@property (nonatomic,strong) UITableViewCell *cell;
@property (nonatomic,strong) NSArray *childVCs;
@property (nonatomic,strong) NSArray *categoryTitles;

@property (nonatomic, strong) MLMSegmentHead *segHead;
@property (nonatomic, strong) MLMSegmentScroll *segScroll;

@property (nonatomic,assign) BOOL canScroll;//默认刚开始是YES
@property (nonatomic,assign) CGFloat offset_y;

//header
@property (nonatomic,assign) BOOL isHaveHeader;
@property (nonatomic,strong) UIView *header;
//@property (nonatomic,strong) UIImageView *headerImgView;
@property (nonatomic,strong) UIImageView *headerImg;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic , strong) UIImageView *lvImg;
@property (strong , nonatomic) UILabel *lvLabel;
@property (strong , nonatomic) UIButton *addBtn;
@property (strong , nonatomic) UIButton *sendBtn;
@property (strong , nonatomic) UIImageView *arrowImg;
@property (strong , nonatomic) UIButton *photoBtn;
@property (strong , nonatomic) UIView *lineView;
@property (strong , nonatomic) UILabel *signatureLabel;
@property (strong , nonatomic) UILabel *ageLabel;
@property (strong , nonatomic) UILabel *cityLabel;
@property (strong , nonatomic) UILabel *constellationLabel; // 星座
@property (strong , nonatomic) UILabel *singleLabel; // 单身
@property (strong , nonatomic) UILabel *attentionLabel;  // 关注
@property (strong , nonatomic) UILabel *fansLabel;
@property (strong , nonatomic) UILabel *zanLable;
@property (strong , nonatomic) UIImageView *img;

@property (strong , nonatomic) UIView *blackView; // 弹出时的黑屏
@property (strong , nonatomic) UIView *bgView;
@property (strong , nonatomic) UIImageView *img1;
@property (strong , nonatomic) UIImageView *img2;
@property (strong , nonatomic) UILabel *label1;
@property (strong , nonatomic) UILabel *label2;




@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) UILabel *signaLabel;
@property (nonatomic,strong) UIButton *editButton;
@property (nonatomic,strong) UIButton *shareButton;


@end

@implementation MinePageViewController

#pragma mark -只要调用这两个方法就可以了
-(void)setUpWithVCs:(NSArray*)VCs titles:(NSArray *)titles{
    self.childVCs = VCs;
    self.categoryTitles = titles;
    [self.tableView reloadData];
}
-(void)setUpHeaderImg:(NSString *)imgName{
    
//    self.headerImgView.image = [UIImage imageNamed:imgName];
    
    //    [self.tableView reloadData];
}



#pragma mark -viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//    self.navigationController.navigationBarHidden = YES;
    [self setNavigationBarTitle:@"个人信息" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
    //配置tableView
    [self setUpTableView];
    //默认刚开始是YES
    self.canScroll = YES;
    //通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeVCScrollState:) name:@"changeVCScrollState" object:nil];
    
    [self setUI];
    [self setUIAutoLayout];
    
}

- (void)setUI {
    [self.header addSubview:self.headerImg];
    [self.header addSubview:self.nameLabel];
    [self.header addSubview:self.lvImg];
    [self.lvImg addSubview:self.lvLabel];
    [self.header addSubview:self.img];
    
    if ([self.u_id isEqualToString:GetUserDefault(userID)]) {
        self.addBtn.hidden = YES;
        self.sendBtn.hidden = YES;
    }
    [self.header addSubview:self.addBtn];
    [self.header addSubview:self.sendBtn];
    [self.header addSubview:self.arrowImg];
    [self.header addSubview:self.photoBtn];
    [self.header addSubview:self.lineView];
    [self.header addSubview:self.signatureLabel];
    [self.header addSubview:self.ageLabel];
    [self.header addSubview:self.cityLabel];
    [self.header addSubview:self.constellationLabel];
    
    [self.header addSubview:self.attentionLabel];
    [self.header addSubview:self.fansLabel];
    [self.header addSubview:self.zanLable];
    [self.header addSubview:self.singleLabel];
    if (![self.u_id isEqualToString:GetUserDefault(userID)]) {
        [self addRightButton];
    }
    

}

- (void)setUIAutoLayout {
    
    [_headerImg autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:50];
    [_headerImg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:25];
    [_headerImg autoSetDimension:ALDimensionWidth toSize:100];
    [_headerImg autoSetDimension:ALDimensionHeight toSize:100];
    //    _headerImg.layer.borderWidth = 1;
    _headerImg.layer.cornerRadius = 50;
    _headerImg.clipsToBounds = YES;
    
    [_nameLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_headerImg withOffset:-20];
    [_nameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_headerImg withOffset:10];
    [_nameLabel autoSetDimension:ALDimensionWidth toSize:200];
    [_nameLabel autoSetDimension:ALDimensionHeight toSize:40];
//    _nameLabel.layer.borderWidth = 1;
    
    [_lvImg autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_headerImg withOffset:20];
    [_lvImg autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_headerImg withOffset:10];
    [_lvImg autoSetDimension:ALDimensionWidth toSize:90];
    [_lvImg autoSetDimension:ALDimensionHeight toSize:40];
//    _lvImg.layer.borderWidth = 1;
    
    [_lvLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(5, 5, 5, 0)];
    
    [_img autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_lvImg withOffset:4];
    [_img autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_lvImg];
    [_img autoSetDimension:ALDimensionWidth toSize:20];
    [_img autoSetDimension:ALDimensionHeight toSize:20];
    
    [_addBtn autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    [_addBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_addBtn autoSetDimension:ALDimensionWidth toSize:35];
    [_addBtn autoSetDimension:ALDimensionHeight toSize:35];
    
    [_sendBtn autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_addBtn];
    [_sendBtn autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_addBtn withOffset:-5];
    [_sendBtn autoSetDimension:ALDimensionHeight toSize:35];
    [_sendBtn autoSetDimension:ALDimensionWidth toSize:100];
    
    [_arrowImg autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_headerImg withOffset:0];
    [_arrowImg autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_arrowImg autoSetDimension:ALDimensionWidth toSize:20];
    [_arrowImg autoSetDimension:ALDimensionHeight toSize:20];
    
    [_photoBtn autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_arrowImg];
    [_photoBtn autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_arrowImg withOffset:-5];
    [_photoBtn autoSetDimension:ALDimensionHeight toSize:20];
    [_photoBtn autoSetDimension:ALDimensionWidth toSize:100];
    
    [_lineView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_photoBtn withOffset:15];
    [_lineView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_lineView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_lineView autoSetDimension:ALDimensionHeight toSize:2];
    
    [_signatureLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_lineView withOffset:20];
    [_signatureLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_signatureLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_signatureLabel autoSetDimension:ALDimensionHeight toSize:20];
    
    
    
//    [_singleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_ageLabel withOffset:5];
    [_singleLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_attentionLabel withOffset:-5];
    [_singleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_singleLabel autoSetDimension:ALDimensionWidth toSize:80];
    [_singleLabel autoSetDimension:ALDimensionHeight toSize:30];
    
//    CGSize maximumLabelSize = CGSizeMake(100, 9999);//labelsize的最大值
//    CGSize expectSize = [_attentionLabel sizeThatFits:maximumLabelSize];
    [_attentionLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
//    [_attentionLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_singleLabel withOffset:15];
    [_attentionLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
    [_attentionLabel autoSetDimension:ALDimensionWidth toSize:60];
    [_attentionLabel autoSetDimension:ALDimensionHeight toSize:20];
    NSLog(@"%@",self.infoDic);
//    CGSize maximumfansLabelSize = CGSizeMake(100, 9999);//labelsize的最大值
//    CGSize fansExpectSize = [_fansLabel sizeThatFits:maximumfansLabelSize];
    [_fansLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_attentionLabel withOffset:10];
//    [_fansLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_singleLabel withOffset:15];
    [_fansLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
    [_fansLabel autoSetDimension:ALDimensionWidth toSize:60];
    [_fansLabel autoSetDimension:ALDimensionHeight toSize:20];
    
//    CGSize maximumzanLabelSize = CGSizeMake(100, 9999);//labelsize的最大值
//    CGSize zanExpectSize = [_zanLable sizeThatFits:maximumzanLabelSize];
    [_zanLable autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_fansLabel withOffset:10];
//    [_zanLable autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_singleLabel withOffset:15];
    [_zanLable autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
    [_zanLable autoSetDimension:ALDimensionWidth toSize:60];
    [_zanLable autoSetDimension:ALDimensionHeight toSize:20];
    
    
    
}

// 右侧按钮
- (void)addRightButton {
    UIButton *rightBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:@"拉黑" forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    rightBtn.frame = CGRectMake(0, 0, 44, 44);
    UIBarButtonItem* rightBtnItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    [rightBtn addTarget:self action:@selector(rightButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setRightBarButtonItem:rightBtnItem];
}

- (void)rightButton:(UIButton *)button {
    
    if ([GetUserDefault(isLogin) boolValue] == NO) {
        LoginViewController*vc = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    
    
    
    
    UIAlertController * alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"拉黑此用户后将无法查看此用户信息与动态" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self blacklistUser];
        
    }];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertVC addAction:cancel];
    [alertVC addAction:ok];
    [self presentViewController:alertVC animated:YES completion:nil];
}



// 拉黑
- (void)blacklistUser {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_user/PullBlack",baseUrl];
    NSString *mdUrl = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : mdUrl,
                          @"uid"     : GetUserDefault(userID),
                          @"bid"   : self.u_id
                          };
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            [LCProgressHUD showMessage:@"拉黑成功"];
        }else {
            [LCProgressHUD showMessage:resultObject[@"message"]];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        [LCProgressHUD showMessage:resultObject[@"message"]];
    }];
}

/*
 
 */


- (void)setInfoDic:(NSDictionary *)infoDic {
    _infoDic = infoDic;
    _singleLabel.text = [NSString stringWithFormat:@"%@",_infoDic[@"usermarry"]];
    [_headerImg sd_setImageWithURL:[NSURL URLWithString:_infoDic[@"userpic"]] placeholderImage:nil];
    _nameLabel.text = [NSString stringWithFormat:@"%@",_infoDic[@"username"]];
    _lvLabel.text = [NSString stringWithFormat:@"LV%@",_infoDic[@"usergrade"]];
    _signatureLabel.text = [NSString stringWithFormat:@"%@",_infoDic[@"userautograph"]];
    _ageLabel.text = [NSString stringWithFormat:@"%@",_infoDic[@"age"]];
    _cityLabel.text = [NSString stringWithFormat:@"%@",_infoDic[@"address"]];
    _constellationLabel.text = [NSString stringWithFormat:@"%@",_infoDic[@"constellation"]];
    _attentionLabel.text = [NSString stringWithFormat:@"%@关注",_infoDic[@"userlike"]];
    _fansLabel.text = [NSString stringWithFormat:@"%@粉丝",_infoDic[@"userbelike"]];
    _zanLable.text = [NSString stringWithFormat:@"%@获赞",_infoDic[@"GiveCount"]];
    if ([_infoDic[@"follow"] isEqualToString:@"0"]) {
        _sendBtn.selected = NO;
    }else {
        _sendBtn.selected = YES;
    }
    if ([_infoDic[@"friends"] isEqualToString:@"0"]) {
        NSLog(@"不是好友");
        _addBtn.selected = NO;
    }else {
        _addBtn.selected = YES;
    }
    if ([_infoDic[@"leader"] isEqualToString:@"0"]) {
        _img.image = [UIImage imageNamed:@""];
    }else {
        _img.image = [UIImage imageNamed:@"Group 18"];
    }
    
    CGFloat width1 = [_ageLabel widthOfSizeToFit];
    [_ageLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_ageLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_signatureLabel withOffset:10];
    [_ageLabel autoSetDimension:ALDimensionWidth toSize:width1+10];
    [_ageLabel autoSetDimension:ALDimensionHeight toSize:30];
    
    CGFloat width2 = [_cityLabel widthOfSizeToFit];
    [_cityLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_ageLabel withOffset:10];
    [_cityLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_signatureLabel withOffset:10];
    [_cityLabel autoSetDimension:ALDimensionWidth toSize:width2+10];
    [_cityLabel autoSetDimension:ALDimensionHeight toSize:30];
    
    CGFloat width3 = [_constellationLabel widthOfSizeToFit];
    [_constellationLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_cityLabel withOffset:10];
    [_constellationLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_signatureLabel withOffset:10];
    [_constellationLabel autoSetDimension:ALDimensionWidth toSize:width3+10];
    [_constellationLabel autoSetDimension:ALDimensionHeight toSize:30];
}


//配置tableView
-(void)setUpTableView{
    self.tableView = [[MinePageTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableHeaderView = self.header;
    self.isHaveHeader = YES;
    //注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"pagecell"];
    
}
#pragma mark -UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    self.cell = [tableView dequeueReusableCellWithIdentifier:@"pagecell" forIndexPath:indexPath];
    [self setUpSegment];
    return self.cell;
}
//cell 高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return tableView.frame.size.height;
}

#pragma mark - 添加子控制器
- (void)setUpSegment {
    
    NSArray *list = self.categoryTitles;
    _segHead = [[MLMSegmentHead alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44) titles:list headStyle:SegmentHeadStyleSlide layoutStyle:MLMSegmentLayoutDefault];
    _segHead.fontScale = 1.2;
    _segHead.fontSize = 14;
    _segHead.slideColor = UIColorFromRGB(0xff9d00);
//    _segHead.deSelectColor = UIColorFromRGB(0xff9d00);
    _segHead.selectColor = UIColorFromRGB(0xffffff);
    _segHead.headColor = UIColorFromRGB(0x000000);
    _segHead.lineScale = 0.2;
    _segHead.lineColor = UIColorFromRGB(0x505050);
    _segHead.bottomLineColor = UIColorFromRGB(0xe6e6e6);
    
    _segScroll = [[MLMSegmentScroll alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_segHead.frame), SCREEN_WIDTH, self.tableView.frame.size.height-CGRectGetMaxY(_segHead.frame)) vcOrViews:[self vcArr:list.count]];
    _segScroll.loadAll = YES;
    _segScroll.showIndex = 0;
    
    [MLMSegmentManager associateHead:_segHead withScroll:_segScroll completion:^{
        [self.cell.contentView addSubview:_segHead];
        [self.cell.contentView addSubview:_segScroll];
    }];
}
- (NSArray *)vcArr:(NSInteger)count {
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < self.childVCs.count; i++) {
        PageTabViewController *vc = self.childVCs[i];
        [arr addObject:vc];
    }
    return arr;
}
#pragma mark -通知
-(void)changeVCScrollState:(NSNotification *)sender{
    self.canScroll = YES;
    for (int i = 0; i < self.childVCs.count; i++) {
        PageTabViewController *vc = self.childVCs[i];
        vc.vcCanScroll = NO;
    }
}




#pragma mark -UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    
    if (scrollView == self.tableView) {
        self.offset_y = scrollView.contentOffset.y;
        /* 关键 */
        CGFloat headerOffset = 0.0;
        if (self.isHaveHeader) {
            headerOffset = k_Header_Height;
        }else{
            headerOffset = 0.0;
        }
        if (self.offset_y >= headerOffset) {
            scrollView.contentOffset = CGPointMake(0, headerOffset);
            if (self.canScroll) {
                self.canScroll = NO;
                for (int i = 0; i < self.childVCs.count; i++) {
                    PageTabViewController *vc = self.childVCs[i];
                    vc.vcCanScroll = YES;
                }
            }
        }else{
            if (!self.canScroll) {
                scrollView.contentOffset = CGPointMake(0, headerOffset);
            }
        }
        self.tableView.showsVerticalScrollIndicator = _canScroll?YES:NO;
    }
}


// 加好友
- (void)addFriend {
    if ([GetUserDefault(isLogin) boolValue] == NO) {
        LoginViewController*vc = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    if ([_infoDic[@"friends"] isEqualToString:@"0"]) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"备注" preferredStyle:UIAlertControllerStyleAlert];
        
        //增加取消按钮；
        [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
        //增加确定按钮；
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            //获取第1个输入框；
            UITextField *userNameTextField = alertController.textFields.firstObject;
            [self addFriendWithText:userNameTextField.text];
            NSLog(@"用户名 = %@",userNameTextField.text);
            
        }]];
        //定义第一个输入框；
        [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"请输入备注";
        }];
        [self presentViewController:alertController animated:true completion:nil];
    }else {
        NIMSession *session = [NIMSession session:_infoDic[@"wy_accid"] type:NIMSessionTypeP2P];
        NIMSessionViewController *vc = [[NIMSessionViewController alloc] initWithSession:session];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

- (void)addFriendWithText:(NSString *)text {
    if (text == nil) {
        text = @"";
    }
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_user/Addfriends",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"uid"     : GetUserDefault(userID),
                          @"friendId" : self.u_id,
                          @"describe" : text
                          };
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            [LCProgressHUD showMessage:@"发送成功"];
        }else {
            [LCProgressHUD showMessage:resultObject[@"message"]];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}


// 友记关注人
- (void)attentionAction:(UIButton *)button {
    if ([GetUserDefault(isLogin) boolValue] == NO) {
        LoginViewController*vc = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        return;
    }
    button.selected = !button.selected;
    [self attention];
}

- (void)attention {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_user/attention_captain",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"userID"     : GetUserDefault(userID),
                          @"attention_userID"  : self.u_id
                          };
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
    
}

- (void)photoBtnAction:(UIButton *)button {
    if ([self.u_id isEqualToString:GetUserDefault(userID)]) {
        MinePhotoViewController *vc = [[MinePhotoViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }else {
        OtherPhotoViewController *vc = [[OtherPhotoViewController alloc] init];
        vc.u_id = self.u_id;
        [self.navigationController pushViewController:vc animated:YES];
        
    }
}

// 点击二维码图片  弹出二维码
- (void)tapShowAction:(UITapGestureRecognizer *)tap {
    UIWindow *window = [[UIApplication sharedApplication].delegate window];
    [window addSubview:self.blackView];
    [window addSubview:self.bgView];
    [self.bgView addSubview:self.img1];
    [self.bgView addSubview:self.img2];
    [self.bgView addSubview:self.label1];
    [self.bgView addSubview:self.label2];
    
    [_blackView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    [_bgView autoCenterInSuperview];
    [_bgView autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH-100];
    [_bgView autoSetDimension:ALDimensionHeight toSize:100];
    
    [_img1 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_img1 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
    [_img1 autoSetDimension:ALDimensionWidth toSize:20];
    [_img1 autoSetDimension:ALDimensionHeight toSize:20];
    
    [_img2 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_img2 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:15];
    [_img2 autoSetDimension:ALDimensionWidth toSize:20];
    [_img2 autoSetDimension:ALDimensionHeight toSize:20];
    
    [_label1 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_img1];
    [_label1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img1 withOffset:3];
    [_label1 autoSetDimension:ALDimensionHeight toSize:40];
    [_label1 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    
    [_label2 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_img2];
    [_label2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img2 withOffset:3];
    [_label2 autoSetDimension:ALDimensionHeight toSize:40];
    [_label2 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
}

// 点击黑色背景二维码消失
- (void)tapHiddenAction:(UITapGestureRecognizer *)tap {
    __weak typeof(self)vc = self;
    [UIView animateWithDuration:0.4 animations:^{
        _blackView.alpha = 0;
        _bgView.alpha = 0;
    }completion:^(BOOL finished) {
        [vc.blackView removeFromSuperview];
        [vc.bgView removeFromSuperview];
        vc.blackView = nil;
        vc.bgView = nil;
    }];
    
}

#pragma mark -懒加载
-(UIView *)header{
    if (!_header) {
        _header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, k_Header_Height)];
        _header.backgroundColor = UIColorFromRGB(0x1f212d);
    }
    return _header;
}

- (UIImageView *)headerImg {
    if (!_headerImg) {
        _headerImg = [[UIImageView alloc] initForAutoLayout];
//        _headerImg.image = [UIImage imageNamed:@"2"];
    }
    return _headerImg;
}
- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initForAutoLayout];
//        _nameLabel.text = @"李嘉图";
        _nameLabel.textColor = UIColorFromRGB(0xffffff);
        _nameLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:17];
    }
    return _nameLabel;
}
- (UIImageView *)lvImg {
    if (!_lvImg) {
        _lvImg = [[UIImageView alloc] initForAutoLayout];
        _lvImg.image = [UIImage imageNamed:@"level-v"];
        _lvImg.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _lvImg;
}

- (UILabel *)lvLabel {
    if (!_lvLabel) {
        _lvLabel = [[UILabel alloc] initForAutoLayout];
//        _lvLabel.text = @"LV0";
        _lvLabel.textColor = UIColorFromRGB(0xffffff);
        _lvLabel.font = [UIFont systemFontOfSize:15];
        _lvLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _lvLabel;
}

- (UIButton *)addBtn {
    if (!_addBtn) {
        _addBtn = [[UIButton alloc] initForAutoLayout];
        [_addBtn setBackgroundColor:UIColorFromRGB(0xff9d00)];
        [_addBtn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
        [_addBtn setImage:[UIImage imageNamed:@"发消息"] forState:UIControlStateSelected];
        _addBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_addBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        [_addBtn setImageEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
        _addBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _addBtn.layer.cornerRadius = 4;
        [_addBtn.layer setMasksToBounds:YES];
        [_addBtn addTarget:self action:@selector(addFriend) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _addBtn;
}


- (UIButton *)sendBtn {
    if (!_sendBtn) {
        _sendBtn = [[UIButton alloc] initForAutoLayout];
        [_sendBtn setBackgroundColor:UIColorFromRGB(0xff9d00)];
        [_sendBtn setTitle:@"加关注" forState:UIControlStateNormal];
        [_sendBtn setTitle:@"已关注" forState:UIControlStateSelected];
        [_sendBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        [_sendBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateSelected];
        _sendBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _sendBtn.layer.cornerRadius = 4;
        [_sendBtn.layer setMasksToBounds:YES];
        [_sendBtn addTarget:self action:@selector(attentionAction:) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _sendBtn;
}

- (UIImageView *)arrowImg {
    if (!_arrowImg) {
        _arrowImg = [[UIImageView alloc] initForAutoLayout];
        _arrowImg.image = [UIImage imageNamed:@"r_into"];
        _arrowImg.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _arrowImg;
}

- (UIButton *)photoBtn
{
    if (!_photoBtn) {
        _photoBtn = [[UIButton alloc] initForAutoLayout];
        _photoBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [_photoBtn setImage:[[UIImage imageNamed:@"camera"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        _photoBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_photoBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        [_photoBtn setTitle:[NSString stringWithFormat:@"ta的相册"] forState:UIControlStateNormal];
        _photoBtn.titleEdgeInsets = UIEdgeInsetsMake(0,  -(_photoBtn.imageView.frame.origin.x+_photoBtn.imageView.frame.size.width+15), 0, 0);
        //button图片的偏移量
        _photoBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -(_photoBtn.imageView.frame.origin.x +10), 0, _photoBtn.imageView.frame.origin.x);
        [_photoBtn addTarget:self action:@selector(photoBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _photoBtn;
}
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] initForAutoLayout];
        _lineView.backgroundColor = UIColorFromRGB(0x8e8f95);
    }
    return _lineView;
}

- (UILabel *)signatureLabel {
    if (!_signatureLabel) {
        _signatureLabel = [[UILabel alloc] initForAutoLayout];
//        _signatureLabel.text = @"个性签名:是克服了两件事放得开了撒酒疯";
        _signatureLabel.textColor = UIColorFromRGB(0xffffff);
        _signatureLabel.font = [UIFont systemFontOfSize:15];
    }
    return _signatureLabel;
}

- (UILabel *)ageLabel {
    if (!_ageLabel) {
        _ageLabel = [[UILabel alloc] initForAutoLayout];
//        _ageLabel.text = @"20";
        _ageLabel.textColor = UIColorFromRGB(0xffffff);
        _ageLabel.backgroundColor = UIColorFromRGB(0x494a53);
        _ageLabel.font = [UIFont systemFontOfSize:15];
        _ageLabel.layer.cornerRadius = 10;
        [_ageLabel.layer setMasksToBounds:YES];
        _ageLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _ageLabel;
}

- (UILabel *)cityLabel {
    if (!_cityLabel) {
        _cityLabel = [[UILabel alloc] initForAutoLayout];
//        _cityLabel.text = @"哈尔滨";
        _cityLabel.textColor = UIColorFromRGB(0xffffff);
        _cityLabel.backgroundColor = UIColorFromRGB(0x494a53);
        _cityLabel.font = [UIFont systemFontOfSize:15];
        _cityLabel.numberOfLines = 0;//根据最大行数需求来设置
        _cityLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _cityLabel.layer.cornerRadius = 10;
        [_cityLabel.layer setMasksToBounds:YES];
        _cityLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _cityLabel;
}
- (UILabel *)constellationLabel {
    if (!_constellationLabel) {
        _constellationLabel = [[UILabel alloc] initForAutoLayout];
//        _constellationLabel.text = @"双鱼座";
        _constellationLabel.textColor = UIColorFromRGB(0xffffff);
        _constellationLabel.backgroundColor = UIColorFromRGB(0x494a53);
        _constellationLabel.font = [UIFont systemFontOfSize:15];
        _constellationLabel.layer.cornerRadius = 10;
        [_constellationLabel.layer setMasksToBounds:YES];
        _constellationLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _constellationLabel;
}
- (UILabel *)singleLabel {
    if (!_singleLabel) {
        _singleLabel = [[UILabel alloc] initForAutoLayout];
        //        _constellationLabel.text = @"双鱼座";
        _singleLabel.textColor = UIColorFromRGB(0xffffff);
        _singleLabel.backgroundColor = UIColorFromRGB(0x494a53);
        _singleLabel.font = [UIFont systemFontOfSize:15];
        _singleLabel.layer.cornerRadius = 10;
        [_singleLabel.layer setMasksToBounds:YES];
        _singleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _singleLabel;
}

- (UILabel *)attentionLabel {
    if (!_attentionLabel) {
        _attentionLabel = [[UILabel alloc] initForAutoLayout];
//        _attentionLabel.text = @"100关注";
        _attentionLabel.textColor = UIColorFromRGB(0xffffff);
//        _attentionLabel.backgroundColor = UIColorFromRGB(0x494a53);
        _attentionLabel.font = [UIFont systemFontOfSize:15];
        _attentionLabel.textAlignment = NSTextAlignmentCenter;
//        _attentionLabel.layer.cornerRadius = 10;
//        [_attentionLabel.layer setMasksToBounds:YES];
    }
    return _attentionLabel;
}

- (UILabel *)fansLabel {
    if (!_fansLabel) {
        _fansLabel = [[UILabel alloc] initForAutoLayout];
//        _fansLabel.text = @"100粉丝";
        _fansLabel.textColor = UIColorFromRGB(0xffffff);
        //        _attentionLabel.backgroundColor = UIColorFromRGB(0x494a53);
        _fansLabel.font = [UIFont systemFontOfSize:15];
        _fansLabel.textAlignment = NSTextAlignmentCenter;
        //        _attentionLabel.layer.cornerRadius = 10;
        //        [_attentionLabel.layer setMasksToBounds:YES];
    }
    return _fansLabel;
}
- (UILabel *)zanLable {
    if (!_zanLable) {
        _zanLable = [[UILabel alloc] initForAutoLayout];
        _zanLable.textColor = UIColorFromRGB(0xffffff);
        _zanLable.font = [UIFont systemFontOfSize:15];
        _zanLable.textAlignment = NSTextAlignmentCenter;
    }
    return _zanLable;
}

- (UIImageView *)img {
    if (!_img) {
        _img = [[UIImageView alloc] initForAutoLayout];
        _img.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapShowAction:)];
        tap.numberOfTapsRequired = 1;
        [_img addGestureRecognizer:tap];
    }
    return _img;
}

- (UIView *)blackView{
    if (!_blackView) {
        _blackView = [[UIView alloc] initForAutoLayout];
        _blackView.backgroundColor = [UIColor blackColor];
        _blackView.alpha = 0.7;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHiddenAction:)];
        tap.numberOfTapsRequired = 1;
        [_blackView addGestureRecognizer:tap];
    }
    return _blackView;
}

- (UIView *)bgView{
    if (!_bgView) {
        _bgView = [[UIView alloc] initForAutoLayout];
        _bgView.backgroundColor = [UIColor whiteColor];
        
    }
    return _bgView;
}

- (UIImageView *)img1 {
    if (!_img1) {
        _img1 = [[UIImageView alloc] initForAutoLayout];
        _img1.image = [UIImage imageNamed:@"Group 18"];
        
    }
    return _img1;
}
- (UIImageView *)img2 {
    if (!_img2) {
        _img2 = [[UIImageView alloc] initForAutoLayout];
        _img2.image = [UIImage imageNamed:@"Group 20"];
        
    }
    return _img2;
}
- (UILabel *)label1 {
    if (!_label1) {
        _label1 = [[UILabel alloc] initForAutoLayout];
        _label1.textColor = UIColorFromRGB(0x333333);
        _label1.font = [UIFont systemFontOfSize:13];
        _label1.numberOfLines = 2;
        _label1.text = @"认证队长,官网认证指定队长,活动由官网审核";
    }
    return _label1;
}
- (UILabel *)label2 {
    if (!_label2) {
        _label2 = [[UILabel alloc] initForAutoLayout];
        _label2.textColor = UIColorFromRGB(0x333333);
        _label2.font = [UIFont systemFontOfSize:13];
        _label2.numberOfLines = 2;
        _label2.text = @"普通队长,活动自发组织,未经官网审核";
    }
    return _label2;
}


@end
