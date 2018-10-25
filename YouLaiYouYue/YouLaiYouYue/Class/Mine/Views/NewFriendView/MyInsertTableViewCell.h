//
//  MyInsertTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/31.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyInsertModel.h"
@interface MyInsertTableViewCell : UITableViewCell

@property (strong , nonatomic) UILabel *titleLabel;

@property (strong , nonatomic) UILabel *typeLabel;  // 待审核  已屏蔽啥的

@property (strong , nonatomic) UILabel *reasonLabel;  // 屏蔽之后 的 原因

@property (strong , nonatomic) UIImageView *img;

@property (strong , nonatomic) UILabel *locationLabel;

@property (strong , nonatomic) UILabel *activityLabel;

@property (strong , nonatomic) UILabel *timeLabel;

@property (strong , nonatomic) UIView *lineView;

@property (strong , nonatomic) UIButton *deleteBtn;

@property (strong , nonatomic) MyInsertModel *model;

@end
