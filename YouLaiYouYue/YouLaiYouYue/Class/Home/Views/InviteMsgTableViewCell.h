//
//  InviteMsgTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/29.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InviteMsgModel.h"
@interface InviteMsgTableViewCell : UITableViewCell

@property (strong , nonatomic) UIView *bgView;

@property (strong , nonatomic) UILabel *titleLabel;

@property (strong , nonatomic) UIImageView *bigImg;

@property (strong , nonatomic) UIView *xian;

@property (strong , nonatomic) UILabel *contentLabel;

@property (strong , nonatomic) UIButton *cancelBtn;

@property (strong , nonatomic) UIButton *takeinBtn;

@property (strong , nonatomic) InviteMsgModel *model;


@end
