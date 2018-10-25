//
//  TitleModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/29.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TitleModel : NSObject

// 活动标题
@property (copy , nonatomic) NSString *pftitle;
// 活动ID
@property (copy , nonatomic) NSString *pfID;
// 0为不显示 1为显示
@property (copy , nonatomic) NSString *block;

+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
