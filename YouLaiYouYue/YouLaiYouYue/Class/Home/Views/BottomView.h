//
//  BottomView.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/19.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomePageCateView.h"

@protocol BottomViewDelegate <NSObject>

- (void)selectView:(NSInteger)index;

@end


@interface BottomView : UIView
@property (strong , nonatomic) HomePageCateView *pageView;

@property (strong , nonatomic) UIButton *btn;

@property (weak ,nonatomic) id<BottomViewDelegate>delegate;

@end
