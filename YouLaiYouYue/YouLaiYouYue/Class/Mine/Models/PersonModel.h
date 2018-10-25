//
//  PersonModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/25.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonModel : NSObject

// 用户头像
@property (copy , nonatomic) NSString *headeimg;

// 用户昵称
@property (copy , nonatomic) NSString *username;

// 性别
@property (copy , nonatomic) NSString *sex;

// 用户地址
@property (copy , nonatomic) NSString *useraddress;

// 个人签名
@property (copy , nonatomic) NSString *userautograph;

// 生日
@property (copy , nonatomic) NSString *userbirthday;

// 注册时间
@property (copy , nonatomic) NSString *usertime;

// 是否实名认证
@property (copy , nonatomic) NSString *usercodeok;

// 是否已婚
@property (copy , nonatomic) NSString *usermarry;

// 用户等级
@property (copy , nonatomic) NSString *usergrade;

// 签约领队  0未签约   1签约
@property (copy , nonatomic) NSString *sign;

// vip 0不是
@property (copy , nonatomic) NSString *vip;


+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
