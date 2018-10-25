//
//  InviteMsgModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/29.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "InviteMsgModel.h"

@implementation InviteMsgModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _pfID         = dic[@"id"];
        _tid    = dic[@"tid"];
        _type     = dic[@"type"];
        _pftitle     = dic[@"pftitle"];
        _pfcontent     = dic[@"pfcontent"];
        _pfpic     = dic[@"pfpic"];
    }
    return self;
}

@end
