//
//  AttributeTouchLabel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/10/17.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AttributeTouchLabel : UIView

@property (strong , nonatomic) UITextView *textView;

@property (copy , nonatomic) NSString *content;

@property (nonatomic, copy) void (^eventBlock)(NSAttributedString *showText);

@end
