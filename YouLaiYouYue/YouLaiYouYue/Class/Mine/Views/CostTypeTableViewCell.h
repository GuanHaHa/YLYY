//
//  CostTypeTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/29.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CostTypeTableViewCell : UITableViewCell

@property (strong , nonatomic) UILabel *titleLabel;
@property (strong , nonatomic) UIImageView *chooseImg;
- (void)setIsSelectImg:(BOOL)select;

@end
