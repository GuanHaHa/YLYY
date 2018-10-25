//
//  BannerModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/31.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BannerModel : NSObject


@property (copy , nonatomic) NSString *type;

// 幻灯标题
@property (copy , nonatomic) NSString *title;

// 关联文章ID
@property (copy , nonatomic) NSString *leftid;

// 图片地址
@property (copy , nonatomic) NSString *pic;

// 0首页轮播图是友聚 1首页轮播图是文章
@property (copy , nonatomic) NSString *first_type;


+ (instancetype)arrayWithDic:(NSDictionary *)dic;
@end
