//
//  PageActivityModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/17.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "PageActivityModel.h"

@implementation PageActivityModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _pfID           = dic[@"pfID"];
        _pftitle         = dic[@"pftitle"];
        _pfpic         = dic[@"pfpic"];
        _pflook      = dic[@"pflook"];
        _pfcomment        = dic[@"pfcomment"];
        _pffavorite     = dic[@"pffavorite"];
        
    }
    return self;
}


@end
