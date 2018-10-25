//
//  MinePhotoModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/27.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MinePhotoModel : NSObject

@property (copy , nonatomic) NSString *utime;

@property (copy , nonatomic) NSString *upicurl;

@property (copy , nonatomic) NSString *uid;


+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
