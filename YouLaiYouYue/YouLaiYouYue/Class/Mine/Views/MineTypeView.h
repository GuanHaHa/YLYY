//
//  MineTypeView.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/24.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MineTypeViewDelegate <NSObject>

- (void)selectView:(NSInteger)index;

@end
@interface MineTypeView : UIView

@property (strong ,nonatomic) UIImageView *imgView;

@property (strong ,nonatomic) UILabel *typeLabel;

@property (weak ,nonatomic) id<MineTypeViewDelegate>delegate;

@end
