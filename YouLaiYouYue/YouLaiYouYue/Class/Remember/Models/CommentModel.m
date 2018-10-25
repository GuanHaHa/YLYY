//
//  CommentModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/16.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "CommentModel.h"

@implementation CommentModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _fctitle        = dic[@"fctitle"];
        _fcID         = dic[@"fcID"];
        _fmID         = dic[@"fmID"];
        _fctime         = dic[@"fctime"];
        _u_ID         = dic[@"userID"];
        _newsTile         = dic[@"newsTile"];
        _username         = dic[@"username"];
        _userpic         = dic[@"userpic"];
        _pic         = dic[@"pic"];
    }
    return self;
}



@end
