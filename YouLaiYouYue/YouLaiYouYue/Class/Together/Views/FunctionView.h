//
//  FunctionView.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/20.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol FunctionVieweDelegate <NSObject>

- (void)seleFunctionView:(NSInteger )index;

@end
@interface FunctionView : UIView


@property (strong , nonatomic) UILabel *titleLabel;
@property (strong , nonatomic) UIImageView *img;
@property (weak , nonatomic) id <FunctionVieweDelegate> delegate;


@end
