//
//  PayTypeTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/13.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "PayTypeTableViewCell.h"

@implementation PayTypeTableViewCell

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
        [self addUI];
        
    }
    return self;
}

- (void)setIsSelectImg:(BOOL)select {
    if (select) {
        self.chooseImg.image = [UIImage imageNamed:@"xuanzhong"];
    }
    if (!select) {
        self.chooseImg.image = [UIImage imageNamed:@"weixuanzhong"];
    }
    
}

- (void)addUI {
    [self.contentView addSubview:self.titleImage];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.chooseImg];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_titleImage autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [_titleImage autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:17*Balance_Width];
    [_titleImage autoSetDimension:ALDimensionWidth toSize:21*Balance_Width];
    [_titleImage autoSetDimension:ALDimensionHeight toSize:21*Balance_Width];
    //    _titleImage.layer.borderWidth = 1;
    
    [_titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_titleImage withOffset:15*Balance_Width];
    [_titleLabel autoAlignAxisToSuperviewAxis:(ALAxisHorizontal)];
    [_titleLabel autoSetDimension:ALDimensionWidth toSize:200*Balance_Width];
    [_titleLabel autoSetDimension:ALDimensionHeight toSize:40];
    //    _titleLabel.layer.borderWidth = 1;
    
    
    
    [_chooseImg autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [_chooseImg autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:17*Balance_Width];
    [_chooseImg autoSetDimension:ALDimensionWidth toSize:20];
    [_chooseImg autoSetDimension:ALDimensionHeight toSize:20];
    //    _button.layer.borderWidth = 1;
}

- (UIImageView *)titleImage {
    if (!_titleImage) {
        _titleImage = [[UIImageView alloc] initForAutoLayout];
        
    }
    return _titleImage;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.textColor = UIColorFromRGB(0x282828);
        _titleLabel.text = @"微信支付";
        _titleLabel.font = [UIFont systemFontOfSize:16];
    }
    return _titleLabel;
}

- (UIImageView *)chooseImg {
    if (!_chooseImg) {
        _chooseImg = [[UIImageView alloc] initForAutoLayout];
        
    }
    return _chooseImg;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
