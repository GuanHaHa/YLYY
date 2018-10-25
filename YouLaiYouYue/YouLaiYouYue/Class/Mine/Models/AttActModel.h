//
//  AttActModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/9/5.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AttActModel : NSObject
// 活动ID
@property (copy , nonatomic) NSString *pfID;

// 标题
@property (copy , nonatomic) NSString *pftitle;

// 图片
@property (copy , nonatomic) NSString *pfpic;

// 开始时间
@property (copy , nonatomic) NSString *pfgotime;

// 密码
@property (copy , nonatomic) NSString *pfpwd;


+ (instancetype)arrayWithDic:(NSDictionary *)dic;
@end
