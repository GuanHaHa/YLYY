//
//  BigImgTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/17.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BigImgTableViewCell : UITableViewCell

@property (strong , nonatomic) UIImageView *imgView;

@property (strong , nonatomic) UIView *bgView;
@property (strong , nonatomic) UILabel *titleLabel;

@property (strong , nonatomic) UIImageView *headImg;

@property (strong , nonatomic) UILabel *nameLabel;

@property (strong , nonatomic) UIButton *commentsBtn; // 评论button

@property (strong , nonatomic) UIButton *lookBtn;

@property (strong , nonatomic) UILabel *timeLabel;   // 时间button

@end
