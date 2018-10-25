//
//  InfoActModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/7.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "InfoActModel.h"

@implementation InfoActModel


+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _content         = dic[@"content"];
        _image_list    = dic[@"image_list"];
        _pfpID    = dic[@"pfpID"];
        _title     = dic[@"title"];
    }
    return self;
}


@end
