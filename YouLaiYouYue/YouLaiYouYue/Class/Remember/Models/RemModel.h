//
//  RemModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/10.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RemModel : NSObject


// 文章id
@property (copy , nonatomic) NSString *fmID;

// 浏览密码
@property (copy , nonatomic) NSString *accesspassword;

// 标题
@property (copy , nonatomic) NSString *fmtitle;

// 内容
@property (copy , nonatomic) NSString *fmcontent;

// 展示图片
@property (copy , nonatomic) NSString *fmpic;

// 评论数
@property (copy , nonatomic) NSString *fmcomment;

// 浏览数
@property (copy , nonatomic) NSString *fmlook;

// 发表时间
@property (copy , nonatomic) NSString *fmtime;

// 用户名
@property (copy , nonatomic) NSString *username;

// 用户头像
@property (copy , nonatomic) NSString *upicurl;

// 用户等级
@property (copy , nonatomic) NSString *usergrade;

// 是关注 0未关注 1已关注
@property (copy , nonatomic) NSString *look;
// 用户ID
@property (copy , nonatomic) NSString *uerID;
//
@property (copy , nonatomic) NSString *userphone;

+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
