//
//  SearchModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/21.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchModel : NSObject


@property (copy , nonatomic) NSString *searchId;


@property (copy , nonatomic) NSString *title;


@property (copy , nonatomic) NSString *type;

+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
