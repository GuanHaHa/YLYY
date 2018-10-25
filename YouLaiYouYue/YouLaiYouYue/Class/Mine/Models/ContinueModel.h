//
//  ContinueModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/11.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContinueModel : NSObject

// 标题ID
@property (copy , nonatomic) NSString *continueId;

// 标题
@property (copy , nonatomic) NSString *pfptitle;

// 内容
@property (copy , nonatomic) NSString *pfpcontent;

@property (strong , nonatomic) NSMutableArray *img_list;



+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
