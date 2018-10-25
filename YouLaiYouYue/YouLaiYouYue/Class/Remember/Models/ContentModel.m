//
//  ContentModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/6.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "ContentModel.h"

@implementation ContentModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _fmfavorite         = dic[@"fmfavorite"];
        _fmlook             = dic[@"fmlook"];
        _percapitacost      = dic[@"percapitacost"];
        _fmpic              = dic[@"fmpic"];
        _fmgotime           = dic[@"fmgotime"];
        _fmendtime          = dic[@"fmendtime"];
        _fmaddress          = dic[@"fmaddress"];
        _userpic            = dic[@"userpic"];
        _username           = dic[@"username"];
        _usergrade          = dic[@"usergrade"];
        _follow             = [NSString stringWithFormat:@"%@",dic[@"follow"]];
        _give               = dic[@"give"];
        _fmID               = dic[@"fmID"];
        _fmtitle            = dic[@"fmtitle"];
        _Collection         = dic[@"Collection"];
        _uid                = dic[@"uid"];
        _inserTtext         = dic[@"inserTtext"];
    }
    return self;
}



@end
