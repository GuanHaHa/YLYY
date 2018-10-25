//
//  SignUpTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/13.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivityModel.h"


@protocol SignUpCellTextDelegate <NSObject>

- (void)changeTextView:(NSString *)text;

@end

@interface SignUpTableViewCell : UITableViewCell

@property (strong , nonatomic) UITextField *textField;

@property (strong , nonatomic) UILabel *titleLabel;

@property (assign , nonatomic) NSIndexPath *index;

@property (copy , nonatomic) NSString *type;

@property (strong , nonatomic) ActivityModel *model;

@property (weak , nonatomic) id <SignUpCellTextDelegate>delegate;

@end
