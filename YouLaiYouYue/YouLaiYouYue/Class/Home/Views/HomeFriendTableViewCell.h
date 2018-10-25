//
//  HomeFriendTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/9/12.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseLabel.h"
#import "FriendMsgModel.h"
@interface HomeFriendTableViewCell : UITableViewCell
@property (strong , nonatomic) UIImageView *headImg;
@property (strong , nonatomic) UILabel *titleLabel;
@property (strong , nonatomic) BaseLabel *contentLabel;
@property (strong , nonatomic) UIButton *takeinBtn;
@property (strong , nonatomic) UIButton *cancelBtn;
@property (strong , nonatomic) FriendMsgModel *model;
@end
