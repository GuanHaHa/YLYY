//
//  CorrelationView.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/9/7.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CorrelationDelegate <NSObject>

- (void)didCellItem:(NSInteger)item;

@end

@interface CorrelationView : UIView

//展示从底部向上弹出的UIView（包含遮罩）
- (void)showInView:(UIView *)view;

@property (strong ,nonatomic) NSMutableArray *actArray;

@property (weak , nonatomic) id<CorrelationDelegate>delegate;

@end
