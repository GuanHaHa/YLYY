//
//  NewContentTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/27.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NewContentCellDelegate <NSObject>

- (void)changeTextView:(NSString *)text;

@end

@interface NewContentTableViewCell : UITableViewCell

@property (strong , nonatomic) UILabel *titleLabel;

@property (strong , nonatomic) UITextView *textView;

@property (weak , nonatomic) id <NewContentCellDelegate>delegate;

@end
