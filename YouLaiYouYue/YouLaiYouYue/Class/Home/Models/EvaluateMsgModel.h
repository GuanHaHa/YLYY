//
//  EvaluateMsgModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/29.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EvaluateMsgModel : NSObject

// 活动ID
@property (copy , nonatomic) NSString *pfID;

// 消息ID
@property (copy , nonatomic) NSString *mes_id;

// 消息标题
@property (copy , nonatomic) NSString *mes_title;

// 消息图片
@property (copy , nonatomic) NSString *mes_pic;

// 消息内容
@property (copy , nonatomic) NSString *mes_message;

+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
