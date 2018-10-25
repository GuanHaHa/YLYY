//
//  CorrelationView.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/9/7.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "CorrelationView.h"
#import "CorrelationTableViewCell.h"

#define UI_navBar_Height 0

#define XHHTuanNumViewHight SCREEN_HEIGHT/2

@interface CorrelationView ()<UITableViewDelegate , UITableViewDataSource>
{
    UIView *_contentView;
}

@property (strong , nonatomic) UITableView *tableView;

@end

@implementation CorrelationView

- (id)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        
        [self setupContent];
        
        
        
        
    }
    
    return self;
}

- (void)setupContent {
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    //alpha 0.0  白色   alpha 1 ：黑色   alpha 0～1 ：遮罩颜色，逐渐
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disMissView)]];
    
    if (_contentView == nil) {
        
        CGFloat margin = 15;
        
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - XHHTuanNumViewHight, SCREEN_WIDTH, XHHTuanNumViewHight)];
        _contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_contentView];
        // 右上角关闭按钮
        UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        closeBtn.frame = CGRectMake(_contentView.bounds.size.width - 20 - 15, 10, 20, 20);
        [closeBtn setImage:[UIImage imageNamed:@"closs_pay"] forState:UIControlStateNormal];
        [closeBtn addTarget:self action:@selector(disMissView) forControlEvents:UIControlEventTouchUpInside];
        [_contentView addSubview:closeBtn];
        
        UILabel *titLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 80, 30)];
        titLabel.text = @"相关活动";
        titLabel.textAlignment = NSTextAlignmentLeft;
        [_contentView addSubview:titLabel];
        
        
        [_contentView addSubview:self.tableView];
        
    }
}

//展示从底部向上弹出的UIView（包含遮罩）
- (void)showInView:(UIView *)view {
    if (!view) {
        return;
    }
    
    [view addSubview:self];
    [view addSubview:_contentView];
    
    [_contentView setFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, XHHTuanNumViewHight)];
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.alpha = 1.0;
        
        [_contentView setFrame:CGRectMake(0, SCREEN_HEIGHT - XHHTuanNumViewHight - UI_navBar_Height, SCREEN_WIDTH, XHHTuanNumViewHight)];
        
    } completion:nil];
}

//移除从上向底部弹下去的UIView（包含遮罩）
- (void)disMissView {
    
    [_contentView setFrame:CGRectMake(0, SCREEN_HEIGHT - XHHTuanNumViewHight, SCREEN_WIDTH, XHHTuanNumViewHight)];
    [UIView animateWithDuration:0.3f
                     animations:^{
                         
                         self.alpha = 0.0;
                         
                         [_contentView setFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, XHHTuanNumViewHight)];
                     }
                     completion:^(BOOL finished){
                         
                         [self removeFromSuperview];
                         [_contentView removeFromSuperview];
                         
                     }];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//    return 10;
    return self.actArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CorrelationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CorrelationCell"];
    cell.model = self.actArray[indexPath.row];
    return cell;
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate didCellItem:indexPath.item];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 35, SCREEN_WIDTH, XHHTuanNumViewHight - 35) style:UITableViewStylePlain];
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
        [_tableView registerClass:[CorrelationTableViewCell class] forCellReuseIdentifier:@"CorrelationCell"];
    }
    return _tableView;
}

@end
