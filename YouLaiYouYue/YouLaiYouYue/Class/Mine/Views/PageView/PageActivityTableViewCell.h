//
//  PageActivityTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/17.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PageActivityModel.h"
@interface PageActivityTableViewCell : UITableViewCell
@property (strong , nonatomic) UIImageView *img;

@property (strong , nonatomic) UILabel *titleLabel;

@property (strong , nonatomic) UIButton *lookBtn;

@property (strong , nonatomic) UIButton *commentBtn;

@property (strong , nonatomic) UIButton *collectBtn;

@property (strong , nonatomic) PageActivityModel *model;

//@property (strong , nonatomic) UIButton *zanBtn;
@end
