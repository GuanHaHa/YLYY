//
//  AttentionModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/7.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AttentionModel : NSObject

// 活动的ID 未参加活动 返回0
@property (copy , nonatomic) NSString *activity_id;

// 文章数
@property (copy , nonatomic) NSString *article_num;

//
@property (copy , nonatomic) NSString *lID;

// 粉丝数
@property (copy , nonatomic) NSString *like_num;

// 被关注人的ID
@property (copy , nonatomic) NSString *likeuserID;

// 参加活动的状态 0已结束 1进行中
@property (copy , nonatomic) NSString *status;

// 头像
@property (copy , nonatomic) NSString *upicurl;

// 被关注人的昵称
@property (copy , nonatomic) NSString *username;

//
@property (copy , nonatomic) NSString *userphone;

// 性别 0为男1为女
@property (copy , nonatomic) NSString *usersex;

+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
