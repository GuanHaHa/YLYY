//
//  MLSearchResultsTableViewController.m
//  Medicine
//
//  Created by Visoport on 3/1/17.
//  Copyright © 2017年 Visoport. All rights reserved.
//

#import "MLSearchResultsTableViewController.h"
#import "PartyViewController.h"
#import "RemDetailsViewController.h"
#import "SearchTableViewCell.h"
#import<CommonCrypto/CommonDigest.h>
#import "SearchModel.h"
@interface MLSearchResultsTableViewController ()

@property (nonatomic ,strong) NSMutableArray *dataArr;

@end

@implementation MLSearchResultsTableViewController {
    NSString *textContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.fd_prefersNavigationBarHidden = YES;
    
    self.dataArr = [NSMutableArray array];
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self.tableView registerClass:[SearchTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    //获取通知中心单例对象
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    //添加当前类对象为一个观察者，name和object设置为nil，表示接收一切通知
    [center addObserver:self selector:@selector(handleColorChange:) name:@"searchBarDidChange" object:nil];
}

-(void)handleColorChange:(NSNotification* )sender
{
    textContent = sender.userInfo[@"searchText"];
    NSString *type = sender.userInfo[@"type"];
    [self seachDataText:textContent withType:type];
    NSLog(@"%@", textContent);
}

- (void)seachDataText:(NSString *)text withType:(NSString *)type {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_activity/search_activity_list",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"activity_name" : text,
                          @"type"    : type
                          };
    __weak typeof(self)weakSelf = self;
    [SwpRequest swpPOST:url parameters:dic isEncrypt:NO swpResultSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            weakSelf.dataArr = [weakSelf searchDataArray:resultObject[@"obj"]];
            [weakSelf.tableView reloadData];
        }
    } swpResultError:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error, NSString * _Nonnull errorMessage) {
        
    }];
}

- (NSMutableArray *)searchDataArray:(NSMutableArray *)param {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in param) {
        SearchModel *model = [SearchModel arrayWithDic:dic];
        [array addObject:model];
    }
    return array;
}

-(NSString *)MD5ForLower32Bate:(NSString *)str{
    
    //要进行UTF8的转码
    const char* input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    
    return [self twoMD5ForLower32Bate:digest];
}


-(NSString *)twoMD5ForLower32Bate:(NSString *)str{
    
    //要进行UTF8的转码
    const char* input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    
    return digest;
}




#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    SearchModel *model = self.dataArr[indexPath.row];
    cell.title.text = model.title;
    return cell;
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.didSelectText(textContent);
    SearchModel *model = self.dataArr[indexPath.row];
    if ([model.type isEqualToString:@"1"]) {
        PartyViewController *vc = [[PartyViewController alloc] init];
        vc.activityId = model.searchId;
        [self.navigationController pushViewController:vc animated:YES];
    }else {
        RemDetailsViewController *vc = [[RemDetailsViewController alloc] init];
        vc.articleId = model.searchId;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.didSelectText(@"");
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
