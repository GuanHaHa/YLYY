//
//  EditOtherTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/9/5.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewModel.h"

@protocol EditOtherCellCityDelegate <NSObject>

- (void)cityTextView:(NSString *)text;

@end

@interface EditOtherTableViewCell : UITableViewCell

@property (strong , nonatomic) UITextField *textField;

@property (strong , nonatomic) UIImageView *img;

@property (strong , nonatomic) UILabel *titleLabel;

@property (assign , nonatomic) NSInteger indexSection;

@property (strong , nonatomic) NewModel *model;

@property (weak , nonatomic) id<EditOtherCellCityDelegate>delegate;

@end
