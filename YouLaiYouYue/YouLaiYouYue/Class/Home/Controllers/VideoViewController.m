//
//  VideoViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/9/7.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "VideoViewController.h"
#import "PartyViewController.h"
#import "XLVideoPlayer.h"
#import "CorrelationView.h"
#import "BaseLabel.h"
#import "ActivityInfoModel.h"
@interface VideoViewController ()<UITableViewDelegate , UITableViewDataSource ,CorrelationDelegate>

@property (nonatomic, strong)  XLVideoPlayer *player;

@property (strong , nonatomic) BaseLabel *titleLabel;

@property (strong , nonatomic) UIImageView *arrowImg;
@property (strong , nonatomic) UIButton *photoBtn;

@property (strong , nonatomic) UITableView *tableView;

@property (strong , nonatomic) CorrelationView *corrView;

@end

@implementation VideoViewController {
    NSMutableArray *actArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.fd_prefersNavigationBarHidden = YES;
    self.view.backgroundColor = [UIColor blackColor];
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
    actArray = [NSMutableArray new];
    [self getDataFromUrl];
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:@"模板" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}


- (void)setUpUI {
    
    [self addPlay];
    [self addNavView];
}


- (void)setUIAutoLayout {
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:15];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:15];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:80];
    [_titleLabel autoSetDimension:ALDimensionHeight toSize:50];
    
    [_arrowImg autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:5];
    [_arrowImg autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:15];
    [_arrowImg autoSetDimension:ALDimensionWidth toSize:10];
    [_arrowImg autoSetDimension:ALDimensionHeight toSize:15];
    
    [_photoBtn autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_arrowImg];
    [_photoBtn autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_arrowImg withOffset:0];
    [_photoBtn autoSetDimension:ALDimensionHeight toSize:20];
    [_photoBtn autoSetDimension:ALDimensionWidth toSize:100];
}

- (void)getDataFromUrl {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_activity/video_activity",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"vID"     : self.model.vID
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            actArray = [weakSelf dataArray:resultObject[@"obj"]];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
    
}

- (NSMutableArray *)dataArray:(NSMutableArray *)param {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in param) {
        ActivityInfoModel *model = [ActivityInfoModel arrayWithDic:dic];
        [array addObject:model];
    }
    return array;
}

- (void)addPlay {
    //    [_player destroyPlayer];
    //    _player = nil;
    _player = [[XLVideoPlayer alloc] init];
    
    // 播放网络视频
    _player.videoUrl = self.model.vurl;
    [_player playerBindTableView:nil currentIndexPath:nil];
    _player.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:_player];
    
    _player.completedPlayingBlock = ^(XLVideoPlayer *player) {
        [player destroyPlayer];
        _player = nil;
    };
}

- (void)addNavView
{
    UIButton* leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame     = CGRectMake(25, JCNew64-44, 44, 44);
    [leftButton setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateSelected];
    [leftButton addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
    leftButton.imageEdgeInsets            = UIEdgeInsetsMake(0, -30, 0, 0);
    [self.view addSubview:leftButton];
    
    self.titleLabel.text = self.model.vname;
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.arrowImg];
    [self.view addSubview:self.photoBtn];
    
}

- (void)popViewController {
    [self.player destroyPlayer];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)showView {
    _corrView = [[CorrelationView alloc]init];
    _corrView.actArray = actArray;
    _corrView.delegate = self;
    [_corrView showInView:self.view];
}

- (void)didCellItem:(NSInteger)item {
    self.player.playOrPauseBtn.selected = NO;
    [self.player.player pause];
    PartyViewController *vc = [[PartyViewController alloc] init];
    ActivityInfoModel *model = actArray[item];
    vc.activityId = model.pfID;
    [self.navigationController pushViewController:vc animated:YES];
}


- (BaseLabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[BaseLabel alloc] initForAutoLayout];
        _titleLabel.text = @"是开放老电视剧按老规矩拉进来的结果来看飞机过来看房的结果拉就拉上解放路看电视剧了咖啡教室里的会计法拉的屎分开了设计费拉数据量放假了可根据拉丝机骨干教师老地方讲师端拉法基放大镜积分大家疯狂的萨芬;来得快三方里付款;杀了开发;了的撒";
        _titleLabel.textColor = UIColorFromRGB(0xffffff);
        _titleLabel.numberOfLines = 2;
        _titleLabel.font = [UIFont systemFontOfSize:15];
        [_titleLabel setVerticalAlignment:VerticalAlignmentTop];
        
    }
    return _titleLabel;
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
        _photoBtn.titleLabel.font = [UIFont systemFontOfSize:15];
//        [_photoBtn setImage:[[UIImage imageNamed:@"camera"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
//        _photoBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_photoBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        [_photoBtn setTitle:[NSString stringWithFormat:@"相关活动"] forState:UIControlStateNormal];
        _photoBtn.titleLabel.textAlignment = NSTextAlignmentRight;
        _photoBtn.titleEdgeInsets = UIEdgeInsetsMake(0,  25, 0, 0);
//        //button图片的偏移量
//        _photoBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -(_photoBtn.imageView.frame.origin.x +10), 0, _photoBtn.imageView.frame.origin.x);
        [_photoBtn addTarget:self action:@selector(showView) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _photoBtn;
}

@end
