//
//  PageTabViewController.h
//  AiJiaoYu
//
//  Created by mac on 2018/7/12.
//  Copyright © 2018年 liujingtao. All rights reserved.
//

#import "BaseViewController.h"

@interface PageTabViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) BOOL vcCanScroll;
@property (nonatomic,strong) UITableView *tableView;

@end
