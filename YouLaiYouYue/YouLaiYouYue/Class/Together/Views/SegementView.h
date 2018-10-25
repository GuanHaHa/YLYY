//
//  SegementView.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/9/2.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SegementViewDelegate<NSObject>
/**
 获得点击下标
 
 */
- (void)didSelectWithIndex:(NSInteger)index;

@end
@interface SegementView : UIView

/**
 根据角标，选中对应的控制器
 */
@property (nonatomic, assign) NSInteger selectIndex;
/** 标题数组 */
@property (nonatomic, strong) NSArray * titles;

@property (nonatomic, assign) BOOL isShowUnderLine;

@property (nonatomic, weak) id<SegementViewDelegate> delegate;



//- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;


@end
