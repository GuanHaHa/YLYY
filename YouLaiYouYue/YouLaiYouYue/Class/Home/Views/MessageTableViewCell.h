//
//  MessageTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/28.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageTableViewCell : UITableViewCell

@property (strong , nonatomic) UIImageView *img;

@property (strong , nonatomic) UILabel *titleLabel;

@property (strong , nonatomic) UILabel *contentLabel;

@property (strong , nonatomic) UILabel *timeLable;

@property (strong , nonatomic) UIImageView *redImg;

@property (assign , nonatomic) NSInteger index;

@property (copy , nonatomic) NSDictionary *dic;

@end
