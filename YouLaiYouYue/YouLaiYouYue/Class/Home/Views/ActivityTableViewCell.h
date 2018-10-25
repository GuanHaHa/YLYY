//
//  ActivityTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/17.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseLabel.h"
#import "PolyModel.h"
@interface ActivityTableViewCell : UITableViewCell

@property (strong , nonatomic) UIImageView *imgView;

@property (strong , nonatomic) UILabel *titleLabel;

@property (strong , nonatomic) BaseLabel *contentLabel;

@property (strong , nonatomic) UIImageView *headImg;

@property (strong , nonatomic) UILabel *nameLabel;

@property (strong , nonatomic) UIImageView *lvImg;

@property (strong , nonatomic) UILabel *lvLabel;

@property (strong , nonatomic) UIButton *activityBtn;

@property (strong , nonatomic) UILabel *timeLabel;

@property (strong , nonatomic) UILabel *timLable;

@property (strong , nonatomic) UIButton *commentsBtn; // 评论button

@property (strong , nonatomic) UIButton *lookBtn;

@property (strong , nonatomic) UIImageView *img;

@property (strong , nonatomic) PolyModel *model;

@end
