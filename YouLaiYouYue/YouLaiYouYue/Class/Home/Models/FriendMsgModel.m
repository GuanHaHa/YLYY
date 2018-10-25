//
//  FriendMsgModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/30.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "FriendMsgModel.h"

@implementation FriendMsgModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _fID        = dic[@"fID"];
        _ftime      = dic[@"ftime"];
        _fuserID    = dic[@"fuserID"];
        _pic        = dic[@"pic"];
        _radio      = dic[@"radio"];
        _title      = dic[@"title"];
        _userfID    = dic[@"userID"];
        _describe   = dic[@"describe"];
    }
    return self;
}


@end
