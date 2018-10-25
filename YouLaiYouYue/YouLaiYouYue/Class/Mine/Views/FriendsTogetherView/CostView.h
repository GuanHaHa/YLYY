//
//  CostView.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/2.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CostDelegate <NSObject>

- (void)costInformationType:(NSString *)chooseType withMoney:(NSString *)money withExplain:(NSString *)explain;

- (void)hiddenCost;

@end;

@interface CostView : UIView

@property (strong , nonatomic) UIView *view;

@property (strong , nonatomic) UILabel *titleLabel;  // 人均费用

@property (strong , nonatomic) UIButton *btn1;       // 参考展示

@property (strong , nonatomic) UIButton *btn2;       // 我请客

@property (strong , nonatomic) UIButton *btn3;       // 线上支付

@property (strong , nonatomic) UILabel *describeLabel;  // 

@property (strong , nonatomic) UILabel *inputLabel;

@property (strong , nonatomic) UITextField *inputTextField;

@property (strong , nonatomic) UILabel *instructionsLabel;

@property (strong , nonatomic) UITextField *instructionsTextField;

@property (strong , nonatomic) UIButton *determineBtn;

@property (strong , nonatomic) UIButton *deleteBtn;

@property (weak , nonatomic) id<CostDelegate>delegate;


@end
