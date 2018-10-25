//
//  TagModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/30.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "TagModel.h"

@implementation TagModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _lID = dic[@"lID"];
        _lname = dic[@"lname"];
        _luse = dic[@"luse"];
    }
    return self;
}


@end
