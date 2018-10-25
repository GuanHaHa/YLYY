//
//  BrowseTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/26.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BrowseModel.h"
@interface BrowseTableViewCell : UITableViewCell

@property (strong , nonatomic) UIImageView *img;

@property (strong , nonatomic) UILabel *contenLabel;

@property (strong , nonatomic) UILabel *timeLable;

@property (strong , nonatomic) BrowseModel *model;


@end
