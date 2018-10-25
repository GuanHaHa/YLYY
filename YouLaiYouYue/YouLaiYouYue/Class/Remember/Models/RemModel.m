//
//  RemModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/10.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "RemModel.h"

@implementation RemModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _fmID              = dic[@"fmID"];
        _accesspassword    = dic[@"accesspassword"];
        _fmtitle           = dic[@"fmtitle"];
        _fmcontent         = dic[@"fmcontent"];
        _fmpic             = dic[@"fmpic"];
        _fmcomment         = dic[@"fmcomment"];
        _fmlook            = dic[@"fmlook"];
        _fmtime            = dic[@"fmtime"];
        _username          = [NSString stringWithFormat:@"%@",dic[@"username"]];
        _upicurl           = dic[@"upicurl"];
        _usergrade         = dic[@"usergrade"];
        _look              = dic[@"look"];
        _uerID             = dic[@"userID"];
        _userphone         = dic[@"userphone"];
    }
    return self;
}


@end
