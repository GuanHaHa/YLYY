//
//  BlackModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/9/6.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "BlackModel.h"

@implementation BlackModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _userpic = dic[@"userpic"];
        _username = dic[@"username"];
        _user_id = dic[@"id"];
    }
    return self;
}

@end
