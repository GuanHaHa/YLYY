//
//  EvaluateTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/20.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EvaluateModel.h"
@interface EvaluateTableViewCell : UITableViewCell

@property (strong , nonatomic) UIImageView *img;

@property (strong , nonatomic) UILabel *titleLabel;

@property (strong , nonatomic) UILabel *timeLabel;

@property (strong , nonatomic) UILabel *label;

@property (strong , nonatomic) EvaluateModel *model;

@end
