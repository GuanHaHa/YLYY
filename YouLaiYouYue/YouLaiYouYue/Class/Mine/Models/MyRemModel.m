//
//  MyRemModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/9.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "MyRemModel.h"

@implementation MyRemModel
+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _fmtitle = dic[@"fmtitle"];
        _fmpic    = dic[@"fmpic"];
        _fmID = dic[@"fmID"];
        _fmgotime = dic[@"fmgotime"];
        _fmendtime = dic[@"fmendtime"];
        _percapitacost = dic[@"percapitacost"];
        _fmlook = dic[@"fmlook"];
        _fmfavorite = dic[@"fmfavorite"];
        _fmtime = dic[@"fmtime"];
    }
    return self;
}

@end
