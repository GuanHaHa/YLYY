//
//  SignModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/7.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SignModel : NSObject

// 报名人数
@property (copy , nonatomic) NSString *num;

// 名字
@property (copy , nonatomic) NSString *username;

// 头像
@property (copy , nonatomic) NSString *userpic;

// 是否匿名 0否 1是
@property (copy , nonatomic) NSString *noname;

@property (copy , nonatomic) NSString *u_ID;



+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
