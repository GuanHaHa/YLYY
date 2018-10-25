//
//  SevenTypeBtnTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/15.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "SevenTypeBtnTableViewCell.h"

@implementation SevenTypeBtnTableViewCell

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
    CGContextStrokeRect(context, CGRectMake(0, rect.size.height, rect.size.width-15, 5));
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.btn2];
        [self.contentView addSubview:self.btn1];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    
    [_btn2 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_btn2 autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [_btn2 autoSetDimension:ALDimensionWidth toSize:70];
    [_btn2 autoSetDimension:ALDimensionHeight toSize:25];
    
    [_btn1 autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_btn2 withOffset:-20];
    [_btn1 autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [_btn1 autoSetDimension:ALDimensionWidth toSize:70];
    [_btn1 autoSetDimension:ALDimensionHeight toSize:25];
    
}

- (UIButton *)btn1 {
    if (!_btn1) {
        _btn1 = [[UIButton alloc] initForAutoLayout];
        [_btn1 setBackgroundColor:UIColorFromRGB(0xffffff)];
        [_btn1 setTitle:@"删除活动" forState:UIControlStateNormal];
        [_btn1 setTitle:@"删除活动" forState:UIControlStateSelected];
        [_btn1 setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        _btn1.titleLabel.font = [UIFont systemFontOfSize:14];
        _btn1.layer.cornerRadius = 12;
        [_btn1.layer setMasksToBounds:YES];
        _btn1.layer.borderWidth = 0.8;
        
    }
    return _btn1;
}
- (UIButton *)btn2 {
    if (!_btn2) {
        _btn2 = [[UIButton alloc] initForAutoLayout];
        [_btn2 setBackgroundColor:UIColorFromRGB(0xff9d00)];
        [_btn2 setTitle:@"已取消" forState:UIControlStateNormal];
        [_btn2 setTitle:@"已取消" forState:UIControlStateSelected];
        [_btn2 setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _btn2.titleLabel.font = [UIFont systemFontOfSize:14];
        _btn2.layer.cornerRadius = 12;
        [_btn2.layer setMasksToBounds:YES];
        
    }
    return _btn2;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
