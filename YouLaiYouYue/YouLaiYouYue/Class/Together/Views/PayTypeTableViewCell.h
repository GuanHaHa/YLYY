//
//  PayTypeTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/13.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayTypeTableViewCell : UITableViewCell

@property (strong , nonatomic) UIImageView *titleImage;
@property (strong , nonatomic) UILabel *titleLabel;
@property (strong , nonatomic) UIImageView *chooseImg;
- (void)setIsSelectImg:(BOOL)select;

@end
