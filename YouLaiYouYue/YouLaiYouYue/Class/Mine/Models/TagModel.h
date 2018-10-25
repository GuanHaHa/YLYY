//
//  TagModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/30.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TagModel : NSObject

@property (copy , nonatomic) NSString *lID;

@property (copy , nonatomic) NSString *lname;

@property (copy , nonatomic) NSString *luse;

+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
