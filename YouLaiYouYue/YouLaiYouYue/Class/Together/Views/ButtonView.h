//
//  ButtonView.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/20.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ButtonVieweDelegate <NSObject>

- (void)seleView:(NSInteger )index;

@end

@interface ButtonView : UIView


@property (strong , nonatomic) UILabel *titleLabel;
@property (strong , nonatomic) UIImageView *img;
@property (weak , nonatomic) id <ButtonVieweDelegate> delegate;

@end
