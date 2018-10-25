//
//  FriendTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/20.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonView.h"
#import "ActivitlModel.h"
#import "BaseLabel.h"
@interface FriendTableViewCell : UITableViewCell


@property (strong , nonatomic) UILabel *titleLabel;
@property (strong , nonatomic) UIImageView *imgView;
@property (strong , nonatomic) UIView *bgView;

@property (strong , nonatomic) BaseLabel *contentLabel;
@property (strong , nonatomic) UIImageView *headImg;
@property (strong , nonatomic) UIImageView *leadImg;
@property (strong , nonatomic) UILabel *leadLabel;
@property (strong , nonatomic) UILabel *numLabel;
@property (strong , nonatomic) PersonView *personView;
@property (strong , nonatomic) UILabel *timeLabel;

@property (strong , nonatomic) ActivitlModel *model;

@end
