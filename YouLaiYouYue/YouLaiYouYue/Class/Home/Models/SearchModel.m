//
//  SearchModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/21.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "SearchModel.h"

@implementation SearchModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _searchId         = dic[@"id"];
        _title    = dic[@"title"];
        _type     = dic[@"type"];
    }
    return self;
}

@end
