//
//  MyFriendModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/28.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "MyFriendModel.h"
#import "NSString+Utils.h"//category
@implementation MyFriendModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _userpic       = dic[@"userpic"];
        _username      = dic[@"username"];
        _wy_accid      = dic[@"wy_accid"];
        _user_id       = dic[@"id"];
        _u_id          = dic[@"uid"];
        _pinyin        = _username.pinyin;
    }
    return self;
}

@end
