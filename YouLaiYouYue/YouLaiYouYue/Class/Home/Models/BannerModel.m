//
//  BannerModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/31.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "BannerModel.h"

@implementation BannerModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _type         = dic[@"type"];
        _title    = dic[@"title"];
        _leftid     = dic[@"leftid"];
        _pic     = dic[@"pic"];
        _first_type     = dic[@"first_type"];

    }
    return self;
}

@end
