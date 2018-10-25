//
//  PolyModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/18.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PolyModel : NSObject

// 带队人的id 返回0则没有带队人
@property (copy , nonatomic) NSString *captain;

// 活动ID
@property (copy , nonatomic) NSString *pfID;

// 内容
@property (copy , nonatomic) NSString *pfcontent;

// 活动图片
@property (copy , nonatomic) NSString *pfpic;

// 标题
@property (copy , nonatomic) NSString *pftitle;

// 带队人的头像
@property (copy , nonatomic) NSString *upicurl;

// 用户等级
@property (copy , nonatomic) NSString *usergrade;

// 用户名
@property (copy , nonatomic) NSString *username;

// 开始时间
@property (copy , nonatomic) NSString *pfgotime;

// 关注数
@property (copy , nonatomic) NSString *look_num;

// 评论数
@property (copy , nonatomic) NSString *comment_num;

// 发布时间
@property (copy , nonatomic) NSString *pftime;

// 是否签约领队
@property (copy , nonatomic) NSString *sign;

// 是否关注 0为未关注 1为已关注
@property (copy , nonatomic) NSString *follow;

// 密码
@property (copy , nonatomic) NSString *pfpwd;



+ (instancetype)arrayWithDic:(NSDictionary *)dic;


@end
