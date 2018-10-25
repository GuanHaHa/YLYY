//
//  RecommendModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/18.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "RecommendModel.h"

@implementation RecommendModel


+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _fmID          = dic[@"fmID"];
        _fmcomment     = dic[@"fmcomment"];
        _fmcontent     = dic[@"fmcontent"];
        _fmhot         = dic[@"fmhot"];
        _fmlook        = dic[@"fmlook"];
        _fmpic         = dic[@"fmpic"];
        _fmtime        = dic[@"fmtime"];
        _fmtitle       = dic[@"fmtitle"];
        _type          = dic[@"type"];
        _upicurl       = dic[@"upicurl"];
        _username      = dic[@"username"];
        _userphone     = dic[@"userphone"];
        _follow        = dic[@"follow"];
        _usergrade     = dic[@"usergrade"];
        _useID         = dic[@"userID"];
        _accesspassword = dic[@"accesspassword"];
        
    }
    return self;
}




@end
