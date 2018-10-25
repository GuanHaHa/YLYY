//
//  ActivityModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/7.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActivityModel : NSObject

// 1匿名报名 0或不传正常报名
@property (copy , nonatomic) NSString *noname;

// 判断是否实名 是否实名 0未实名 1已实名
@property (copy , nonatomic) NSString *real_name;

// 用户电话
@property (copy , nonatomic) NSString *user_tel;

// 用户姓名
@property (copy , nonatomic) NSString *truename;

// 是否关注了队长 0未关注 1已关注
@property (copy , nonatomic) NSString *attention_captain;

// 性别要求
@property (copy , nonatomic) NSString *peoplesex;

// 活动的ID
@property (copy , nonatomic) NSString *pfID;

// 是否需要在线付款 0展示，现场支付 不需要支付 1我请客，不需要支付 2线上支付
@property (copy , nonatomic) NSString *if_pay;

// 是否关注活动 0未关注 1已关注
@property (copy , nonatomic) NSString *attention;

// 活动带队队长的ID 没有队长为0
@property (copy , nonatomic) NSString *captain;

// 活动带队队长的名字 没有队长返回0
@property (copy , nonatomic) NSString *capttain_name;

// 活动带队队长的头像 没有队长返回0
@property (copy , nonatomic) NSString *capttain_pic;

// 活动带队队长等级 0-10 没有队长返回0
@property (copy , nonatomic) NSString *level;

// 活动带队队长是否签约 0未签约 1签约
@property (copy , nonatomic) NSString *if_sign;

// 活动标题
@property (copy , nonatomic) NSString *title;

// 浏览数
@property (copy , nonatomic) NSString *look;

// 关注数
@property (copy , nonatomic) NSString *pffavorite;

// 开始时间
@property (copy , nonatomic) NSString *begin_time;

// 结束时间
@property (copy , nonatomic) NSString *end_time;

// 活动城市
@property (copy , nonatomic) NSString *city;

// 人均价格
@property (copy , nonatomic) NSString *price;

// 女数量
@property (copy , nonatomic) NSString *woman;

// 男数量
@property (copy , nonatomic) NSString *man;

// 一共需要参加的人数
@property (copy , nonatomic) NSString *person_num;

// 已经报名的人数
@property (copy , nonatomic) NSString *have_num;

// 活动详情
@property (copy , nonatomic) NSString *text_info;

// 大图
@property (copy , nonatomic) NSString *show_pic;

// 活动信息
@property (copy , nonatomic) NSArray *info_list;

// 参加活动的用户列表
@property (copy , nonatomic) NSArray *user_list;

// 云信账号
@property (copy , nonatomic) NSString *wy_accid;

// 聊天室id
@property (copy , nonatomic) NSString *roomid;

// 单身要求
@property (copy , nonatomic) NSString *marry;

// 年龄要求
@property (copy , nonatomic) NSString *age;

// 活动其他要求
@property (copy , nonatomic) NSString *pfexplain;

+ (instancetype)arrayWithDic:(NSDictionary *)dic;


@end
