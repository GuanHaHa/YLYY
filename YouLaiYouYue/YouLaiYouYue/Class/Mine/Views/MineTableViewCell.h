//
//  MineTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/24.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineTableViewCell : UITableViewCell

@property (copy , nonatomic) NSString *picName;
@property (copy , nonatomic) NSString *title;

@property (strong , nonatomic) UIImageView *img;

@property (strong , nonatomic) UILabel *titleLabel;

@end
