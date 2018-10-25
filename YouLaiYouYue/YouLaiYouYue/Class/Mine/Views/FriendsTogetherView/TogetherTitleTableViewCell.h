//
//  TogetherTitleTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/2.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TogetherModel.h"

@protocol TogetherTitleCellDelegate <NSObject>

- (void)togetherTitleTextView:(NSString *)text;

@end

@interface TogetherTitleTableViewCell : UITableViewCell

@property (strong , nonatomic) UIImageView *img;

@property (strong , nonatomic) UITextField *textField;

@property (strong , nonatomic) TogetherModel *model;

@property (weak , nonatomic) id<TogetherTitleCellDelegate>delegate;

@end
