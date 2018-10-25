//
//  NewTitleTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/27.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewModel.h"

@protocol NewTitleCellDelegate <NSObject>

- (void)titleTextView:(NSString *)text;

@end

@interface NewTitleTableViewCell : UITableViewCell

@property (strong , nonatomic) UIImageView *img;

@property (strong , nonatomic) UITextField *textField;

@property (strong , nonatomic) NewModel *model;

@property (strong , nonatomic) id<NewTitleCellDelegate>delegate;

@end
