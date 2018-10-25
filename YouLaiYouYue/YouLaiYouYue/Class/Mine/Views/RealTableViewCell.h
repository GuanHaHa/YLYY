//
//  RealTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/14.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RealCellTextDelegate <NSObject>

- (void)changeTextView:(UITextField *)text withIndex:(NSInteger )index;

@end

@interface RealTableViewCell : UITableViewCell

@property (strong , nonatomic) UILabel *titleLabel;

@property (strong , nonatomic) UITextField *textField;

@property (strong , nonatomic) UIView *xian;

@property (assign , nonatomic) NSInteger index;

@property (weak , nonatomic) id<RealCellTextDelegate>delegate;

@end
