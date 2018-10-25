//
//  OrderDetailsModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/20.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderDetailsModel : NSObject

// 活动标题
@property (copy , nonatomic) NSString *title;

// 活动内容
@property (copy , nonatomic) NSString *content;

// 活动图片
@property (copy , nonatomic) NSString *picture;

// 活动行程时间
@property (copy , nonatomic) NSString *time;

// 参加人数
@property (copy , nonatomic) NSString *go_num;

// 金额
@property (copy , nonatomic) NSString *price;

// 订单号
@property (copy , nonatomic) NSString *order_sn;

// 支付宝或微信单号
@property (copy , nonatomic) NSString *paycode;

// 创建时间
@property (copy , nonatomic) NSString *create_time;


// 支付时间
@property (copy , nonatomic) NSString *pay_time;

// 成交时间
@property (copy , nonatomic) NSString *over_time;

// 支付类型 0微信 1支付宝
@property (copy , nonatomic) NSString *pay_type;

// 待支付 行程中 待行程 行程结束 退款中 已退款
@property (copy , nonatomic) NSString *status;

// 1待支付 2待行程 3行程结束 4退款中 5已退款 6行程中 7已取消
@property (copy , nonatomic) NSString *order_type;

@property (copy , nonatomic) NSString *price_type;


+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
