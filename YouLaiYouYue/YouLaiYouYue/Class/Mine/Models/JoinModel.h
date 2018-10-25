//
//  JoinModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/9.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JoinModel : NSObject

// 队长账号 咨询领队使用 返回空字符串是没有队长
@property (copy , nonatomic) NSString *captain;

// 参加活动订单的id
@property (copy , nonatomic) NSString *ujID;

// 活动行程id
@property (copy , nonatomic) NSString *pfID;

// 活动展示图片
@property (copy , nonatomic) NSString *pfpic;

// 活动标题
@property (copy , nonatomic) NSString *pftitle;

// 活动开始时间
@property (copy , nonatomic) NSString *pfgotime;

// 活动结束时间
@property (copy , nonatomic) NSString *pfendtime;

// 费用
@property (copy , nonatomic) NSString *pfspend;

// 浏览数
@property (copy , nonatomic) NSString *pflook;

// 报名数
@property (copy , nonatomic) NSString *join_num;

// 关注数
@property (copy , nonatomic) NSString *focusOn;

// 云信id
@property (copy , nonatomic) NSString *wy_accid;

// 活动是否结束 0未结束 1已结束
@property (copy , nonatomic) NSString *is_over;

+ (instancetype)arrayWithDic:(NSDictionary *)dic;


@end
