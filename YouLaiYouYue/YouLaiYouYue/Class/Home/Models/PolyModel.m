//
//  PolyModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/18.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "PolyModel.h"

@implementation PolyModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _captain        = dic[@"captain"];
        _pfID           = dic[@"pfID"];
        _pfcontent      = dic[@"pfcontent"];
        _pfpic          = dic[@"pfpic"];
        _pftitle        = dic[@"pftitle"];
        _upicurl        = dic[@"upicurl"];
        _usergrade      = dic[@"usergrade"];
        _username       = dic[@"username"];
        _pfgotime       = dic[@"pfgotime"];
        _look_num       = dic[@"look_num"];
        _comment_num    = dic[@"comment_num"];
        _pftime         = dic[@"pftime"];
        _sign           = dic[@"sign"];
        _follow         = dic[@"follow"];
        _pfpwd          = dic[@"pfpwd"];
    }
    return self;
}


@end
