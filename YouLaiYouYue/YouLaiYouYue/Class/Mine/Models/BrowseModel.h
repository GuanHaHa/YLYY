//
//  BrowseModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/10.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BrowseModel : NSObject

// 数据id
@property (copy , nonatomic) NSString *browseId;

// 图片
@property (copy , nonatomic) NSString *pic_url;

// 标题
@property (copy , nonatomic) NSString *title;

// 发布时间
@property (copy , nonatomic) NSString *look_time;

// 0 友聚  1 友记
@property (copy , nonatomic) NSString *type;

@property (copy , nonatomic) NSString *look_id;



+ (instancetype)arrayWithDic:(NSDictionary *)dic;


@end
