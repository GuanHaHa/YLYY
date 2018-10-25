//
//  SignModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/7.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "SignModel.h"

@implementation SignModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _num         = dic[@"num"];
        _username    = dic[@"username"];
        _userpic     = dic[@"userpic"];
        _noname      = dic[@"noname"];
        _u_ID        = dic[@"userID"];
    }
    return self;
}


@end
