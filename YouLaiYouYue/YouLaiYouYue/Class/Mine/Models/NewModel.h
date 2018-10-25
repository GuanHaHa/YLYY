//
//  NewModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/30.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewModel : NSObject

// 标题
@property (copy , nonatomic) NSString *title;
// 内容
@property (copy , nonatomic) NSString *content;
// 首图
@property (copy , nonatomic) NSData *img;
// 活动标题
@property (copy , nonatomic) NSString *activityTitle;
// 活动ID
@property (copy , nonatomic) NSString *activityTitleId;
// 开始时间
@property (copy , nonatomic) NSString *startTime;
// 结束时间
@property (copy , nonatomic) NSString *endTime;
// 活动地点
@property (copy , nonatomic) NSString *site;
// 人均费用
@property (copy , nonatomic) NSString *cost;
// 标签
@property (copy , nonatomic) NSString *tag;
// 标签ID
@property (copy , nonatomic) NSString *tagId;
// 浏览加密
@property (copy , nonatomic) NSString *password;
// 友记id
@property (copy , nonatomic) NSString *actId;

// 是否允许队友插文
@property (copy , nonatomic) NSString *insertatext;


@end
