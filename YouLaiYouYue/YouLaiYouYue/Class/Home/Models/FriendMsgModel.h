//
//  FriendMsgModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/30.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendMsgModel : NSObject


@property (copy , nonatomic) NSString *fID;

@property (copy , nonatomic) NSString *describe;


@property (copy , nonatomic) NSString *ftime;


@property (copy , nonatomic) NSString *fuserID;


@property (copy , nonatomic) NSString *pic;


@property (copy , nonatomic) NSString *radio;


@property (copy , nonatomic) NSString *title;

@property (copy , nonatomic) NSString *userfID;

+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
