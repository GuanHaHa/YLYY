//
//  AnonymityTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/10/11.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityModel.h"
@interface AnonymityTableViewCell : UITableViewCell

@property (strong , nonatomic) UIView *bgView;

@property (strong , nonatomic) UITextField *textField;

@property (strong , nonatomic) UILabel *titleLabel;

@property (strong , nonatomic) ActivityModel *model;

@end
