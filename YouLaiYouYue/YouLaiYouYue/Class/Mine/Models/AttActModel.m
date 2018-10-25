//
//  AttActModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/9/5.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "AttActModel.h"

@implementation AttActModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _pfID = dic[@"pfID"];
        _pftitle = [NSString stringWithFormat:@"%@",dic[@"pftitle"]];
        _pfpic = dic[@"pfpic"];
        _pfgotime = dic[@"pfgotime"];
        _pfpwd = dic[@"pfpwd"];
    }
    return self;
}

@end
