//
//  InsertTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/31.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol InsertTitleCellDelegate <NSObject>

- (void)insertTitleTextView:(NSString *)text;

@end
@interface InsertTableViewCell : UITableViewCell

@property (strong , nonatomic) UITextField *textField;

@property (copy , nonatomic) NSString *title;

@property (weak , nonatomic) id<InsertTitleCellDelegate>delegate;

@end
