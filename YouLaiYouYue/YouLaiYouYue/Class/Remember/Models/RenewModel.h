//
//  RenewModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/6.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RenewModel : NSObject

// 续写ID
@property (copy , nonatomic) NSString *ffID;

// 续写标题
@property (copy , nonatomic) NSString *fftitle;

// 续写内容
@property (copy , nonatomic) NSString *ffcontect;

// 续写用户ID
@property (copy , nonatomic) NSString *uID;

// 时间
@property (copy , nonatomic) NSString *fftime;

// 0是续写  1是队友插文
@property (copy , nonatomic) NSString *type;

// 名字
@property (copy , nonatomic) NSString *username;

// 头像
@property (copy , nonatomic) NSString *userpic;

// 0未关注  1已关注
@property (copy , nonatomic) NSString *follow;



// 续写
@property (copy , nonatomic) NSArray *picArr;


+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
