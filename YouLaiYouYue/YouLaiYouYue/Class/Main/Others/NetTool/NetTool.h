//
//  NetTool.h
//  HongDingShop
//
//  Created by mac on 2017/11/16.
//  Copyright © 2017年 com.hongdingnet.www. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
//请求成功回调block
typedef void (^requestSuccessBlock)(NSDictionary *resultObject);

//请求失败回调block
typedef void (^requestFailureBlock)(NSError *error);

//请求方法define
typedef enum {
    GET,
    POST,
} HTTPMethod;
@interface NetTool : AFHTTPSessionManager
+ (instancetype)sharedManager;
- (void)requestWithMethod:(HTTPMethod)method
                 WithPath:(NSString *)path
               WithParams:(NSDictionary*)params
         WithSuccessBlock:(requestSuccessBlock)success
          WithFailurBlock:(requestFailureBlock)failure;
@end
