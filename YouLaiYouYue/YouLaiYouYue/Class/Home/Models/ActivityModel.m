//
//  ActivityModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/7.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "ActivityModel.h"

@implementation ActivityModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _attention_captain         = dic[@"attention_captain"];
        _peoplesex         = dic[@"peoplesex"];
        _pfID         = dic[@"pfID"];
        _if_pay         = dic[@"if_pay"];
        _attention         = dic[@"attention"];
        _captain         = dic[@"captain"];
        _capttain_name         = dic[@"capttain_name"];
        _capttain_pic         = dic[@"capttain_pic"];
        _level         = dic[@"level"];
        _if_sign         = dic[@"if_sign"];
        _title         = dic[@"title"];
        _look         = dic[@"look"];
        _pffavorite         = dic[@"pffavorite"];
        _begin_time         = dic[@"begin_time"];
        _end_time         = dic[@"end_time"];
        _city         = dic[@"city"];
        _price         = dic[@"price"];
        _woman         = dic[@"woman"];
        _man         = dic[@"man"];
        _person_num        = dic[@"person_num"];
        _have_num         = dic[@"have_num"];
        _text_info         = dic[@"text_info"];
        _info_list         = dic[@"info_list"];
        _user_list         = dic[@"user_list"];
        _show_pic      = dic[@"show_pic"];
        _real_name     = dic[@"real_name"];
        _user_tel      = dic[@"user_tel"];
        _truename      = dic[@"truename"];
        _wy_accid      = dic[@"wy_accid"];
        _roomid        = dic[@"roomid"];
        _marry         = dic[@"marry"];
        _age           = dic[@"age"];
        _pfexplain     = dic[@"pfexplain"];
        
        
    }
    return self;
}


@end
