//
//  OrderDetailsTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/20.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "OrderDetailsTableViewCell.h"

@implementation OrderDetailsTableViewCell

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
        
        [self.contentView addSubview:self.type];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.bgView];
        [self.bgView addSubview:self.img];
        [self.bgView addSubview:self.titLabel];
        [self.bgView addSubview:self.peopleNum];
        [self.bgView addSubview:self.timeLabel];
        [self.contentView addSubview:self.costType];
        [self.contentView addSubview:self.allCost];
    }
    return self;
}

- (void)setModel:(OrderDetailsModel *)model {
    _model = model;
    
    self.type.text = _model.status;
    self.titleLabel.text = _model.title;
    [self.img sd_setImageWithURL:[NSURL URLWithString:_model.picture] placeholderImage:nil];
    self.titLabel.text = _model.content;
    self.peopleNum.text = [NSString stringWithFormat:@"参加人数:%@",_model.go_num];
    self.timeLabel.text = [NSString stringWithFormat:@"活动时间:%@",_model.time];
    self.costType.text = _model.price_type;
    self.allCost.text = [NSString stringWithFormat:@"合计费用:%@",_model.price];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_type autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
    [_type autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_type autoSetDimension:ALDimensionWidth toSize:70];
    [_type autoSetDimension:ALDimensionHeight toSize:20];
    
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_titleLabel autoSetDimension:ALDimensionHeight toSize:20];
    [_titleLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_type withOffset:-30];
    
    [_bgView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:10];
    [_bgView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [_bgView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [_bgView autoSetDimension:ALDimensionHeight toSize:105];
    
    [_img autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 20, 10, 10) excludingEdge:ALEdgeRight];
    [_img autoSetDimension:ALDimensionWidth toSize:130];
    
    [_titLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_img withOffset:0];
    [_titLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img withOffset:10];
    [_titLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_titLabel autoSetDimension:ALDimensionHeight toSize:30];
    
    [_peopleNum autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_img withOffset:0];
    [_peopleNum autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img withOffset:10];
    [_peopleNum autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_peopleNum autoSetDimension:ALDimensionHeight toSize:20];
    
    [_timeLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img withOffset:10];
    [_timeLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_peopleNum withOffset:-5];
    [_timeLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_timeLabel autoSetDimension:ALDimensionHeight toSize:20];
    
    [_costType autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_bgView withOffset:10];
    [_costType autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_costType autoSetDimension:ALDimensionHeight toSize:20];
    [_costType autoSetDimension:ALDimensionWidth toSize:130];
    
    [_allCost autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_bgView withOffset:10];
    [_allCost autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_allCost autoSetDimension:ALDimensionHeight toSize:20];
    [_allCost autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_costType withOffset:10];
    
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.textColor = UIColorFromRGB(0x333333);
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.text = @"你发撒开了房就是垃圾";
        
    }
    return _titleLabel;
}

- (UILabel *)type {
    if (!_type) {
        _type = [[UILabel alloc] initForAutoLayout];
        _type.textColor = UIColorFromRGB(0x333333);
        _type.font = [UIFont systemFontOfSize:15];
        _type.text = @"代付款";
        _type.textAlignment = NSTextAlignmentRight;
        
    }
    return _type;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] initForAutoLayout];
        _bgView.backgroundColor = UIColorFromRGB(0xf1f1f1);
    }
    return _bgView;
}

- (UIImageView *)img {
    if (!_img) {
        _img = [[UIImageView alloc] initForAutoLayout];
        _img.image = [UIImage imageNamed:@"img1"];
//        _img.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _img;
}

- (UILabel *)titLabel {
    if (!_titLabel) {
        _titLabel = [[UILabel alloc] initForAutoLayout];
        _titLabel.textColor = UIColorFromRGB(0x333333);
        _titLabel.font = [UIFont systemFontOfSize:15];
        _titLabel.text = @"你发撒开了房就是垃圾";
        
    }
    return _titLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] initForAutoLayout];
        _timeLabel.textColor = UIColorFromRGB(0x333333);
        _timeLabel.font = [UIFont systemFontOfSize:13];
        _timeLabel.text = @"活动时间:1838383";
        
    }
    return _timeLabel;
}

- (UILabel *)peopleNum {
    if (!_peopleNum) {
        _peopleNum = [[UILabel alloc] initForAutoLayout];
        _peopleNum.textColor = UIColorFromRGB(0x333333);
        _peopleNum.font = [UIFont systemFontOfSize:13];
        _peopleNum.text = @"参加人数:1838383";
        
    }
    return _peopleNum;
}

- (UILabel *)costType {
    if (!_costType) {
        _costType = [[UILabel alloc] initForAutoLayout];
        _costType.textColor = UIColorFromRGB(0x333333);
        _costType.font = [UIFont systemFontOfSize:14];
        _costType.text = @"自费";
        
    }
    return _costType;
}

- (UILabel *)allCost {
    if (!_allCost) {
        _allCost = [[UILabel alloc] initForAutoLayout];
        _allCost.textColor = UIColorFromRGB(0xff9d00);
        _allCost.font = [UIFont systemFontOfSize:14];
        _allCost.text = @"合计费用:33333";
        _allCost.textAlignment = NSTextAlignmentRight;
        
    }
    return _allCost;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
