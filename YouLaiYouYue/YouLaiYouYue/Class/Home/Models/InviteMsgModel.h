//
//  InviteMsgModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/29.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InviteMsgModel : NSObject

// 数据ID
@property (copy , nonatomic) NSString *pfID;

// 活动ID
@property (copy , nonatomic) NSString *tid;

// 0为请客 1为自费
@property (copy , nonatomic) NSString *type;

// 活动标题
@property (copy , nonatomic) NSString *pftitle;

// 活动详情
@property (copy , nonatomic) NSString *pfcontent;

// 活动图片
@property (copy , nonatomic) NSString *pfpic;

+ (instancetype)arrayWithDic:(NSDictionary *)dic;


@end
