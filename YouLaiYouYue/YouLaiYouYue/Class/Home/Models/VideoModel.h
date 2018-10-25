//
//  VideoModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/6.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VideoModel : NSObject

@property (copy , nonatomic) NSString *img;

@property (copy , nonatomic) NSString *vname;

@property (copy , nonatomic) NSString *vurl;

@property (copy , nonatomic) NSString *look_num;

@property (copy , nonatomic) NSString *vID;





+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
