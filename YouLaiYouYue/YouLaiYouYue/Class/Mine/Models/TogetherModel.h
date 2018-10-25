//
//  TogetherModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/2.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TogetherModel : NSObject

// 标题
@property (copy , nonatomic) NSString *title;
// 内容
@property (copy , nonatomic) NSString *content;
// 首图
@property (copy , nonatomic) NSData *img;
// 开始时间
@property (copy , nonatomic) NSString *startTime;
// 结束时间
@property (copy , nonatomic) NSString *endTime;
// 活动地点
@property (copy , nonatomic) NSString *site;
// 城市id
@property (copy , nonatomic) NSString *siteId;
// 人均费用
@property (copy , nonatomic) NSString *cost;
// 费用类型 费用类型 0 展示 1我请客 2 线上支付
@property (copy , nonatomic) NSString *price_type;
// 费用说明  不是必传
@property (copy , nonatomic) NSString *price_info;
// 最小参加人数
@property (copy , nonatomic) NSString *min_num;
// 最大参加人数
@property (copy , nonatomic) NSString *max_num;
// 男女比例 男女比例 0 无要求 1男 2女 3比例均等
@property (copy , nonatomic) NSString *peoplesex;
// 开始年龄
@property (copy , nonatomic) NSString *age_begin;
// 结束年龄
@property (copy , nonatomic) NSString *age_end;
// 单身限制 单身限制 0不限制 1单身可参加
@property (copy , nonatomic) NSString *marry;
// 其他要求 不是必传
@property (copy , nonatomic) NSString *follow_info;
// 活动要求 不是必传
@property (copy , nonatomic) NSString *warning;
// 活动密码 不是必传
@property (copy , nonatomic) NSString *follow_pass;
// 用户id
@property (copy , nonatomic) NSString *user_id;

@property (copy , nonatomic) NSString *tagStr;

@property (copy , nonatomic) NSString *tagID;


@end
