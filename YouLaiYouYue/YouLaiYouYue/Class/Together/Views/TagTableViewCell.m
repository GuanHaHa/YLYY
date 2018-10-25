//
//  TagTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/9/2.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "TagTableViewCell.h"

@interface TagTableViewCell ()<SegementViewDelegate>

@end;
@implementation TagTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
//自定义分割线
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    
    //下分割线
    CGContextSetStrokeColorWithColor(context, UIColorFromRGB(0xf5f5f5).CGColor);
    CGContextStrokeRect(context, CGRectMake(7, rect.size.height, rect.size.width-15, 2));
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.segeView];
        
    }
    return self;
}

- (void)setTitleArray:(NSArray *)titleArray {
    _titleArray = titleArray;
    
    _segeView.titles = _titleArray;
}

- (void)didSelectWithIndex:(NSInteger)index{
    NSLog(@"代理实现的方法%ld",index);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
//    [_segeView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
}

- (SegementView *)segeView {
    if (!_segeView) {
        _segeView = [[SegementView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        _segeView.delegate = self;
        _segeView.isShowUnderLine = NO;
    }
    return _segeView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
