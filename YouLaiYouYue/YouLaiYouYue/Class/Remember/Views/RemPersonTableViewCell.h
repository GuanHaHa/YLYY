//
//  RemPersonTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/9/27.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RenewModel.h"
@interface RemPersonTableViewCell : UITableViewCell

@property (strong , nonatomic) UILabel *titleLabel;

@property (strong , nonatomic) UIImageView *headImg;

@property (strong , nonatomic) UILabel *nameLabel;

@property (strong , nonatomic) UILabel *timeLabel;

@property (strong , nonatomic) UIButton *zanBtn;

@property (strong , nonatomic) UILabel *contentLabel;

@property (strong , nonatomic) RenewModel *model;

@end
