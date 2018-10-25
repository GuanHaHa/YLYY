//
//  OrderInfoTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/20.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderDetailsModel.h"
@interface OrderInfoTableViewCell : UITableViewCell

@property (strong , nonatomic) UILabel *orderNum;

@property (strong , nonatomic) UILabel *transactionNum;

@property (strong , nonatomic) UILabel *creationTime;

@property (strong , nonatomic) UILabel *payTime;

@property (strong , nonatomic) UILabel *bargainTime;

@property (strong , nonatomic) OrderDetailsModel *model;


@end
