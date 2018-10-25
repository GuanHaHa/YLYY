//
//  CorrelationTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/9/7.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityInfoModel.h"
#import "BaseLabel.h"
@interface CorrelationTableViewCell : UITableViewCell

@property (strong , nonatomic) UILabel *titleLabel;  // 标题
@property (strong , nonatomic) UIImageView *bigImg;  // 大图
@property (strong , nonatomic) BaseLabel *contentLabel;
@property (strong , nonatomic) UILabel *timeLabel;

@property (strong , nonatomic) UIImageView *lookImg; // 浏览图片
@property (strong , nonatomic) UILabel *lookLabel;
@property (strong , nonatomic) UIImageView *attentionImg;   // 关注
@property (strong , nonatomic) UILabel *attentionLabel;


@property (strong , nonatomic) ActivityInfoModel *model;

@end
