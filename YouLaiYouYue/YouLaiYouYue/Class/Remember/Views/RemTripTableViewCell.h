//
//  RemTripTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/7.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RenewModel.h"
@interface RemTripTableViewCell : UITableViewCell

@property (strong , nonatomic) UILabel *titleLabel;

@property (strong , nonatomic) UILabel *contentLabel;

@property (strong , nonatomic) RenewModel *model;

@end
