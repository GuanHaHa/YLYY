//
//  TogetherOtherTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/2.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TogetherModel.h"
@interface TogetherOtherTableViewCell : UITableViewCell

@property (strong , nonatomic) UITextField *textField;

@property (strong , nonatomic) UIImageView *img;

@property (strong , nonatomic) UILabel *titleLabel;

@property (assign , nonatomic) NSInteger indexSection;

@property (strong , nonatomic) TogetherModel *model;

@end
