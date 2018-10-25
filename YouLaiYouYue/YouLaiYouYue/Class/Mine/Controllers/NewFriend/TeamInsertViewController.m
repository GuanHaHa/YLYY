//
//  TeamInsertViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/1.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "TeamInsertViewController.h"


#import "TeamInsertTableViewCell.h"

#import "InsertModel.h"

@interface TeamInsertViewController ()<UITableViewDelegate , UITableViewDataSource>

@property (strong , nonatomic) UITableView *tableView;

@end

@implementation TeamInsertViewController {
    NSMutableArray *insertArray;
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
    insertArray = [NSMutableArray array];
    [self getDataFromUrl];
}

#pragma mark - Setting UI Methods

- (void)setUI {
    
    [self setNavigationBar];
    [self setUpUI];
    [self setUIAutoLayout];
}



- (void)setNavigationBar {
    [self setNavigationBarTitle:@"队友插文" textColor:UIColorFromRGB(0xffffff) titleFontSize:nil];
}


- (void)setUpUI {
    [self.view addSubview:self.tableView];
}


- (void)setUIAutoLayout {
    
}

- (void)getDataFromUrl {
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/IntercalationList",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"formId"     : self.articleId,
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            //            if (page == 1) {
            //                [remArray removeAllObjects];
            //            }
            //            [remArray addObjectsFromArray:[weakSelf startDataArray:resultObject[@"obj"]]];
            
            insertArray =  [weakSelf insertDataArray:resultObject[@"obj"]];
            [weakSelf.tableView reloadData];
        }
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

- (NSMutableArray *)insertDataArray:(NSMutableArray *)param {
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary *dic in param) {
        InsertModel *mode= [InsertModel arrayWithDic:dic];
        [array addObject:mode];
    }
    return array;
}

#pragma  mark - UITableViewDelegate ,UITableViewDataSource
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return insertArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    TeamInsertTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TeamInsertCell"];
    cell.model = insertArray[indexPath.section];
    cell.allowBtn.tag = 100+indexPath.section;
    [cell.allowBtn addTarget:self action:@selector(allowAction:) forControlEvents:(UIControlEventTouchUpInside)];
    cell.shieldingBtn.tag = 110+indexPath.section;
    [cell.shieldingBtn addTarget:self action:@selector(shieldingAction:) forControlEvents:(UIControlEventTouchUpInside)];
    return cell;
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 246;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.1;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
}

#pragma mark - 允许展示    屏蔽
// 允许展示
- (void)allowAction:(UIButton *)button {
    NSInteger indexSection = button.tag - 100;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否允许展示" preferredStyle:UIAlertControllerStyleAlert];
    
    //可以给alertview中添加一个输入框
    
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了按钮1，进入按钮1的事件");
        
        // 允许展示
        [self allowFromUrlIndex:indexSection withType:@"0"];
        
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了取消");
    }];
    
    [alert addAction:action1];
    [alert addAction:action2];
    
    [self presentViewController:alert animated:YES completion:nil];

    
    
    
    
    

}
// 屏蔽
- (void)shieldingAction:(UIButton *)button {
    NSInteger indexSection = button.tag - 100;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"屏蔽原因" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //得到文本信息
        
        NSString *str = alert.textFields.lastObject.text;
        NSLog(@"%@",alert.textFields.lastObject.text);
        if (str == nil || [str isEqualToString:@""]) {
            return ;
        }
        [self shieldingFromUrlIndex:indexSection withReasonText:str];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"请输入屏蔽原因";
    }];
    [alert addAction:cancelAction];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

// 允许展示接口
- (void)allowFromUrlIndex:(NSInteger )index withType:(NSString *)type {
    InsertModel *model = insertArray[index];
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/Exhibition",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"id"      : model.ffpID,
                          @"type"    : type
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            model.radio = @"允许展示";
            [weakSelf.tableView reloadData];
        }
        
    } swpResultError:^(id  _Nonnull resultObject, NSString * _Nonnull errorMessage) {
        
    }];
}

// 屏蔽接口
- (void)shieldingFromUrlIndex:(NSInteger )index withReasonText:(NSString *)reasonText {
    InsertModel *model = insertArray[index];
    NSString *url = [NSString stringWithFormat:@"%@index.php/action/ac_article/ShieldedArticles",baseUrl];
    NSString *md5Url = [self MD5ForLower32Bate:url];
    NSDictionary *dic = @{
                          @"app_key" : md5Url,
                          @"id"      : model.ffpID,
                          @"content" : reasonText,
                          @"uid"     : GetUserDefault(userID)
                          };
    __weak typeof(self)weakSelf = self;
    [self swpPublicTooGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(id  _Nonnull resultObject) {
        if ([resultObject[@"code"] integerValue] == 200) {
            model.radio = @"已屏蔽";
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
        [_tableView registerClass:[TeamInsertTableViewCell class] forCellReuseIdentifier:@"TeamInsertCell"];
    }
    return _tableView;
}
@end
