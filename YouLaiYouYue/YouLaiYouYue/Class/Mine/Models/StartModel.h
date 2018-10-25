//
//  StartModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/8.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StartModel : NSObject

// 审核状态 0草稿 1未审核 2通过 3不通过
@property (copy , nonatomic) NSString *pfexamine;

// 活动行程id
@property (copy , nonatomic) NSString *pfID;

// 活动展示图片
@property (copy , nonatomic) NSString *pfpic;

// 活动标题
@property (copy , nonatomic) NSString *pftitle;

// 活动开始时间
@property (copy , nonatomic) NSString *pfgotime;

// 活动结束时间
@property (copy , nonatomic) NSString *pfendtime;

// 费用
@property (copy , nonatomic) NSString *pfspend;

// 浏览数
@property (copy , nonatomic) NSString *pflook;

// 报名数
@property (copy , nonatomic) NSString *join_num;

// 关注数
@property (copy , nonatomic) NSString *focusOn;

// 0未结束 1已结束
@property (copy , nonatomic) NSString *if_over;

+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
