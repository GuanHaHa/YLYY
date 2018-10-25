//
//  RemDetailsTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/23.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContentModel.h"
@interface RemDetailsTableViewCell : UITableViewCell

@property (strong , nonatomic) UIView *xian;

@property (strong , nonatomic) UIImageView *bigImg;

@property (strong , nonatomic) UILabel *titleLabel;

@property (strong , nonatomic) UIImageView *headImg;

@property (strong , nonatomic) UIImageView *lookImg;

@property (strong , nonatomic) UILabel *lookLabel;

@property (strong , nonatomic) UIImageView *concernImg;

@property (strong , nonatomic) UILabel *concernLabel;

@property (strong , nonatomic) UILabel *nameLabel;

@property (strong , nonatomic) UIImageView *lvImg;

@property (strong , nonatomic) UILabel *lvLabel;

@property (strong , nonatomic) UIButton *zanBtn;

//@property (strong , nonatomic) UIImageView *img1;
//@property (strong , nonatomic) UIImageView *img2;
//@property (strong , nonatomic) UIImageView *img3;
//@property (strong , nonatomic) UIImageView *img4;
//
//@property (strong , nonatomic) UILabel *label1;
//@property (strong , nonatomic) UILabel *label2;
//@property (strong , nonatomic) UILabel *label3;
//@property (strong , nonatomic) UILabel *label4;

@property (strong , nonatomic) ContentModel *model;


@end
