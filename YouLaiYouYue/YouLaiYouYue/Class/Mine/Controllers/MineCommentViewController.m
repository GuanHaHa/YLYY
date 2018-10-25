//
//  MineCommentViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/9/5.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "MineCommentViewController.h"
#import "CommentTableViewCell.h"
#import "ReplyTableViewCell.h"

#import "CommentModel.h"
@interface MineCommentViewController ()<UITableViewDelegate , UITableViewDataSource>

@property (strong , nonatomic) UITableView *tableView;

@end

@implementation MineCommentViewController {
    NSMutableArray *commentArray;
    int page;
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
    page = 1;
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
    [self setNavigationBarTitle:@"我的评论" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}


- (void)setUpUI {
    [self.view addSubview:self.tableView];
    
}


- (void)setUIAutoLayout {
    
}
- (void)getDataFromUrl {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/article_comment_list",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"userID"  : GetUserDefault(userID),
                          @"page"      : [NSString stringWithFormat:@"%d",page],
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            
            if (page == 1) {
                [commentArray removeAllObjects];
            }
            [commentArray addObjectsFromArray:[weakSelf commentDataArray:resultObject[@"obj"]]];
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
        cell.replyBtn.hidden = YES;
    
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
    
}

// 定义编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

// 进入编辑模式，按下出现的编辑按钮后,进行删除操作
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        CommentModel *model = commentArray[indexPath.section];
        [commentArray removeObjectAtIndex:indexPath.section];
        [self.tableView reloadData];
        [self cancelCollect:model.fcID];
    }
}
// 修改编辑按钮文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}

#pragma mark - 删除浏览历史
- (void)cancelCollect:(NSString *)index {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/CommentaryDeleting",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"id"  : index
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}


#pragma mark - 刷新  加载
- (void)headerRereshingData {
    page = 1;
    [self getDataFromUrl];
    [self.tableView.mj_header endRefreshing];
}

- (void)footerRereshingData {
    page++;
    [self getDataFromUrl];
    [self.tableView.mj_footer endRefreshing];
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
        
        [self setRefreshing:_tableView setTarget:self setHeaderAction:@selector(headerRereshingData) setFooterAction:@selector(footerRereshingData)];
    }
    return _tableView;
}





@end
