//
//  HeadlineModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/30.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeadlineModel : NSObject

@property (copy , nonatomic) NSString *pfID;

@property (copy , nonatomic) NSString *pftitle;


+ (instancetype)arrayWithDic:(NSDictionary *)dic;
@end
