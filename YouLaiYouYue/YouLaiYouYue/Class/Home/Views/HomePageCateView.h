//
//  HomePageCateView.h
//  XueTuoBang
//
//  Created by mac on 2017/6/5.
//  Copyright © 2017年 com.hongdingnet.guan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HomePageCateViewDelegate <NSObject>

- (void)selectView:(NSInteger)index;

@end
@interface HomePageCateView : UIView


@property (strong ,nonatomic) UIImageView *typeImg;
@property (strong ,nonatomic) UILabel *numLabel;
@property (weak ,nonatomic) id<HomePageCateViewDelegate>delegate;
@end
