//
//  ProductionViewController.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/17.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "ProductionViewController.h"
#import "RemDetailsViewController.h"

#import "ProductionTableViewCell.h"
@interface ProductionViewController ()<UITableViewDelegate , UITableViewDataSource>


@end

@implementation ProductionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.fd_prefersNavigationBarHidden = YES;
    
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
    self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-JCNew64-44-44);
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[ProductionTableViewCell class] forCellReuseIdentifier:@"ProductionCell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}


- (void)setUIAutoLayout {
    
}

- (void)getDataFromUrl {
    
}

- (void)setProductionArray:(NSMutableArray *)productionArray {
    _productionArray = productionArray;
    
    [self.tableView reloadData];
}

#pragma  mark - UITableViewDelegate ,UITableViewDataSource
- (NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (_productionArray.count == 0) {
        return 1;
    }
    return _productionArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath  {
    if (_productionArray.count == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        cell.backgroundColor = [UIColor blackColor];
        UILabel *label = [[UILabel alloc] initForAutoLayout];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:18];
        label.text = @"暂无相关信息";
        [cell.contentView addSubview:label];
        [label autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
        return cell;
    }
    ProductionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProductionCell"];
    cell.model = _productionArray[indexPath.section];
    return cell;
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 280;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.01;
}
- (CGFloat )tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    RemDetailsViewController *vc = [[RemDetailsViewController alloc] init];
    ProductionModel *model = _productionArray[indexPath.section];
    vc.articleId = model.fmID;
    [self.navigationController pushViewController:vc animated:YES];
}



@end