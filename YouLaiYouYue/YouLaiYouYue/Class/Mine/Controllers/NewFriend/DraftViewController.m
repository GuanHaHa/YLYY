//
//  DraftViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/2.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "DraftViewController.h"
#import "EditRemViewController.h"
#import "DraftTableViewCell.h"

#import "MyRemModel.h"

@interface DraftViewController ()<UITableViewDelegate , UITableViewDataSource>

@property (strong , nonatomic) UITableView *tableView;

@end

@implementation DraftViewController {
    NSMutableArray *draftArray;
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
    draftArray = [NSMutableArray array];
    [self getDataFromUrl];
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:@"我的草稿" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
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
                          @"type"    : @"1"
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            //            if (page == 1) {
            //                [remArray removeAllObjects];
            //            }
            //            [remArray addObjectsFromArray:[weakSelf startDataArray:resultObject[@"obj"]]];
            
            draftArray =  [weakSelf remDataArray:resultObject[@"obj"]];
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
    
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return draftArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    DraftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DraftCell"];
    cell.model = draftArray[indexPath.section];
    return cell;
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 125;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.1;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    //添加一个删除按钮
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:(UITableViewRowActionStyleDestructive) title:@"删除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSLog(@"点击了删除");
        [self deleteIndex:indexPath.section];
       
    }];
    //删除按钮颜色
    deleteAction.backgroundColor = [UIColor redColor];
    //添加一个置顶按钮
    UITableViewRowAction *topRowAction =[UITableViewRowAction rowActionWithStyle:(UITableViewRowActionStyleDestructive) title:@"编辑" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSLog(@"点击了编辑");
        EditRemViewController *vc = [[EditRemViewController alloc] init];
        vc.type = @"1";
        MyRemModel *model = draftArray[indexPath.section];
        vc.activityId = model.fmID;
        [self.navigationController pushViewController:vc animated:YES];
        NSIndexPath *firstIndexPath =[NSIndexPath indexPathForRow:0 inSection:indexPath.section];
        [tableView moveRowAtIndexPath:indexPath toIndexPath:firstIndexPath];
    }];
    //置顶按钮颜色
    topRowAction.backgroundColor = [UIColor orangeColor];
    //--------更多
    UITableViewRowAction *moreRowAction = [UITableViewRowAction rowActionWithStyle:(UITableViewRowActionStyleNormal) title:@"发布" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {

        
        [self issueIndex:indexPath.section];
    }];
    //将设置好的按钮方到数组中返回
    return @[deleteAction,topRowAction,moreRowAction];
}

// 删除草稿
- (void)deleteIndex:(NSInteger )index {
    MyRemModel *model = draftArray[index];
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/delArticles",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"id"      : model.fmID
                          };
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            [draftArray removeObjectAtIndex:index];
            [LCProgressHUD showMessage:@"删除成功"];
            [self.tableView reloadData];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

// 发布草稿
- (void)issueIndex:(NSInteger )index {
    MyRemModel *model = draftArray[index];
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/draftRadio",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                        @"app_key" : md5Url,
                        @"id"      : model.fmID
                        };
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            [draftArray removeObjectAtIndex:index];
            [LCProgressHUD showMessage:@"发布成功"];
            [self.tableView reloadData];
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
        [_tableView registerClass:[DraftTableViewCell class] forCellReuseIdentifier:@"DraftCell"];
    }
    return _tableView;
}

@end
