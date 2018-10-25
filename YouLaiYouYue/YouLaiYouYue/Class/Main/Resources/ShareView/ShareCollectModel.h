//
//  ShareCollectModel.h
//  XueTuoBang
//
//  Created by mac on 2017/7/14.
//  Copyright © 2017年 com.hongdingnet.guan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UMSocialCore/UMSocialCore.h>

@interface ShareCollectModel : NSObject
+ (void)getCollect:(NSString *)articleId;

+ (void)cancelCollect:(NSString *)articleId;

+ (void)shareTextToPlatformType:(NSInteger)i;

+ (void)shareTextToPlatformType:(NSInteger)i withDataDic:(NSDictionary *)dic;


@end
