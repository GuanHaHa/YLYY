//
//  CollectModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/8.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CollectModel : NSObject

// 收藏ID
@property (copy , nonatomic) NSString *fID;

// 收藏标题
@property (copy , nonatomic) NSString *ftitle;

// 收藏图片
@property (copy , nonatomic) NSString *fpic;

// 收藏时间
@property (copy , nonatomic) NSString *ftime;

// 1是友聚 2是友记
@property (copy , nonatomic) NSString *ftype;

// 文章id
@property (copy , nonatomic) NSString *ftableid;


+ (instancetype)arrayWithDic:(NSDictionary *)dic;


@end
