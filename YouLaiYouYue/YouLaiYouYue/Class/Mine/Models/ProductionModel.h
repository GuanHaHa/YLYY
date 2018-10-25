//
//  ProductionModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/17.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductionModel : NSObject

// 文章ID
@property (copy , nonatomic) NSString *fmID;

// 文章标题
@property (copy , nonatomic) NSString *fmtitle;

// 浏览量
@property (copy , nonatomic) NSString *fmlook;

// 点赞数
@property (copy , nonatomic) NSString *fmgood;

// 评论量
@property (copy , nonatomic) NSString *fmcomment;

// 收藏量
@property (copy , nonatomic) NSString *fmfavorite;

// 文章图片
@property (copy , nonatomic) NSString *fmpic;


+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
