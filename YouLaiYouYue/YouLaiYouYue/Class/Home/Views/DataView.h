//
//  DataView.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/9/11.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DatePickerViewDelegate <NSObject>

/**
 保存按钮代理方法
 
 @param timer 选择的数据
 */
- (void)datePickerViewSaveBtnClickDelegate:(NSString *)timer;

/**
 取消按钮代理方法
 */
- (void)datePickerViewCancelBtnClickDelegate;

@end

@interface DataView : UIView

@property (copy, nonatomic) NSString *title;

/// 是否自动滑动 默认YES
@property (assign, nonatomic) BOOL isSlide;

/// 选中的时间， 默认是当前时间 2017-02-12 13:35
@property (copy, nonatomic) NSString *date;

/// 分钟间隔 默认5分钟
@property (assign, nonatomic) NSInteger minuteInterval;

@property (weak, nonatomic) id <DatePickerViewDelegate> delegate;


/**
 显示  必须调用
 */
- (void)show;

@end
