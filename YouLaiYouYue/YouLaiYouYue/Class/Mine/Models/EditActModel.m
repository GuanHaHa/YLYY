//
//  EditActModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/10.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "EditActModel.h"

@implementation EditActModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _city         = dic[@"city"];
        _city_name         = dic[@"city_name"];
        _look_num         = dic[@"look_num"];
        _max_num         = dic[@"max_num"];
        _min_num         = dic[@"min_num"];
        _pfagebegin         = dic[@"pfagebegin"];
        _pfageend         = dic[@"pfageend"];
        _pfcontent         = dic[@"pfcontent"];
        _pfendtime         = dic[@"pfendtime"];
        _pfexplain         = dic[@"pfexplain"];
        _pffavorite         = dic[@"pffavorite"];
        _pfgotime         = dic[@"pfgotime"];
        _pfmarry         = dic[@"pfmarry"];
        _pfpeoplesex         = dic[@"pfpeoplesex"];
        _pfpic         = dic[@"pfpic"];
        _pfpwd        = dic[@"pfpwd"];
        _pfspend         = dic[@"pfspend"];
        _pfspendexplain         = dic[@"pfspendexplain"];
        _pfspendtype         = dic[@"pfspendtype"];
        _pftitle        = dic[@"pftitle"];
        _pfwarning         = dic[@"pfwarning"];
        _title_list         = dic[@"title_list"];
        _user_join    = dic[@"user_join"];
        _pflable = dic[@"pflable"];
        _lable_name = dic[@"lable_name"];
    }
    return self;
}


@end
