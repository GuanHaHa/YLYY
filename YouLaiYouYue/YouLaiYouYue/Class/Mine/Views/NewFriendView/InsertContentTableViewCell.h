//
//  InsertContentTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/31.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InsertContentCellDelegate <NSObject>

- (void)changeInsertTextView:(NSString *)text;

@end

@interface InsertContentTableViewCell : UITableViewCell

@property (strong , nonatomic) UILabel *titleLabel;

@property (strong , nonatomic) UITextView *textView;

@property (copy , nonatomic) NSString *content;

@property (weak , nonatomic) id <InsertContentCellDelegate>delegate;

@end
