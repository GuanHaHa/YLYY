//
//  ActivityInfoModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/6.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActivityInfoModel : NSObject

// 活动详情
@property (copy , nonatomic) NSString *pfcontent;

// 发布时间
@property (copy , nonatomic) NSString *pftime;

// 浏览次数(活动)
@property (copy , nonatomic) NSString *pflook;

// 活动评论数量
@property (copy , nonatomic) NSString *pfcomment;

// 活动首图
@property (copy , nonatomic) NSString *pfpic;

// 活动id
@property (copy , nonatomic) NSString *pfID;

@property (copy , nonatomic) NSString *pftitle;



+ (instancetype)arrayWithDic:(NSDictionary *)dic;


@end
