//
//  PersonModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/25.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "PersonModel.h"

@implementation PersonModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        _headeimg           = dic[@"headeimg"];
        _username           = dic[@"username"];
        _sex                = dic[@"sex"];
        _useraddress        = dic[@"useraddress"];
        _userautograph      = dic[@"userautograph"];
        _userbirthday       = dic[@"userbirthday"];
        _usertime           = dic[@"usertime"];
        _usercodeok         = dic[@"usercodeok"];
        _usermarry          = dic[@"usermarry"];
        _usergrade          = dic[@"usergrade"];
        _sign               = dic[@"sign"];
        _vip                = dic[@"vip"];
        
    }
    return self;
}


@end
