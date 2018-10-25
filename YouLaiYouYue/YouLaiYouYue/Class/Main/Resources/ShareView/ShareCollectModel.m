


//
//  ShareCollectModel.m
//  XueTuoBang
//
//  Created by mac on 2017/7/14.
//  Copyright © 2017年 com.hongdingnet.guan. All rights reserved.
//

#import "ShareCollectModel.h"
@implementation ShareCollectModel
+(void)getCollect:(NSString *)articleId
{
    NSString *url = [NSString stringWithFormat:@"%@/api/article/collectionArticle.do",baseUrl];
    NSDictionary *dic = @{
                          @"articleId" : articleId
                          };
    
//    [Utils zyUtilsGetDataToServer:url parameters:dic isEncrypt:NO swpResultSuccess:^(NSDictionary * _Nonnull resultObject) {
//
//        if ([resultObject[@"retcode"] integerValue] == 0) {
//
//              [LCProgressHUD showSuccess:@"收藏成功"];
//        }
//
//    } swpResultError:^(NSDictionary * _Nonnull resultObject, NSString * _Nonnull errorMessage) {
//        NSLog(@"%@",errorMessage);
//    }];

}

+ (void)cancelCollect:(NSString *)articleId
{
    NSString *url = [NSString stringWithFormat:@"%@/api/article/cancelCollectionArticle.do",baseUrl];
    NSDictionary *dic = @{
                          @"articleId" : articleId
                          };
    

}


+ (void)shareTextToPlatformType:(NSInteger)i{
    
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //设置文本
    //    messageObject.text = @"社会化组件UShare将各大社交平台接入您的应用，快速武装App。";
    //创建网页内容对象
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"中国雪托帮" descr:@"里面有很多精彩的内容欢迎下载吧！" thumImage:[UIImage imageNamed:@"shareImage"]];
    //设置网页地址
    shareObject.webpageUrl = @"https://shisanwu.kuaizhan.com/13/71/p456498789380a3";
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    if (i == 1){
        
        
        [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_WechatSession messageObject:messageObject currentViewController:nil completion:^(id data, NSError *error) {
            if (error) {
                NSLog(@"************Share fail with error %@*********",error);
            }else{
                NSLog(@"response data is %@",data);
                [LCProgressHUD showMessage:@"分享成功"];
            }
        }];
    }
    else if (i == 0){
        [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_WechatTimeLine messageObject:messageObject currentViewController:nil completion:^(id data, NSError *error) {
            if (error) {
                NSLog(@"************Share fail with error %@*********",error);
            }else{
                NSLog(@"response data is %@",data);
                [LCProgressHUD showMessage:@"分享成功"];
            }
        }];
    }else if (i == 2) {
        
        [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_Sina messageObject:messageObject currentViewController:nil completion:^(id data, NSError *error) {
            if (error) {
                NSLog(@"************Share fail with error %@*********",error);
            }else{
                NSLog(@"response data is %@",data);
                [LCProgressHUD showMessage:@"分享成功"];
            }
        }];
    }
}

+ (void)shareTextToPlatformType:(NSInteger)i withDataDic:(NSDictionary *)dic {
    UIImage *image = [[UIImage alloc]init];
    NSString *urlKey = [[SDWebImageManager sharedManager] cacheKeyForURL:[NSURL URLWithString:dic[@"images"]]];
    image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:urlKey];
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //设置文本
    //创建网页内容对象
    
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:dic[@"title"] descr:dic[@"desc"] thumImage:image];
    shareObject.webpageUrl = dic[@"url"];
    messageObject.shareObject = shareObject;
    
    if (i == 1){
        
        [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_WechatSession messageObject:messageObject currentViewController:nil completion:^(id data, NSError *error) {
            if (error) {
                NSLog(@"************Share fail with error %@*********",error);
            }else{
                NSLog(@"response data is %@",data);
//                [LCProgressHUD showMessage:@"分享成功"];
            }
        }];
    }
    else if (i == 0){
        [[UMSocialManager defaultManager] shareToPlatform:UMSocialPlatformType_WechatTimeLine messageObject:messageObject currentViewController:nil completion:^(id data, NSError *error) {
            if (error) {
                NSLog(@"************Share fail with error %@*********",error);
            }else{
                NSLog(@"response data is %@",data);
//                [LCProgressHUD showMessage:@"分享成功"];
            }
        }];
    }
}


@end
