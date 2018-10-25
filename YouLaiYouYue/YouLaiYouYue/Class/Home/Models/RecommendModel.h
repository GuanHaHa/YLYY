//
//  RecommendModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/18.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecommendModel : NSObject


@property (copy , nonatomic) NSString *type;

@property (copy , nonatomic) NSString *userphone;

// 0为未关注1为已关注
@property (copy , nonatomic) NSString *follow;

// 是否是热门 0否 1是
@property (copy , nonatomic) NSString *fmhot;

// 文章id
@property (copy , nonatomic) NSString *fmID;

// 用户头像 无头像返回空格
@property (copy , nonatomic) NSString *upicurl;

// 文章标题
@property (copy , nonatomic) NSString *fmtitle;

// 文章内容
@property (copy , nonatomic) NSString *fmcontent;

// 文章展示图片 无返回空格
@property (copy , nonatomic) NSString *fmpic;

// 发布时间
@property (copy , nonatomic) NSString *fmtime;

// 浏览数
@property (copy , nonatomic) NSString *fmlook;

// 用户名
@property (copy , nonatomic) NSString *username;

// 评论数
@property (copy , nonatomic) NSString *fmcomment;
// 用户等级
@property (copy , nonatomic) NSString *usergrade;
// 用户id
@property (copy , nonatomic) NSString *useID;

// 查看密码
@property (copy , nonatomic) NSString *accesspassword;


+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
