//
//  OrderModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/15.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderModel : NSObject

// 订单ID
@property (copy , nonatomic) NSString *oID;

// 标题
@property (copy , nonatomic) NSString *title;

// 内容
@property (copy , nonatomic) NSString *info;

// 参加人数
@property (copy , nonatomic) NSString *join_num;

// 图片
@property (copy , nonatomic) NSString *pf_pic;

// 金额
@property (copy , nonatomic) NSString *opaymoney;

// 待支付 行程中 待行程 行程结束 退款中 已退款
@property (copy , nonatomic) NSString *status;

// 1待支付 2待行程 3行程结束 4退款中 5已退款 6行程中 7已取消
@property (copy , nonatomic) NSString *order_type;

// 自费 请客
@property (copy , nonatomic) NSString *price_type;

// 时间
@property (copy , nonatomic) NSString *time_info;



+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
