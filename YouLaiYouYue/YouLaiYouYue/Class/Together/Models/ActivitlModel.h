//
//  ActivitlModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/9.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActivitlModel : NSObject

// 0未签约 1已签约
@property (copy , nonatomic) NSString *sign;

// 带队队长等级
@property (copy , nonatomic) NSString *usergrade;

// 带队队长昵称
@property (copy , nonatomic) NSString *username;

// 活动的ID
@property (copy , nonatomic) NSString *pfID;

// 带队队长的id
@property (copy , nonatomic) NSString *captain;

// 活动需要多少人参加
@property (copy , nonatomic) NSString *pfpeople;

// 已经报名多少人
@property (copy , nonatomic) NSString *have_num;

// 活动标题
@property (copy , nonatomic) NSString *pftitle;

// 活动内容
@property (copy , nonatomic) NSString *pfcontent;

// 活动展示图片
@property (copy , nonatomic) NSString *pfpic;

// 带队队长头像
@property (copy , nonatomic) NSString *upicurl;

// 所有参与活动的用户头像 数组
@property (copy , nonatomic) NSArray *all_u_pic;

// 是否关注了活动 0未关注 1已关注
@property (copy , nonatomic) NSString *focusOn;

// 云信id
@property (copy , nonatomic) NSString *wy_accid;

// 是否关注队长 0未关注队长 1已关注队长
@property (copy , nonatomic) NSString *captain_focusOn;

// 开始时间
@property (copy , nonatomic) NSString *pfgotime;

// 访问密码
@property (copy , nonatomic) NSString *pfpwd;

+ (instancetype)arrayWithDic:(NSDictionary *)dic;




@end
