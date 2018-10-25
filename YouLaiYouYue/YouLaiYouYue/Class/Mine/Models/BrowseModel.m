//
//  BrowseModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/10.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "BrowseModel.h"

@implementation BrowseModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _browseId = dic[@"id"];
        _pic_url    = dic[@"pic_url"];
        _title = [NSString stringWithFormat:@"%@",dic[@"title"]];
        _look_time = dic[@"look_time"];
        _look_id = dic[@"look_id"];
        _type = dic[@"type"];
    }
    return self;
}



@end
