//
//  EditActModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/10.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EditActModel : NSObject

// 城市ID
@property (copy , nonatomic) NSString *city;

// 城市名
@property (copy , nonatomic) NSString *city_name;

// 浏览数
@property (copy , nonatomic) NSString *look_num;

// 最多参加人数
@property (copy , nonatomic) NSString *max_num;

// 最少参加人数
@property (copy , nonatomic) NSString *min_num;

// 开始年龄
@property (copy , nonatomic) NSString *pfagebegin;

// 结束年龄
@property (copy , nonatomic) NSString *pfageend;

// 内容
@property (copy , nonatomic) NSString *pfcontent;

// 结束时间
@property (copy , nonatomic) NSString *pfendtime;

// 活动其他要求说明
@property (copy , nonatomic) NSString *pfexplain;

// 关注数
@property (copy , nonatomic) NSString *pffavorite;

// 开始时间
@property (copy , nonatomic) NSString *pfgotime;

// 是否单身（0否 1是）
@property (copy , nonatomic) NSString *pfmarry;

// 0无要求 1男 2女 3男女比例
@property (copy , nonatomic) NSString *pfpeoplesex;

// 活动首图
@property (copy , nonatomic) NSString *pfpic;

// 活动密码
@property (copy , nonatomic) NSString *pfpwd;

// 具体费用
@property (copy , nonatomic) NSString *pfspend;

// 费用说明
@property (copy , nonatomic) NSString *pfspendexplain;

// 费用类型（0展示 1我请客 2线上支付)
@property (copy , nonatomic) NSString *pfspendtype;

// 活动标题
@property (copy , nonatomic) NSString *pftitle;

// 活动要求、注意事项
@property (copy , nonatomic) NSString *pfwarning;

@property (copy , nonatomic) NSString *user_join;

// 标题、内容列表
@property (copy , nonatomic) NSArray *title_list;

// 标签name
@property (copy , nonatomic) NSString *lable_name;
// 标签id
@property (copy , nonatomic) NSString *pflable;


+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
