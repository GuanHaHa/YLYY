//
//  StartModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/8.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "StartModel.h"

@implementation StartModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _pfexamine   = dic[@"pfexamine"];
        _pfID        = dic[@"pfID"];
        _pfpic       = dic[@"pfpic"];
        _pftitle     = dic[@"pftitle"];
        _pfgotime    = dic[@"pfgotime"];
        _pfendtime   = dic[@"pfendtime"];
        _pfspend     = dic[@"pfspend"];
        _pflook      = dic[@"pflook"];
        _join_num    = dic[@"join_num"];
        _focusOn     = dic[@"focusOn"];
        _if_over     = dic[@"if_over"];
    }
    return self;
}


@end
