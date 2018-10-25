//
//  MyFriendModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/28.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyFriendModel : NSObject

@property (copy , nonatomic) NSString *userpic;

@property (copy , nonatomic) NSString *user_id;

@property (copy , nonatomic) NSString *username;

@property (copy , nonatomic) NSString *wy_accid;

@property (nonatomic,copy) NSString * pinyin;//拼音

@property (nonatomic , copy) NSString *u_id;

+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
