//
//  RenewModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/6.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "RenewModel.h"

@implementation RenewModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _ffID         = dic[@"ffID"];
        _fftitle      = dic[@"fftitle"];
        _ffcontect    = dic[@"ffcontect"];
        _uID          = dic[@"userID"];
        _fftime       = dic[@"fftime"];
        _type         = [NSString stringWithFormat:@"%@",dic[@"type"]];
        _username     = dic[@"username"];
        _userpic      = dic[@"userpic"];
        _follow       = dic[@"follow"];
        _picArr         = dic[@"pic"];
    }
    return self;
}

@end
