//
//  TeamInsertTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/1.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InsertModel.h"
@interface TeamInsertTableViewCell : UITableViewCell

@property (strong , nonatomic) UILabel *titleLabel;

@property (strong , nonatomic) UIImageView *img;

@property (strong , nonatomic) UILabel *typeLabel;  // 待审核  已屏蔽啥的

@property (strong , nonatomic) UIImageView *headImg;

@property (strong , nonatomic) UILabel *nameLabel;

@property (strong , nonatomic) UILabel *timeLabel;

@property (strong , nonatomic) UIButton *allowBtn;  // 允许展示

@property (strong , nonatomic) UIButton *shieldingBtn; // 屏蔽

@property (strong , nonatomic) InsertModel *model;

@end
