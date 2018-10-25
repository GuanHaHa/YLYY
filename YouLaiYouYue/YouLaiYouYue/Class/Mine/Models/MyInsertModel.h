//
//  MyInsertModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/11.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyInsertModel : NSObject

// 插文ID
@property (copy , nonatomic) NSString *ffpID;

// 插文标题
@property (copy , nonatomic) NSString *ffptitle;

// 图片地址
@property (copy , nonatomic) NSString *ffpurl;

// 最后一次修改时间
@property (copy , nonatomic) NSString *ffptime;

// 插文位置信息
@property (copy , nonatomic) NSString *position;

// 插文状态
@property (copy , nonatomic) NSString *state;

// 当 插文为屏蔽状态时 才有数据
@property (copy , nonatomic) NSString *reason;

// 所属活动
@property (copy , nonatomic) NSString *activity_name;



+ (instancetype)arrayWithDic:(NSDictionary *)dic;


@end
