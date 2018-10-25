//
//  EditInserModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/27.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "EditInserModel.h"

@implementation EditInserModel


+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _ffID          = dic[@"ffID"];
        _fftitle        = dic[@"fftitle"];
    }
    return self;
}


@end
