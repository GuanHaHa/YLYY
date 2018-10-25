//
//    CityList.m
//
//    Create by 代科技 时 on 27/4/2018
//    Copyright © 2018. All rights reserved.
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "CityList.h"
#import "NSString+Utils.h"
NSString *const kCityListCityCode = @"cityCode";
NSString *const kCityListCityName = @"cityName";
NSString *const kCityListSort = @"sort";

@interface CityList ()
@end
@implementation CityList


/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kCityListCityCode] isKindOfClass:[NSNull class]]){
        self.cityCode = [dictionary[kCityListCityCode] integerValue];
    }
    
    if(![dictionary[kCityListCityName] isKindOfClass:[NSNull class]]){
        self.cityName = dictionary[kCityListCityName];
        _pinyin = _cityName.pinyin;
    }
    if(![dictionary[kCityListSort] isKindOfClass:[NSNull class]]){
        self.sort = dictionary[kCityListSort];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    dictionary[kCityListCityCode] = @(self.cityCode);
    if(self.cityName != nil){
        dictionary[kCityListCityName] = self.cityName;
    }
    if(self.sort != nil){
        dictionary[kCityListSort] = self.sort;
    }
    return dictionary;
    
}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:@(self.cityCode) forKey:kCityListCityCode];    if(self.cityName != nil){
        [aCoder encodeObject:self.cityName forKey:kCityListCityName];
    }
    if(self.sort != nil){
        [aCoder encodeObject:self.sort forKey:kCityListSort];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.cityCode = [[aDecoder decodeObjectForKey:kCityListCityCode] integerValue];
    self.cityName = [aDecoder decodeObjectForKey:kCityListCityName];
    self.sort = [aDecoder decodeObjectForKey:kCityListSort];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    CityList *copy = [CityList new];
    
    copy.cityCode = self.cityCode;
    copy.cityName = [self.cityName copy];
    copy.sort = [self.sort copy];
    
    return copy;
}
@end
