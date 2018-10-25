//
//  CommentModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/16.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentModel : NSObject


// 评论内容
@property (copy , nonatomic) NSString *fctitle;

// 评论数据ID
@property (copy , nonatomic) NSString *fcID;

// 文章ID
@property (copy , nonatomic) NSString *fmID;

// 发布时间
@property (copy , nonatomic) NSString *fctime;

// 用户ID
@property (copy , nonatomic) NSString *u_ID;

// 文章标题
@property (copy , nonatomic) NSString *newsTile;

// 用户昵称
@property (copy , nonatomic) NSString *username;

// 用户头像
@property (copy , nonatomic) NSString *userpic;

// 回复评论数组
@property (copy , nonatomic) NSArray *pic;




+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
