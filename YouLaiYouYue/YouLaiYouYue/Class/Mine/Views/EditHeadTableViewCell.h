//
//  EditHeadTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/25.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonModel.h"
@interface EditHeadTableViewCell : UITableViewCell

@property (strong ,nonatomic) UIImageView *headImg;

@property (strong , nonatomic) UILabel *nameLabel;

//@property (strong , nonatomic) UIImageView *leaderImg;
//
//@property (strong , nonatomic) UIImageView *sexImg;

@property (strong , nonatomic) PersonModel *model;

@end
