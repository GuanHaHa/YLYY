//
//  PlaceTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/17.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "PlaceTableViewCell.h"

@implementation PlaceTableViewCell

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
    CGContextStrokeRect(context, CGRectMake(0, rect.size.height, rect.size.width-15, 2));
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.cityBtn];
        [self.contentView addSubview:self.messageBtn];
        [self.contentView addSubview:self.searchBtn];
        
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_cityBtn autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(13, 10, 13, 0) excludingEdge:ALEdgeRight];
    [_cityBtn autoSetDimension:ALDimensionWidth toSize:85];
    
    [_messageBtn autoAlignAxisToSuperviewMarginAxis:(ALAxisHorizontal)];
    [_messageBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [_messageBtn autoSetDimension:ALDimensionWidth toSize:25];
    [_messageBtn autoSetDimension:ALDimensionHeight toSize:25];
    
    [_searchBtn autoAlignAxisToSuperviewMarginAxis:(ALAxisHorizontal)];
    [_searchBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_cityBtn withOffset:15];
    [_searchBtn autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_messageBtn withOffset:-15];
    [_searchBtn autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
    [_searchBtn autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
    
}

- (UIButton *)cityBtn
{
    if (!_cityBtn) {
        _cityBtn = [[UIButton alloc] initForAutoLayout];
        _cityBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_cityBtn setImage:[[UIImage imageNamed:@"home_city"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        [_cityBtn setTitle:@"" forState:(UIControlStateNormal)];
        [_cityBtn setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];

        _cityBtn.titleEdgeInsets = UIEdgeInsetsMake(0,  -(_cityBtn.imageView.frame.origin.x+_cityBtn.imageView.frame.size.width+4), 0, 0);
        //button图片的偏移量
        _cityBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -(_cityBtn.imageView.frame.origin.x +10), 0, _cityBtn.imageView.frame.origin.x);
    
    }
    return _cityBtn;
}



- (UIButton *)messageBtn {
    if (!_messageBtn) {
        _messageBtn = [[UIButton alloc] initForAutoLayout];
        
        [_messageBtn setImage:[[UIImage imageNamed:@"Message"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        _messageBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _messageBtn;
         
}

- (UIButton *)searchBtn {
    if (!_searchBtn) {
        _searchBtn = [[UIButton alloc] initForAutoLayout];
        
        [_searchBtn setImage:[[UIImage imageNamed:@"seach"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        _searchBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _searchBtn;
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
