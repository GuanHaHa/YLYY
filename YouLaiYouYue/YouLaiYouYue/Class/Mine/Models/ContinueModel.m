//
//  ContinueModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/11.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "ContinueModel.h"

@implementation ContinueModel


+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _continueId      = dic[@"id"];
        _pfptitle        = dic[@"pfptitle"];
        _pfpcontent      = dic[@"pfpcontent"];
        _img_list        = dic[@"img_list"];
        
    }
    return self;
}








@end
