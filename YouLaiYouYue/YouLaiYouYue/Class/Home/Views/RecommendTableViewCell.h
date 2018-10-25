//
//  RecommendTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/17.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecommendModel.h"
@interface RecommendTableViewCell : UITableViewCell

@property (strong , nonatomic) UILabel *titleLabel;

@property (strong , nonatomic) UILabel *hotLabel;

@property (strong , nonatomic) UILabel *contentLabel;

@property (strong , nonatomic) UIImageView *imgView;

@property (strong , nonatomic) UIImageView *headImg;

@property (strong , nonatomic) UILabel *nameLabel;

@property (strong , nonatomic) UIButton *commentsBtn; // 评论button

@property (strong , nonatomic) UIButton *lookBtn;

@property (strong , nonatomic) UILabel *timeLabel;   // 时间button

@property (strong , nonatomic) UIImageView *lvImg;

@property (strong , nonatomic) UILabel *lvLabel;

@property (strong , nonatomic) UIButton *zanBtn;

@property (strong , nonatomic) RecommendModel *model;

@end
