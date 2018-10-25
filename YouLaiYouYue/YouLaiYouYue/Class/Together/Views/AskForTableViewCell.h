//
//  AskForTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/30.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityModel.h"
@interface AskForTableViewCell : UITableViewCell
@property (strong , nonatomic) UILabel *titleLabel;  // 标题
@property (strong , nonatomic) UIImageView *bigImg;  // 大图
@property (strong , nonatomic) UILabel *startTime;  // 开始时间
@property (strong , nonatomic) UILabel *endTime;    // 结束时间
@property (strong , nonatomic) UILabel *costLabel;    // 费用
@property (strong , nonatomic) UILabel *numLabel;    // 人数
@property (strong , nonatomic) ActivityModel *model;

@end
