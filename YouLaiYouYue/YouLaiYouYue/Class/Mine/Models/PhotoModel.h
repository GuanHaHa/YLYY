//
//  PhotoModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/23.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoModel : NSObject

@property (copy , nonatomic) NSString *pfpurl;

@property (copy , nonatomic) NSString *pfpcontent;

@property (copy , nonatomic) NSString *pfpID;

+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
