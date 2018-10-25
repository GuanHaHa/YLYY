//
//  ActivitlModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/9.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "ActivitlModel.h"

@implementation ActivitlModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _sign            = dic[@"sign"];
        _usergrade       = dic[@"usergrade"];
        _username        = dic[@"username"];
        _pfID            = dic[@"pfID"];
        _captain         = dic[@"captain"];
        _pfpeople        = dic[@"pfpeople"];
        _have_num        = dic[@"have_num"];
        _pftitle         = dic[@"pftitle"];
        _pfcontent       = dic[@"pfcontent"];
        _pfpic           = dic[@"pfpic"];
        _upicurl         = dic[@"upicurl"];
        _all_u_pic       = dic[@"all_u_pic"];
        _focusOn         = dic[@"focusOn"];
        _wy_accid        = dic[@"wy_accid"];
        _captain_focusOn = dic[@"captain_focusOn"];
        _pfgotime        = dic[@"pfgotime"];
        _pfpwd           = dic[@"pfpwd"];
        
    }
    return self;
}


@end
