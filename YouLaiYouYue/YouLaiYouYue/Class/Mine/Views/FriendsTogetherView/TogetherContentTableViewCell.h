//
//  TogetherContentTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/2.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TogetherModel.h"
@protocol TogetherContentCellDelegate <NSObject>

- (void)TogetherChangeTextView:(NSString *)text;

@end

@interface TogetherContentTableViewCell : UITableViewCell

@property (strong , nonatomic) UILabel *titleLabel;

@property (strong , nonatomic) UITextView *textView;

@property (strong , nonatomic) TogetherModel *model;

@property (weak , nonatomic) id <TogetherContentCellDelegate>delegate;


@end
