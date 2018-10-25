//
//  CommentTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/16.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"
@interface CommentTableViewCell : UITableViewCell

@property (strong , nonatomic) UIImageView *headImg;

@property (strong , nonatomic) UILabel *nameLabel;

@property (strong , nonatomic) UILabel *titleLabel;

@property (strong , nonatomic) UILabel *contentLabel;

@property (strong , nonatomic) UILabel *timeLabel;

@property (strong , nonatomic) UIButton *replyBtn;

@property (strong , nonatomic) CommentModel *model;

@end
