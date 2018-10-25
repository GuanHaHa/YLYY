//
//  DraftTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/2.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyRemModel.h"
@interface DraftTableViewCell : UITableViewCell

@property (strong , nonatomic) UILabel *titleLabel;

@property (strong , nonatomic) UIImageView *img;

@property (strong , nonatomic) UILabel *timeLabel;

@property (strong , nonatomic) MyRemModel *model;

@end
