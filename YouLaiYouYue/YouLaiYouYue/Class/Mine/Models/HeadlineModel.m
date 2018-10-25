//
//  HeadlineModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/30.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "HeadlineModel.h"

@implementation HeadlineModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _pfID = dic[@"pfID"];
        _pftitle = dic[@"pftitle"];
        
    }
    return self;
}


@end
