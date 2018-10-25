//
//  DetailsTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/18.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoView.h"
#import "ActivityModel.h"
@interface DetailsTableViewCell : UITableViewCell

@property (strong , nonatomic) UIImageView *bigImg;

@property (strong , nonatomic) UILabel *titleLabel;

@property (strong , nonatomic) UIImageView *headImg;

@property (strong , nonatomic) UILabel *nameLabel;

@property (strong , nonatomic) UIImageView *lookImg;

@property (strong , nonatomic) UILabel *lookLabel;

@property (strong , nonatomic) UIImageView *concernImg;

@property (strong , nonatomic) UILabel *concernLabel;

@property (strong , nonatomic) UIImageView *lvImg;

@property (strong , nonatomic) UILabel *lvLabel;

@property (strong , nonatomic) UIButton *zanBtn;

@property (strong , nonatomic) InfoView *infoView;

@property (strong , nonatomic) UIImageView *img;

@property (strong , nonatomic) ActivityModel *model;

@end
