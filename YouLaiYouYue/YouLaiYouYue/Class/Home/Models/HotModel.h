//
//  HotModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/28.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HotModel : NSObject

// 消息ID
@property (copy , nonatomic) NSString *mes_id;

// 消息标题
@property (copy , nonatomic) NSString *mes_title;

// 消息内容
@property (copy , nonatomic) NSString *mes_message;

// 消息图片
@property (copy , nonatomic) NSString *mes_pic;

// 时间
@property (copy , nonatomic) NSString *mes_time;

+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
