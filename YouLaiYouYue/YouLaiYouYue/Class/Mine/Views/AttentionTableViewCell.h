//
//  AttentionTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/26.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AttentionModel.h"
@interface AttentionTableViewCell : UITableViewCell

@property (strong , nonatomic) UIImageView *headImg;
@property (strong , nonatomic) UILabel *nameLabel;
@property (strong , nonatomic) UIImageView *sexImg;
@property (strong , nonatomic) UIImageView *articleImg; // 文章图片
@property (strong , nonatomic) UILabel *articleLabel;
@property (strong , nonatomic) UIImageView *fansImg;
@property (strong , nonatomic) UILabel *fansLabel;
@property (strong , nonatomic) UIImageView *stateImg;
@property (strong , nonatomic) UILabel *stateLabel;
@property (strong , nonatomic) UIButton *cancelBtn;
@property (strong , nonatomic) UIButton *otherBtn;

@property (strong , nonatomic) AttentionModel *model;


@end
