//
//  VideoModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/6.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _vurl      = dic[@"vurl"];
        _vname     = dic[@"vname"];
        _img       = dic[@"img"];
        _look_num  = dic[@"look_num"];
        _vID       = dic[@"vID"];
    }
    return self;
}


@end
