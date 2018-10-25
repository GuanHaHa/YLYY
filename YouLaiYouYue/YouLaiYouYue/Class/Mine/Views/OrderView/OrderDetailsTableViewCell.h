//
//  OrderDetailsTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/20.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderDetailsModel.h"
@interface OrderDetailsTableViewCell : UITableViewCell
@property (strong , nonatomic) UILabel *titleLabel;

@property (strong , nonatomic) UILabel *type;

@property (strong , nonatomic) UIView *bgView;

@property (strong , nonatomic) UIImageView *img;

@property (strong , nonatomic) UILabel *titLabel;

@property (strong , nonatomic) UILabel *timeLabel;

@property (strong , nonatomic) UILabel *peopleNum;

@property (strong , nonatomic) UILabel *costType;

@property (strong , nonatomic) UILabel *allCost;

@property (strong , nonatomic) OrderDetailsModel *model;
@end
