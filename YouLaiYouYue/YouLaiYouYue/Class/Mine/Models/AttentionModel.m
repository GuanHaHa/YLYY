//
//  AttentionModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/7.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "AttentionModel.h"

@implementation AttentionModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _activity_id = dic[@"activity_id"];
        _article_num = dic[@"article_num"];
        _lID = dic[@"lID"];
        _like_num = dic[@"like_num"];
        _likeuserID = dic[@"likeuserID"];
        _status = dic[@"status"];
        _upicurl = dic[@"upicurl"];
        _username = dic[@"username"];
        _userphone = dic[@"userphone"];
        _usersex = dic[@"usersex"];
    }
    return self;
}

@end
