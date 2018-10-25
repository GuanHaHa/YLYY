//
//  TitleModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/29.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "TitleModel.h"

@implementation TitleModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _pftitle          = dic[@"pftitle"];
        _pfID        = dic[@"pfID"];
        _block       = dic[@"block"];
    }
    return self;
}

@end
