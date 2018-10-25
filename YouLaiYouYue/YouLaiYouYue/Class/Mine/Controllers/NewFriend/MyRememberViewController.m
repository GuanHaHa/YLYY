//
//  MyRememberViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/31.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "MyRememberViewController.h"
#import "TeamInsertViewController.h"
#import "EditRemViewController.h"

#import "MyRememberTableViewCell.h"
#import "StartFunctionTableViewCell.h"

#import "MyRemModel.h"

@interface MyRememberViewController ()<UITableViewDelegate , UITableViewDataSource , StartFunctionCellDelegate>

@property (strong , nonatomic) UITableView *tableView;

@end

@implementation MyRememberViewController {
    NSMutableArray *remArray;
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

    remArray = [NSMutableArray array];
    [self getDataFromUrl];
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:@"我的友记" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}


- (void)setUpUI {
    [self.view addSubview:self.tableView];
}


- (void)setUIAutoLayout {
    
}

- (void)getDataFromUrl {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/Listofarticles",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"uid"     : GetUserDefault(userID),
//                          @"page"    : [NSString stringWithFormat:@"%d",page]
                          @"type"    : @"0"
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
//            if (page == 1) {
//                [remArray removeAllObjects];
//            }
//            [remArray addObjectsFromArray:[weakSelf startDataArray:resultObject[@"obj"]]];
            
            remArray =  [weakSelf remDataArray:resultObject[@"obj"]];
            [weakSelf.tableView reloadData];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

- (NSMutableArray *)remDataArray:(NSMutableArray *)param {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in param) {
        MyRemModel *model = [MyRemModel arrayWithDic:dic];
        [array addObject:model];
    }
    return array;
}

#pragma  mark - UITableViewDelegate ,UITableViewDataSource
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 2;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return remArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    if (indexPath.row == 0) {
        
        MyRememberTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyRememberCell"];
        cell.model = remArray[indexPath.section];
        return cell;
    }else {
        StartFunctionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StartFunctionCell"];
        cell.type = @"2";
        cell.indexSention = indexPath.section;
        cell.delegate = self;
        
        return cell;
    }
    
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 180;
    }
    return 55;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.1;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
}

// 点击 编辑  进入聊天室  取消活动
- (void)selectStartFunctionCell:(NSInteger)index with:(NSInteger)Section{
    if (index == 0) {
        EditRemViewController *vc= [[EditRemViewController alloc] init];
        MyRemModel *model = remArray[Section];
        vc.activityId = model.fmID;
        [self.navigationController pushViewController:vc animated:YES];
        NSLog(@"%ld  %ld",(long)index,(long)Section);
    }
    if (index == 1) {
        
        TeamInsertViewController *vc = [[TeamInsertViewController alloc] init];
        MyRemModel *model = remArray[Section];
        vc.articleId = model.fmID;
        [self.navigationController pushViewController:vc animated:YES];
        NSLog(@"%ld  %ld",(long)index,(long)Section);
        
    }
    if (index == 2) {
        NSLog(@"%ld  %ld",(long)index,(long)Section);
        [self deleteArticle:Section];
    }
}

// 删除
- (void)deleteArticle:(NSInteger )section {
    MyRemModel *model = remArray[section];
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/delArticles",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"id"      : model.fmID
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            [remArray removeObjectAtIndex:section];
            [weakSelf.tableView reloadData];
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
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [_tableView registerClass:[MyRememberTableViewCell class] forCellReuseIdentifier:@"MyRememberCell"];
        [_tableView registerClass:[StartFunctionTableViewCell class] forCellReuseIdentifier:@"StartFunctionCell"];
    }
    return _tableView;
}
@end
