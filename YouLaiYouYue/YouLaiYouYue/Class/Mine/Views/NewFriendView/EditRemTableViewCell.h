//
//  EditRemTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/27.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyRemModel.h"
@interface EditRemTableViewCell : UITableViewCell

@property (strong , nonatomic) UILabel *titleLabel;  // 标题
@property (strong , nonatomic) UIImageView *bigImg;  // 大图
@property (strong , nonatomic) UILabel *startTime;  // 开始时间
@property (strong , nonatomic) UILabel *endTime;    // 结束时间
@property (strong , nonatomic) UILabel *costLabel;    // 费用
@property (strong , nonatomic) UILabel *numLabel;    // 人数

@property (strong , nonatomic) UIImageView *lookImg; // 浏览图片
@property (strong , nonatomic) UILabel *lookLabel;
@property (strong , nonatomic) UIImageView *attentionImg;   // 关注
@property (strong , nonatomic) UILabel *attentionLabel;

@property (strong , nonatomic) MyRemModel *model;

@end
