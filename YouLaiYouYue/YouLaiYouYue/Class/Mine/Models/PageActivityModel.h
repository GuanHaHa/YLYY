//
//  PageActivityModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/17.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PageActivityModel : NSObject

// 活动ID
@property (copy , nonatomic) NSString *pfID;

// 活动标题
@property (copy , nonatomic) NSString *pftitle;

// 浏览量
@property (copy , nonatomic) NSString *pflook;

// 评论量
@property (copy , nonatomic) NSString *pfcomment;

// 收藏量
@property (copy , nonatomic) NSString *pffavorite;

// 活动图片
@property (copy , nonatomic) NSString *pfpic;


+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
