//
//  MyRemModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/9.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyRemModel : NSObject

// 标题
@property (copy , nonatomic) NSString *fmtitle;

// 文章图片
@property (copy , nonatomic) NSString *fmpic;

// 文章ID
@property (copy , nonatomic) NSString *fmID;

// 开始时间
@property (copy , nonatomic) NSString *fmgotime;

// 结束时间
@property (copy , nonatomic) NSString *fmendtime;

// 人均费用
@property (copy , nonatomic) NSString *percapitacost;

// 浏览次数
@property (copy , nonatomic) NSString *fmlook;

// 收藏数
@property (copy , nonatomic) NSString *fmfavorite;

// 发布时间
@property (copy , nonatomic) NSString *fmtime;

+ (instancetype)arrayWithDic:(NSDictionary *)dic;


@end
