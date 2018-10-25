//
//  InviteTitleTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/29.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "InviteTitleTableViewCell.h"

@implementation InviteTitleTableViewCell

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
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self.contentView addSubview:self.img];
        [self.contentView addSubview:self.nameLable];
        [self.contentView addSubview:self.label];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_img autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [_img autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_img autoSetDimension:ALDimensionHeight toSize:20];
    [_img autoSetDimension:ALDimensionWidth toSize:20];
    
    [_nameLable autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img withOffset:10];
    [_nameLable autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [_nameLable autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    [_nameLable autoSetDimension:ALDimensionWidth toSize:100];
    
    [_label autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [_label autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [_label autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    [_label autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_nameLable withOffset:10];
    
}



- (UIImageView *)img {
    if (!_img) {
        _img = [[UIImageView alloc] initForAutoLayout];
        _img.image = [UIImage imageNamed:@"activities-require"];
    }
    return _img;
}

- (UILabel *)nameLable {
    if (!_nameLable) {
        _nameLable = [[UILabel alloc] initForAutoLayout];
        _nameLable.text = @"请选择活动";
        _nameLable.textColor = UIColorFromRGB(0x333333);
        _nameLable.font = [UIFont systemFontOfSize:14];
    }
    return _nameLable;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initForAutoLayout];
        _label.text = @"请选择活动";
        _label.textColor = UIColorFromRGB(0x333333);
        _label.font = [UIFont systemFontOfSize:14];
        _label.textAlignment = NSTextAlignmentRight;
    }
    return _label;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
