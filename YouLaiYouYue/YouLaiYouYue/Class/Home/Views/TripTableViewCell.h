//
//  TripTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/19.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoActModel.h"
@interface TripTableViewCell : UITableViewCell

@property (strong , nonatomic) UILabel *titleLabel;

@property (strong , nonatomic) UILabel *contentLabel;

@property (strong , nonatomic) InfoActModel *model;

@end
