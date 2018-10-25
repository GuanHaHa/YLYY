//
//  BottomFunctionView.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/23.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "BottomFunctionView.h"

@implementation BottomFunctionView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addHomePageCateView];
        
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    
}

//- (void)selectView:(NSInteger)index {
//    if ([self.delegate respondsToSelector:@selector(selectView:)]) {
//        [self.delegate selectView:index];
//    }
//}

- (void)addHomePageCateView{
    NSArray *imgArray = @[@"details-article",@"details-comments",@"details-share",@"details-praise",@"details-Star"];
    NSArray *textArray = @[@"插文",@"评论",@"分享",@"点赞",@"收藏"];
    
    for (int i = 0; i < [textArray count]; i ++) {
        _pageView = [[HomePageCateView alloc] initForAutoLayout];
        [self addSubview:_pageView];
        _pageView.tag = i+2000;
        
        _pageView.delegate =self;
        _pageView.typeImg.image = [UIImage imageNamed:imgArray[i]];
        _pageView.numLabel.text = textArray[i];
        [_pageView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
        [_pageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:i*SCREEN_WIDTH/ textArray.count];
        [_pageView autoSetDimension:ALDimensionHeight toSize:50];
        [_pageView autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/ textArray.count];

    }
}

@end
