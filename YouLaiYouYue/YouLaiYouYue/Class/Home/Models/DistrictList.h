//
//    DistrictList.h
//
//    Create by 代科技 时 on 29/4/2018
//    Copyright © 2018. All rights reserved.
//

//    Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface DistrictList : NSObject

@property (nonatomic, assign) NSInteger districtCode;
@property (nonatomic, strong) NSString * districtName;
@property (nonatomic, strong) NSString * sort;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
