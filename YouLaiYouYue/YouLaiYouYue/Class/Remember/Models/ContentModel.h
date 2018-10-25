//
//  ContentModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/6.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContentModel : NSObject

// 文章ID
@property (copy , nonatomic) NSString *fmID;

// 文章标题
@property (copy , nonatomic) NSString *fmtitle;

// 文章收藏数量
@property (copy , nonatomic) NSString *fmfavorite;

// 浏览次数
@property (copy , nonatomic) NSString *fmlook;

// 人均费用
@property (copy , nonatomic) NSString *percapitacost;

// 封面图片
@property (copy , nonatomic) NSString *fmpic;

// 开始时间
@property (copy , nonatomic) NSString *fmgotime;

// 结束时间
@property (copy , nonatomic) NSString *fmendtime;

// 地址
@property (copy , nonatomic) NSString *fmaddress;

// 作者头像
@property (copy , nonatomic) NSString *userpic;

// 作者昵称
@property (copy , nonatomic) NSString *username;

// 作者等级
@property (copy , nonatomic) NSString *usergrade;

// 是否关注该用户0为未关注1为已关注
@property (copy , nonatomic) NSString *follow;

// 当前用户是否对此文章点赞操作0为未点赞1为已点赞
@property (copy , nonatomic) NSString *give;

// 是否收藏
@property (copy , nonatomic) NSString *Collection;

@property (copy , nonatomic) NSString *uid;

// 1为可以插文0为不可以
@property (copy , nonatomic) NSString *inserTtext;

+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
