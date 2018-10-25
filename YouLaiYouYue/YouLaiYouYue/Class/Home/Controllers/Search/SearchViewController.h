//
//  SearchViewController.h
//  YouLaiYouYue
//
//  Created by 张强 on 2018/7/17.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "BaseViewController.h"

@interface SearchViewController : BaseViewController

/** 搜索栏 */
@property (nonatomic, weak) UISearchBar *searchBar;

@property (nonatomic, strong) NSMutableArray *tagsArray;

// 1为友聚  2为友记
@property (nonatomic , copy) NSString *type;

@end
