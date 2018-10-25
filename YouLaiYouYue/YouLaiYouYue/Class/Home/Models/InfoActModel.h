//
//  InfoActModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/7.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InfoActModel : NSObject

// 内容
@property (copy , nonatomic) NSString *content;

// 图片加描述
@property (copy , nonatomic) NSArray *image_list;

// id
@property (copy , nonatomic) NSString *pfpID;

// title
@property (copy , nonatomic) NSString *title;

+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
