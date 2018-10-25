//
//  BottomView.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/19.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "BottomView.h"

@interface BottomView ()<HomePageCateViewDelegate>

@end
@implementation BottomView

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

- (void)selectView:(NSInteger)index {
    if ([self.delegate respondsToSelector:@selector(selectView:)]) {
        [self.delegate selectView:index];
    }
}

- (void)addHomePageCateView{
    NSArray *imgArray = @[@"consult",@"share-y",@"con"];
    NSArray *textArray = @[@"咨询队长",@"分享",@"关注"];
    
    for (int i = 0; i < [textArray count]; i ++) {
        _pageView = [[HomePageCateView alloc] initForAutoLayout];
        [self addSubview:_pageView];
        _pageView.tag = i+2000;
        
        _pageView.delegate =self;
        _pageView.typeImg.image = [UIImage imageNamed:imgArray[i]];
        _pageView.numLabel.text = textArray[i];
        [_pageView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
        [_pageView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:i*SCREEN_WIDTH/2/ textArray.count];
        [_pageView autoSetDimension:ALDimensionHeight toSize:50];
        [_pageView autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/2/ textArray.count];
        UIView *xian = [[UIView alloc] initForAutoLayout];
        xian.backgroundColor = UIColorFromRGB(0xf7f7f7);
        [self addSubview:xian];
        [xian autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
        [xian autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:(i+1)*SCREEN_WIDTH/2/ textArray.count];
        [xian autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
        [xian autoSetDimension:ALDimensionWidth toSize:1];
    }
    
    [self addSubview:self.btn];
    [_btn autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeLeft];
    [_btn autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/2];
}

- (UIButton *)btn
{
    if (!_btn) {
        _btn = [[UIButton alloc] initForAutoLayout];
        _btn.titleLabel.font = [UIFont systemFontOfSize:15];
        
        [_btn setTitle:@"报名参加" forState:(UIControlStateNormal)];
        [_btn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _btn.backgroundColor = UIColorFromRGB(0xff9d00);
        
        
    }
    return _btn;
}

@end
