//
//  PhotoModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/23.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "PhotoModel.h"

@implementation PhotoModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _pfpurl          = dic[@"pfpurl"];
        _pfpcontent        = dic[@"pfpcontent"];
        _pfpID        = dic[@"pfpID"];
   
    }
    return self;
}



@end
