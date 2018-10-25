//
//  InsertModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/9.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "InsertModel.h"

@implementation InsertModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _ffpID = dic[@"ffpID"];
        _ffptitle    = dic[@"ffptitle"];
        _ffpurl = dic[@"ffpurl"];
        _ffptime = dic[@"ffptime"];
        _u_ID = dic[@"userID"];
        _radio = dic[@"radio"];
        _reason = dic[@"reason"];
        _username = dic[@"username"];
        _userpic = dic[@"userpic"];
    }
    return self;
}



@end
