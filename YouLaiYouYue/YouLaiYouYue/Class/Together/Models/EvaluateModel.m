//
//  EvaluateModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/20.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "EvaluateModel.h"

@implementation EvaluateModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _reply = dic[@"reply"];
        _pfID    = dic[@"pfID"];
        _pic = dic[@"pic"];
        _title = dic[@"title"];
        _time = dic[@"time"];
        _list = dic[@"list"];
    }
    return self;
}


@end
