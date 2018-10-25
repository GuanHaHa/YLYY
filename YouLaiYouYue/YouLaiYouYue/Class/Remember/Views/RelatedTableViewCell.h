//
//  RelatedTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/23.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityInfoModel.h"
@interface RelatedTableViewCell : UITableViewCell

@property (strong , nonatomic) UILabel *titleLabel;

@property (strong , nonatomic) UILabel *contentLabel;

@property (strong , nonatomic) UIImageView *img;

@property (strong , nonatomic) UIButton *commentsBtn; // 评论button

@property (strong , nonatomic) UIButton *lookBtn;

@property (strong , nonatomic) UILabel *timeLabel;   // 时间button

@property (strong , nonatomic) ActivityInfoModel *model;

@end
