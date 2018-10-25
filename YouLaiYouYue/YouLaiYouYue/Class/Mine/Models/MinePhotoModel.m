//
//  MinePhotoModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/27.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "MinePhotoModel.h"

@implementation MinePhotoModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _utime          = dic[@"utime"];
        _upicurl        = dic[@"upicurl"];
        _uid        = dic[@"uid"];
    }
    return self;
}

@end
