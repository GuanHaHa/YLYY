//
//  OrderEvaluateTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/21.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol OrderEvaluateCellDelegate <NSObject>

- (void)orderEvaluateChangeTextView:(NSString *)text;

@end
@interface OrderEvaluateTableViewCell : UITableViewCell
@property (strong , nonatomic) UITextView *textView;
@property (weak , nonatomic) id<OrderEvaluateCellDelegate>delegate;
@end
