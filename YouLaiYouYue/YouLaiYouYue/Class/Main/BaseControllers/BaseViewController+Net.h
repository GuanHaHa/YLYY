//
//  BaseViewController+Net.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/25.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

/*! SwpResultSuccess 访问服务器返回成功 Block !*/
typedef void(^SwpResultSuccess)(id resultObject);
/*! SwpResultError   访问服务器返回失败 Block !*/
typedef void(^SwpResultError)(id resultObject, NSString *errorMessage);

@interface UIViewController (Net)

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
- (void)swpPublicTooGetDataToServer:(NSString *)URLString parameters:(NSDictionary *)parameter isEncrypt:(BOOL)encrypt swpResultSuccess:(SwpResultSuccess)swpResultSuccess swpResultError:(SwpResultError)swpResultError;



/*!
 *  @author swp_song, 2016-01-05 22:31:06
 *
 *  @brief  swpPOSTAddFile                  ( 请求网络获上传文件 单文件上传 <POST> )
 *
 *  @param  URLString                       请求的 url
 *
 *  @param  parameters                      请求 需要传递的参数
 *
 *  @param  encrypt                         请求 是否 对参数加密 (YES 加密 / NO 不加密)
 *
 *  @param  fileName                        请求 上传文件的名称 (和后台一致)
 *
 *  @param  fileData                        请求 上传文件的数据流
 *
 *  @param  swpResultSuccess                请求获取数据成功
 *
 *  @param  swpResultError                  请求获取数据失败
 *
 *  @since  1.0.8
 */
+ (void)swpPOSTAddFile:(NSString *)URLString parameters:(NSDictionary *)parameters isEncrypt:(BOOL)encrypt fileName:(NSString *)fileName fileData:(NSData *)fileData swpResultSuccess:(SwpResultSuccess)swpResultSuccess swpResultError:(SwpResultError)swpResultError;


@end
NS_ASSUME_NONNULL_END
