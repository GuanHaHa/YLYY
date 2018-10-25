//
//  BaseViewController+Net.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/25.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "BaseViewController+Net.h"
#import "SwpRequest.h"
@implementation BaseViewController (Net)

/*!
 *  @author swp_song
 *
 *  @brief  swpPublicTooGetDataToServer ( 从服务器 获取 网络 数据 )
 *
 *  @param  URLString                   url
 *
 *  @param  parameter                   参数
 *
 *  @param  encrypt                     是否加密
 *
 *  @param  swpResultSuccess            返回成功    200
 *
 *  @param  swpResultError              返回失败    400
 */
- (void)swpPublicTooGetDataToServer:(NSString *)URLString parameters:(NSDictionary *)parameter isEncrypt:(BOOL)encrypt swpResultSuccess:(SwpResultSuccess)swpResultSuccess swpResultError:(SwpResultError)swpResultError {
    
    [SwpRequest swpPOST:URLString parameters:parameter isEncrypt:encrypt swpResultSuccess:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull resultObject) {
        if (resultObject == nil) {

            return;
        }
        if (self.swpNetwork.swpNetworkCodeSuccess == [resultObject[self.swpNetwork.swpNetworkCode] intValue]) {
            swpResultSuccess(resultObject);
        } else {
            swpResultError(resultObject, resultObject[self.swpNetwork.swpNetworkMessage]);
        }
    } swpResultError:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error, NSString * _Nonnull errorMessage) {
        
    }];
}







@end
