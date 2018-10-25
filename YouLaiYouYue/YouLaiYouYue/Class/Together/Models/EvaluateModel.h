//
//  EvaluateModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/20.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EvaluateModel : NSObject

// 是否显示回复 0不显示 1显示
@property (copy , nonatomic) NSString *reply;

// 活动ID
@property (copy , nonatomic) NSString *pfID;

// 活动图片
@property (copy , nonatomic) NSString *pic;

// 活动标题
@property (copy , nonatomic) NSString *title;

// 活动时间
@property (copy , nonatomic) NSString *time;

// 评论列表
@property (copy , nonatomic) NSArray *list;


+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
