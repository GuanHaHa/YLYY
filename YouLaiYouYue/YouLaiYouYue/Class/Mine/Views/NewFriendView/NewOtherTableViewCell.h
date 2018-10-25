//
//  NewOtherTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/30.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewModel.h"

@protocol NewCellCityDelegate <NSObject>

- (void)cityTextView:(NSString *)text;

@end

@interface NewOtherTableViewCell : UITableViewCell

@property (strong , nonatomic) UITextField *textField;

@property (strong , nonatomic) UIImageView *img;

@property (strong , nonatomic) UILabel *titleLabel;

@property (assign , nonatomic) NSIndexPath *index;

@property (strong , nonatomic) NewModel *model;

@property (weak , nonatomic) id<NewCellCityDelegate>delegate;

@end
