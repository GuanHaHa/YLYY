//
//  OrderInfoTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/20.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "OrderInfoTableViewCell.h"

@implementation OrderInfoTableViewCell

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
        
        [self.contentView addSubview:self.orderNum];
        [self.contentView addSubview:self.transactionNum];
        [self.contentView addSubview:self.creationTime];
        [self.contentView addSubview:self.payTime];
        [self.contentView addSubview:self.bargainTime];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_orderNum autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 20, 10, 20) excludingEdge:ALEdgeBottom];
    [_orderNum autoSetDimension:ALDimensionHeight toSize:20];
    
    [_transactionNum autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_orderNum withOffset:10];
    [_transactionNum autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_transactionNum autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_transactionNum autoSetDimension:ALDimensionHeight toSize:20];
    
    [_creationTime autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_transactionNum withOffset:10];
    [_creationTime autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_creationTime autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_creationTime autoSetDimension:ALDimensionHeight toSize:20];
    
    [_payTime autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_creationTime withOffset:10];
    [_payTime autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_payTime autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_payTime autoSetDimension:ALDimensionHeight toSize:20];
    
    [_bargainTime autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_payTime withOffset:10];
    [_bargainTime autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [_bargainTime autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [_bargainTime autoSetDimension:ALDimensionHeight toSize:20];
    
    
    
}

- (void)setModel:(OrderDetailsModel *)model {
    _model = model;
    
    _orderNum.text = [NSString stringWithFormat:@"订单编号:%@",_model.order_sn];
    if ([_model.pay_type isEqualToString:@"0"]) {
        _transactionNum.text = [NSString stringWithFormat:@"微信交易号:%@",_model.paycode];
    }else if ([_model.pay_type isEqualToString:@"1"]) {
        _transactionNum.text = [NSString stringWithFormat:@"支付宝交易号:%@",_model.paycode];
    }
    _creationTime.text = [NSString stringWithFormat:@"创建时间:%@",_model.create_time];
    _payTime.text = [NSString stringWithFormat:@"付款时间:%@",_model.pay_time];
    _bargainTime.text = [NSString stringWithFormat:@"成交时间:%@",_model.over_time];
}

- (UILabel *)orderNum {
    if (!_orderNum) {
        _orderNum = [[UILabel alloc] initForAutoLayout];
        _orderNum.textColor = UIColorFromRGB(0x333333);
        _orderNum.font = [UIFont systemFontOfSize:15];
        _orderNum.text = @"订单编号:";
        _orderNum.textAlignment = NSTextAlignmentLeft;
        
    }
    return _orderNum;
}

- (UILabel *)transactionNum {
    if (!_transactionNum) {
        _transactionNum = [[UILabel alloc] initForAutoLayout];
        _transactionNum.textColor = UIColorFromRGB(0x333333);
        _transactionNum.font = [UIFont systemFontOfSize:15];
        _transactionNum.text = @"支付宝交易号:";
        _transactionNum.textAlignment = NSTextAlignmentLeft;
        
    }
    return _transactionNum;
}

- (UILabel *)creationTime {
    if (!_creationTime) {
        _creationTime = [[UILabel alloc] initForAutoLayout];
        _creationTime.textColor = UIColorFromRGB(0x333333);
        _creationTime.font = [UIFont systemFontOfSize:15];
        _creationTime.text = @"创建时间:";
        _creationTime.textAlignment = NSTextAlignmentLeft;
        
    }
    return _creationTime;
}

- (UILabel *)payTime {
    if (!_payTime) {
        _payTime = [[UILabel alloc] initForAutoLayout];
        _payTime.textColor = UIColorFromRGB(0x333333);
        _payTime.font = [UIFont systemFontOfSize:15];
        _payTime.text = @"付款时间:";
        _payTime.textAlignment = NSTextAlignmentLeft;
        
    }
    return _payTime;
}
- (UILabel *)bargainTime {
    if (!_bargainTime) {
        _bargainTime = [[UILabel alloc] initForAutoLayout];
        _bargainTime.textColor = UIColorFromRGB(0x333333);
        _bargainTime.font = [UIFont systemFontOfSize:15];
        _bargainTime.text = @"成交时间:";
        _bargainTime.textAlignment = NSTextAlignmentLeft;
        
    }
    return _bargainTime;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
