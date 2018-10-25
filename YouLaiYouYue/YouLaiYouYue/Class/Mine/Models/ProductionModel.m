//
//  ProductionModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/17.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "ProductionModel.h"

@implementation ProductionModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _fmID           = dic[@"fmID"];
        _fmtitle         = dic[@"fmtitle"];
        _fmlook         = dic[@"fmlook"];
        _fmgood      = dic[@"fmgood"];
        _fmcomment        = dic[@"fmcomment"];
        _fmfavorite     = dic[@"fmfavorite"];
        _fmpic        = dic[@"fmpic"];
    }
    return self;
}


@end
