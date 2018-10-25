//
//  EditInserModel.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/27.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EditInserModel : NSObject
@property (copy , nonatomic) NSString *ffID;

@property (copy , nonatomic) NSString *fftitle;


+ (instancetype)arrayWithDic:(NSDictionary *)dic;

@end
