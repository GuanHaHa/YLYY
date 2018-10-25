
//
//  EvaluateMsgModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/29.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "EvaluateMsgModel.h"

@implementation EvaluateMsgModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _pfID         = dic[@"pfID"];
        _mes_id    = dic[@"mes_id"];
        _mes_title     = dic[@"mes_title"];
        _mes_pic     = dic[@"mes_pic"];
        _mes_message     = dic[@"mes_message"];
    }
    return self;
}

@end
