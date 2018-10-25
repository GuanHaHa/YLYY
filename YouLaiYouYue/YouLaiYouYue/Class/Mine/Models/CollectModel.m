//
//  CollectModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/8.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "CollectModel.h"

@implementation CollectModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _fID = dic[@"fID"];
        _ftitle = [NSString stringWithFormat:@"%@",dic[@"ftitle"]];
        _fpic = dic[@"fpic"];
        _ftime = dic[@"ftime"];
        _ftype = dic[@"ftype"];
        _ftableid = dic[@"ftableid"];
    }
    return self;
}


@end
