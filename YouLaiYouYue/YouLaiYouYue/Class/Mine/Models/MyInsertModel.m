//
//  MyInsertModel.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/11.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "MyInsertModel.h"

@implementation MyInsertModel

+ (instancetype)arrayWithDic:(NSDictionary *)dic{
    return [[self alloc] initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic{
    if (self = [super init]) {
        
        _ffpID            = dic[@"ffpID"];
        _ffptitle         = dic[@"ffptitle"];
        _ffpurl           = dic[@"ffpurl"];
        _ffptime          = dic[@"ffptime"];
        _position         = dic[@"position"];
        _state            = dic[@"state"];
        _reason           = dic[@"reason"];
        _activity_name    = dic[@"activity_name"];
        
        
    }
    return self;
}
@end
