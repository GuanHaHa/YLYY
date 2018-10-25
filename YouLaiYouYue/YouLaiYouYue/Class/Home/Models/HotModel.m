//
//  HotModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/28.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "HotModel.h"

@implementation HotModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _mes_id         = dic[@"mes_id"];
        _mes_title    = dic[@"mes_title"];
        _mes_message     = dic[@"mes_message"];
        _mes_pic     = dic[@"mes_pic"];
        _mes_time     = dic[@"mes_time"];
    }
    return self;
}

@end
