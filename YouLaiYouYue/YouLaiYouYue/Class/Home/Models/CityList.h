//
//    CityList.h
//
//    Create by 代科技 时 on 27/4/2018
//    Copyright © 2018. All rights reserved.
//

//    Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface CityList : NSObject

@property (nonatomic, assign) NSInteger cityCode;
@property (nonatomic, strong) NSString * cityName;
@property (nonatomic, strong) NSString * sort;
@property (nonatomic,strong) NSString *pinyin;//拼音

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
