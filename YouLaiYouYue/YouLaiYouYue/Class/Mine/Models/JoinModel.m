//
//  JoinModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/9.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "JoinModel.h"

@implementation JoinModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _captain     = dic[@"captain"];
        _ujID        = dic[@"ujID"];
        _pfID        = dic[@"pfID"];
        _pfpic       = dic[@"pfpic"];
        _pftitle     = dic[@"pftitle"];
        _pfgotime    = dic[@"pfgotime"];
        _pfendtime   = dic[@"pfendtime"];
        _pfspend     = dic[@"pfspend"];
        _pflook      = dic[@"pflook"];
        _join_num    = dic[@"join_num"];
        _focusOn     = dic[@"focusOn"];
        _wy_accid    = dic[@"wy_accid"];
        _is_over     = dic[@"is_over"];
    }
    return self;
}



@end
