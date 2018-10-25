//
//  BlackModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/9/6.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlackModel : NSObject

// 头像
@property (copy , nonatomic) NSString *userpic;

// name
@property (copy , nonatomic) NSString *username;

// id
@property (copy , nonatomic) NSString *user_id;




+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
