//
//  RequireView.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/3.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RequireDelegate <NSObject>

- (void)requireInformationMixAge:(NSString *)mixAge maxAge:(NSString *)maxAge withSex:(NSString *)sex withMarry:(NSString *)marry withOther:(NSString *)other;

- (void)hiddenRequireView;

@end;

@interface RequireView : UIView

@property (strong , nonatomic) UIView *view;

@property (strong , nonatomic) UILabel *titleLabel;  // 活动要求

@property (strong , nonatomic) UILabel *ageLabel;

@property (strong , nonatomic) UITextField *ageTextField1;

@property (strong , nonatomic) UILabel *label;

@property (strong , nonatomic) UITextField *ageTextField2;

@property (strong , nonatomic) UILabel *sexLabel;

@property (strong , nonatomic) UIButton *sexBtn1;

@property (strong , nonatomic) UIButton *sexBtn2;

@property (strong , nonatomic) UIButton *sexBtn3;

@property (strong , nonatomic) UIButton *sexBtn4;

@property (strong , nonatomic) UILabel *marryLabel;

@property (strong , nonatomic) UIButton *marryBtn1;

@property (strong , nonatomic) UIButton *marryBtn2;

@property (strong , nonatomic) UILabel *otherLabel;

@property (strong , nonatomic) UITextField *otherTextField;

@property (strong , nonatomic) UIButton *determineBtn;

@property (strong , nonatomic) UIButton *deleteBtn;

@property (weak , nonatomic) id<RequireDelegate>delegate;

@end
