//
//  InsertModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/9.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InsertModel : NSObject

// 插文ID
@property (copy , nonatomic) NSString *ffpID;

// 插文描述
@property (copy , nonatomic) NSString *ffptitle;

// 插文图片
@property (copy , nonatomic) NSString *ffpurl;

// 发布时间
@property (copy , nonatomic) NSString *ffptime;

// 用户ID
@property (copy , nonatomic) NSString *u_ID;

// 插文状态(待审核,未通过,允许展示)
@property (copy , nonatomic) NSString *radio;

// 只有在屏蔽状态下该字段才有信息
@property (copy , nonatomic) NSString *reason;

// 作者昵称
@property (copy , nonatomic) NSString *username;

// 作者头像
@property (copy , nonatomic) NSString *userpic;

+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
