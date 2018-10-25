//
//  ActivityInfoModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/6.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "ActivityInfoModel.h"

@implementation ActivityInfoModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _pfcontent     = dic[@"pfcontent"];
        _pftime        = dic[@"pftime"];
        _pflook        = dic[@"pflook"];
        _pfcomment     = dic[@"pfcomment"];
        _pfpic         = dic[@"pfpic"];
        _pfID          = dic[@"pfID"];
        _pftitle       = dic[@"pftitle"];
    }
    return self;
}


@end
