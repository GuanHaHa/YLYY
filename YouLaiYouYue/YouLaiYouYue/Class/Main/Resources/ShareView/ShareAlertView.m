
//
//  ShareAlertView.m
//  YzFunny
//
//  Created by wang yu on 2016/12/23.
//  Copyright © 2016年 0452e. All rights reserved.
//

#import "ShareAlertView.h"
#import "ShareAlertCollectionViewCell.h"
#import "ShareTableViewCell.h"


@interface ShareAlertView ()<UICollectionViewDelegate ,UICollectionViewDataSource,UIGestureRecognizerDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic) UIWindow *rootWindow;
@property (nonatomic) UIView *alertView;

@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *stateLabel;
@property (nonatomic ,copy) NSArray *itemArr;
@property (nonatomic ,copy) NSArray *collectItemArr;
@property (nonatomic ,strong) UITableView *tableView;

@end
@implementation ShareAlertView

- (instancetype)init
{
    if (self == [super init]) {
        self.collectItemArr = @[@[@"sharepengyouquan",@"shareweixin"], @[@"朋友圈",@"微信"]];
        self.frame =  [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        
        self.alertView = [[UIView alloc] init];
       
        [self addSubview:self.alertView];
        self.alertView.backgroundColor = [UIColor clearColor];
        self.alertView.frame = CGRectMake(0, SCREEN_HEIGHT-64 , SCREEN_WIDTH, 220);
        
        UITapGestureRecognizer* singleRecognizer =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeMenuView)];
        singleRecognizer.numberOfTapsRequired = 1; // 单击
        singleRecognizer.delegate = self;
        [self addGestureRecognizer:singleRecognizer];
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(15, 98 , SCREEN_WIDTH-30, 132) style:UITableViewStylePlain];
        self.tableView.estimatedRowHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
        if (@available(iOS 11.0, *)) {
            self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.layer.cornerRadius = 5;
        _tableView.bounces = NO;
        _tableView.separatorStyle = NO;
        [_tableView registerClass:[ShareTableViewCell class] forCellReuseIdentifier:@"ShareTableViewCell"];
        
        [self.alertView addSubview:_tableView];
        
        
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        flowLayout.itemSize = CGSizeMake((SCREEN_WIDTH-36)/[self.collectItemArr[0]count], 88);

        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(15, 0 , SCREEN_WIDTH-30, 88) collectionViewLayout:flowLayout];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.layer.cornerRadius = 5;
        collectionView.backgroundColor = [UIColor whiteColor];
        collectionView.showsVerticalScrollIndicator = NO;
        [self.alertView addSubview:collectionView];
//        tableView.tableHeaderView = collectionView;
        
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        [collectionView registerClass:[ShareAlertCollectionViewCell class] forCellWithReuseIdentifier:@"searchCellID"];
        
    }
    return self;
    
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([touch.view isDescendantOfView:self.alertView]) {
        return NO;
    }
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShareTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShareTableViewCell"];
    cell.selectionStyle =  UITableViewCellSelectionStyleNone;
    if (_isCollect == YES) {
        if (indexPath.row == 0) {
            cell.itemLabel.textColor = [UIColor redColor];
        }
    }
     cell.itemLabel.text = self.itemArr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self closeMenuView];
    if (self.itemArr.count == 0) {
        return;
    }
    if (indexPath.row == 0) {
      
        [self.delegate collectionViewDid:indexPath.row + [self.itemArr count]];
    }else  if (indexPath.row == 1) {
        [LCProgressHUD showSuccess:@"举报成功"];
        
    }
        
    
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return [self.collectItemArr[0] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    ShareAlertCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"searchCellID" forIndexPath:indexPath];

   
    cell.nameLabel.text = self.collectItemArr[1][indexPath.item];
    cell.picImage.image = [UIImage imageNamed:self.collectItemArr[0][indexPath.item]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self closeMenuView];
    [self.delegate collectionViewDid:indexPath.item];
}

- (void)perImageAction
{
    
}


- (void)closeMenuView
{
    
    
    [UIView animateWithDuration:0.3 animations:^{
        self.alertView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, self.itemArr.count * 44 + 98);
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}



- (void)showMenuView{
    self.rootWindow = [UIApplication sharedApplication].keyWindow;
    [self.rootWindow addSubview:self];
    ///创建动画
    [self creatShowAnimation];
}

- (void)creatShowAnimation{

    if (_isCollect == YES) {
        self.itemArr = @[@"取消收藏",@"举报",@"取消"];
    }else{
        if (_isShare) {
           self.itemArr = @[@"取消"];
            _tableView.frame = CGRectMake(15, 98 , SCREEN_WIDTH-30, 44);
        } else {
            self.itemArr = @[@"收藏",@"举报",@"取消"];
        }
        
    }
    
    [UIView animateWithDuration:0.4 animations:^{
        self.alertView.layer.position = CGPointMake(self.center.x, self.center.y);
        NSLog(@"%lu", self.itemArr.count * 44 + 98);
        self.alertView.frame = CGRectMake(0, SCREEN_HEIGHT-108 - self.itemArr.count * 44, SCREEN_WIDTH, self.itemArr.count * 44 + 98);
    }];
}



@end
