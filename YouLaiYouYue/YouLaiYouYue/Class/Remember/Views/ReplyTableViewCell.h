//
//  ReplyTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/16.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReplyTableViewCell : UITableViewCell

@property (strong , nonatomic) UIView *bgView;

@property (strong , nonatomic) UILabel *contnetLabel;

@property (copy , nonatomic) NSDictionary *dic;

@end
