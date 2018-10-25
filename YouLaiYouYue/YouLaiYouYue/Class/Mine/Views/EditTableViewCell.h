//
//  EditTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/25.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonModel.h"
@interface EditTableViewCell : UITableViewCell

@property (strong , nonatomic) UITextField *textField;

@property (strong , nonatomic) UIImageView *img;

@property (strong , nonatomic) UILabel *titleLabel;


@property (copy , nonatomic) NSString *picName;
@property (copy , nonatomic) NSString *title;

@property (strong , nonatomic) PersonModel *model;

@property (assign , nonatomic) NSInteger indexSection;

@end
