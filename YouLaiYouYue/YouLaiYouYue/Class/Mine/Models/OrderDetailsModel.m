//
//  OrderDetailsModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/20.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "OrderDetailsModel.h"

@implementation OrderDetailsModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _title          = dic[@"title"];
        _content        = dic[@"content"];
        _picture        = dic[@"picture"];
        _time           = dic[@"time"];
        _go_num         = dic[@"go_num"];
        _price          = dic[@"price"];
        _order_sn       = dic[@"order_sn"];
        _paycode        = dic[@"paycode"];
        _create_time    = dic[@"create_time"];
        _pay_time       = dic[@"pay_time"];
        _over_time      = dic[@"over_time"];
        _pay_type       = dic[@"pay_type"];
        _status         = dic[@"status"];
        _order_type     = dic[@"order_type"];
        _price_type     = dic[@"price_type"];
        
        
        
    }
    return self;
}



@end
