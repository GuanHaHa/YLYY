//
//  OrderModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/15.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "OrderModel.h"

@implementation OrderModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _oID           = dic[@"oID"];
        _title         = dic[@"title"];
        _info          = dic[@"info"];
        _join_num      = dic[@"join_num"];
        _pf_pic        = dic[@"pf_pic"];
        _opaymoney     = dic[@"opaymoney"];
        _status        = dic[@"status"];
        _order_type    = dic[@"order_type"];
        _price_type    = dic[@"price_type"];
        _time_info     = dic[@"time_info"];
        
        
    }
    return self;
}

@end
