//
//  MineViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/16.
//  Copyright © 2018年 yiwo. All rights reserved.
//


// VC
#import "MineViewController.h"
#import "LoginViewController.h"
#import "EditInfoViewController.h"       // 编辑个人信息
#import "SetUpViewController.h"          // 设置
#import "CollectViewController.h"        // 收藏的友记
#import "BrowseViewController.h"         // 浏览历史
#import "AttentionViewController.h"      // 我的关注
#import "StartActivityViewController.h"  // 发起活动
#import "JoinActivityViewController.h"   // 参加活动
#import "NewFriendViewController.h"      // 新建友记
#import "MyRememberViewController.h"     // 我的友记
#import "MyInsertViewController.h"       // 我的插文
#import "DraftViewController.h"          // 草稿
#import "FriendsTogetherViewController.h" // 创建行程(创建友聚)
#import "OrderPageViewController.h"
#import "OrderPageViewController.h"
#import "PageViewController.h"
#import "MinePhotoViewController.h"       // 我的相册
#import "MyFriendViewController.h"
#import "AttentActivityViewController.h"  // 我关注的活动
#import "MineCommentViewController.h"
#import "MessageViewController.h"

// Cell
#import "HeadTableViewCell.h"
#import "TitleTableViewCell.h"
#import "TypeTableViewCell.h"
#import "MineTableViewCell.h"

// Model
#import "PersonModel.h"


@interface MineViewController ()<UITableViewDelegate , UITableViewDataSource>

@property (strong , nonatomic) UITableView *tableView;
@property (strong , nonatomic) PersonModel *personModel;

@end

@implementation MineViewController {
    NSMutableDictionary *dicOne;
    NSMutableDictionary *dicTwo;
    NSArray *nameArr;
    NSArray *picArr;
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
    
    [self getDataFromUrl];
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
    dicOne = [NSMutableDictionary new];
    dicTwo = [NSMutableDictionary new];
    NSArray *titleArr = @[@"待支付",@"进行中",@"待评价",@"退款"];
    NSArray *imgArr = @[@"dzf",@"travl",@"evaluation",@"refund"];
    [dicOne setValue:titleArr forKey:@"text"];
    [dicOne setValue:imgArr forKey:@"img"];
    
    NSArray *arr1 = @[@"新建",@"友记",@"插文",@"草稿"];
    NSArray *arr2 = @[@"xj",@"yj",@"cw",@"cg"];
    [dicTwo setValue:arr1 forKey:@"text"];
    [dicTwo setValue:arr2 forKey:@"img"];
    
    nameArr = @[@"关注的朋友",@"关注的活动",@"收藏的友记",@"我的相册",@"我的好友",@"我的评论",@"参加的活动",@"浏览历史",@"设置"];
    picArr = @[@"wdgz",@"con",@"wdsc",@"wdxc",@"wdhy",@"wdpl",@"cjhd",@"llls",@"系统消息"];
    
    
    
    
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:@"我的" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}


- (void)setUpUI {
    [self addRightButton];
    [self.view addSubview:self.tableView];
}


- (void)setUIAutoLayout {
    
}

- (void)getDataFromUrl {
    
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_user/UserInformation",baseUrl];
    NSString *mdUrl = [self MD5ForLower32Bate:url];
    if (GetUserDefault(userID) == nil) {
        SetUserDefault(@"", userID);
    }
    NSDictionary *dic = @{
                          @"app_key" : mdUrl,
                          @"uid"      : GetUserDefault(userID)
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            
            _personModel = [PersonModel arrayWithDic:resultObject[@"obj"]];
            if ([_personModel.vip isEqualToString:@"1"]) {
                nameArr = @[@"关注的朋友",@"关注的活动",@"收藏的友记",@"我的相册",@"我的好友",@"我的评论",@"创建活动",@"发起的活动",@"参加的活动",@"浏览历史",@"设置"];
                picArr = @[@"wdgz",@"con",@"wdsc",@"wdxc",@"wdhy",@"wdpl",@"cjhd-1",@"fqhd",@"cjhd",@"llls",@"系统消息"];
            }else {
                nameArr = @[@"关注的朋友",@"关注的活动",@"收藏的友记",@"我的相册",@"我的好友",@"我的评论",@"参加的活动",@"浏览历史",@"设置"];
                picArr = @[@"wdgz",@"con",@"wdsc",@"wdxc",@"wdhy",@"wdpl",@"cjhd",@"llls",@"系统消息"];
            }
            [weakSelf.tableView reloadData];
        }
    } swpResultError:^(id resultObject, NSString *errorMessage) {
        
    }];
}

// 右侧按钮
- (void)addRightButton {
    UIButton *rightBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:@"消息" forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [rightBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    rightBtn.frame = CGRectMake(0, 0, 44, 44);
    UIBarButtonItem* rightBtnItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    [rightBtn addTarget:self action:@selector(rightButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setRightBarButtonItem:rightBtnItem];
}

- (void)rightButton:(UIButton *)button {
    MessageViewController *vc = [[MessageViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma  mark - UITableViewDelegate ,UITableViewDataSource
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1 || section == 2) {
        
        return 2;
    }else {
        return 1;
    }
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return nameArr.count + 3;
}

static TitleTableViewCell * extracted(UITableView * _Nonnull tableView) {
    TitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TitleCell"];
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    if (indexPath.section == 0) {
        HeadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HeadCell"];
        cell.model = _personModel;
        return cell;
    }
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            TitleTableViewCell * cell = extracted(tableView);
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.titleLabel.text = @"我的订单";
            cell.moreLabel.text = @"查看更多订单";
            return cell;
        }else {
            TypeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TypeCell"];
            cell.dic = dicOne;
            cell.section = indexPath.section;
            [self clickCell:cell];
            return cell;
        }
    }
    if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            TitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TitleCell"];
            cell.titleLabel.text = @"我的友记";
            return cell;
        }else {
            
            TypeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TypeCell"];
            cell.section = indexPath.section;
            cell.dic = dicTwo;
            [self clickCell:cell];
            
            
            return cell;
        }
    }else {
        
        MineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineCell"];
        cell.titleLabel.text = nameArr[indexPath.section - 3];
        cell.img.image = [UIImage imageNamed:picArr[indexPath.section - 3]];
        return cell;
    }
    
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 122;
    }
    if (indexPath.section == 1 || indexPath.section == 2) {
        if (indexPath.row == 0) {
            return 42;
        }else {
            return 80;
        }
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
    
    if ([GetUserDefault(isLogin) boolValue] == NO) {


        LoginViewController*vc = [[LoginViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        return;

    }else {
        if (indexPath.section == 0) {
            EditInfoViewController *vc = [[EditInfoViewController alloc] init];
            vc.model = _personModel;
            [self.navigationController pushViewController:vc animated:YES];
        }
        if (indexPath.section == 1 && indexPath.row == 0) {
            OrderPageViewController *vc = [[OrderPageViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        if (indexPath.section == 3) {
            // 关注的朋友
            AttentionViewController *vc = [[AttentionViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        if (indexPath.section == 4) {
            AttentActivityViewController *vc = [[AttentActivityViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        if (indexPath.section == 5) {
            // 我的收藏
            CollectViewController *vc = [[CollectViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        if (indexPath.section == 6) {
            MinePhotoViewController *vc = [[MinePhotoViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        if (indexPath.section == 7) {
            MyFriendViewController *vc = [[MyFriendViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
        if (indexPath.section == 8) {
            
            MineCommentViewController *vc = [[MineCommentViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
        if ([_personModel.vip isEqualToString:@"1"]) {
            if (indexPath.section == 9) {
                
                FriendsTogetherViewController *vc = [[FriendsTogetherViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
            if (indexPath.section == 10) {
                StartActivityViewController *vc = [[StartActivityViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
            if (indexPath.section == 11) {
                JoinActivityViewController *vc = [[JoinActivityViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
            if (indexPath.section == 12) {
                // 浏览历史
                BrowseViewController *vc = [[BrowseViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
            if (indexPath.section == 13) {
                SetUpViewController *vc = [[SetUpViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
        }else {
//            if (indexPath.section == 9) {
//
//                FriendsTogetherViewController *vc = [[FriendsTogetherViewController alloc] init];
//                [self.navigationController pushViewController:vc animated:YES];
//            }
//            if (indexPath.section == 10) {
//                StartActivityViewController *vc = [[StartActivityViewController alloc] init];
//                [self.navigationController pushViewController:vc animated:YES];
//            }
            if (indexPath.section == 9) {
                JoinActivityViewController *vc = [[JoinActivityViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
            if (indexPath.section == 10) {
                // 浏览历史
                BrowseViewController *vc = [[BrowseViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
            if (indexPath.section == 11) {
                SetUpViewController *vc = [[SetUpViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
            }
            
        }
    }
    
    
}
- (void)clickCell:(TypeTableViewCell *)cell {
    
        
        [cell getIndex:^(NSInteger index, NSInteger senction) {
            
            if ([GetUserDefault(isLogin) boolValue] == NO) {
                
                
                LoginViewController*vc = [[LoginViewController alloc] init];
                [self.navigationController pushViewController:vc animated:YES];
                
                return ;
            }
            
            if (senction == 1) {
                switch (index) {
                    case 0:
                    {
                        NSLog(@"0000");
                        OrderPageViewController *vc = [[OrderPageViewController alloc] init];
                        vc.selectIndex = 1;
                        [self.navigationController pushViewController:vc animated:YES];
                    }
                        break;
                    case 1:
                    {
                        NSLog(@"0001");
                        OrderPageViewController *vc = [[OrderPageViewController alloc] init];
                        vc.selectIndex = 2;
                        [self.navigationController pushViewController:vc animated:YES];
                    }
                        break;
                    case 2:
                    {
                        NSLog(@"0002");
                        OrderPageViewController *vc = [[OrderPageViewController alloc] init];
                        vc.selectIndex = 3;
                        [self.navigationController pushViewController:vc animated:YES];
                    }
                        break;
                    case 3:
                    {
                        NSLog(@"0003");
                        OrderPageViewController *vc = [[OrderPageViewController alloc] init];
                        vc.selectIndex = 4;
                        [self.navigationController pushViewController:vc animated:YES];
                    }
                        break;
                    default:
                        break;
                }
            }
            if (senction == 2) {
                switch (index) {
                    case 0:
                    {
                        NewFriendViewController *vc = [[NewFriendViewController alloc] init];
                        [self.navigationController pushViewController:vc animated:YES];
                        NSLog(@"2000");
                    }
                        break;
                    case 1:
                    {
                        MyRememberViewController *vc = [[MyRememberViewController alloc] init];
                        [self.navigationController pushViewController:vc animated:YES];
                        NSLog(@"2001");
                    }
                        break;
                    case 2:
                    {
                        MyInsertViewController *vc= [[MyInsertViewController alloc] init];
                        [self.navigationController pushViewController:vc animated:YES];
                        NSLog(@"2002");
                    }
                        break;
                    case 3:
                    {
                        DraftViewController *vc = [[DraftViewController alloc] init];
                        [self.navigationController pushViewController:vc animated:YES];
                        NSLog(@"2003");
                    }
                        break;
                    default:
                        break;
                }
            }
            
            
            
        }];

}

#pragma mark - 懒加载
- (UITableView *)tableView {
    if (!_tableView) {
        if (StatusHeight == 44) {
            _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-TabBarH-JCNew64-34) style:UITableViewStyleGrouped];
        }else {
            _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-TabBarH-JCNew64) style:UITableViewStyleGrouped];
        }
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
        [_tableView registerClass:[HeadTableViewCell class] forCellReuseIdentifier:@"HeadCell"];
        [_tableView registerClass:[TitleTableViewCell class] forCellReuseIdentifier:@"TitleCell"];
        [_tableView registerClass:[TypeTableViewCell class] forCellReuseIdentifier:@"TypeCell"];
        [_tableView registerClass:[MineTableViewCell class] forCellReuseIdentifier:@"MineCell"];
    }
    return _tableView;
}
@end
