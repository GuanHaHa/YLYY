//
//    City.h
//
//    Create by 代科技 时 on 29/4/2018
//    Copyright © 2018. All rights reserved.
//

//    Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "DistrictList.h"

@interface City : NSObject

@property (nonatomic, assign) NSInteger cityCode;
@property (nonatomic, strong) NSString * cityName;
@property (nonatomic, strong) NSArray * districtList;
@property (nonatomic, assign) CGFloat lat;
@property (nonatomic, assign) CGFloat lng;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
