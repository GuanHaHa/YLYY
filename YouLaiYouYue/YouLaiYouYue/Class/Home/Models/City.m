//
//    City.m
//
//    Create by 代科技 时 on 29/4/2018
//    Copyright © 2018. All rights reserved.
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "City.h"

NSString *const kCityCityCode = @"cityCode";
NSString *const kCityCityName = @"cityName";
NSString *const kCityDistrictList = @"districtList";
NSString *const kCityLat = @"lat";
NSString *const kCityLng = @"lng";

@interface City ()
@end
@implementation City




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kCityCityCode] isKindOfClass:[NSNull class]]){
        self.cityCode = [dictionary[kCityCityCode] integerValue];
    }
    
    if(![dictionary[kCityCityName] isKindOfClass:[NSNull class]]){
        self.cityName = dictionary[kCityCityName];
    }
    if(dictionary[kCityDistrictList] != nil && [dictionary[kCityDistrictList] isKindOfClass:[NSArray class]]){
        NSArray * districtListDictionaries = dictionary[kCityDistrictList];
        NSMutableArray * districtListItems = [NSMutableArray array];
        for(NSDictionary * districtListDictionary in districtListDictionaries){
            DistrictList * districtListItem = [[DistrictList alloc] initWithDictionary:districtListDictionary];
            [districtListItems addObject:districtListItem];
        }
        self.districtList = districtListItems;
    }
    if(![dictionary[kCityLat] isKindOfClass:[NSNull class]]){
        self.lat = [dictionary[kCityLat] floatValue];
    }
    
    if(![dictionary[kCityLng] isKindOfClass:[NSNull class]]){
        self.lng = [dictionary[kCityLng] floatValue];
    }
    
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    dictionary[kCityCityCode] = @(self.cityCode);
    if(self.cityName != nil){
        dictionary[kCityCityName] = self.cityName;
    }
    if(self.districtList != nil){
        NSMutableArray * dictionaryElements = [NSMutableArray array];
        for(DistrictList * districtListElement in self.districtList){
            [dictionaryElements addObject:[districtListElement toDictionary]];
        }
        dictionary[kCityDistrictList] = dictionaryElements;
    }
    dictionary[kCityLat] = @(self.lat);
    dictionary[kCityLng] = @(self.lng);
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
    [aCoder encodeObject:@(self.cityCode) forKey:kCityCityCode];    if(self.cityName != nil){
        [aCoder encodeObject:self.cityName forKey:kCityCityName];
    }
    if(self.districtList != nil){
        [aCoder encodeObject:self.districtList forKey:kCityDistrictList];
    }
    [aCoder encodeObject:@(self.lat) forKey:kCityLat];    [aCoder encodeObject:@(self.lng) forKey:kCityLng];
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.cityCode = [[aDecoder decodeObjectForKey:kCityCityCode] integerValue];
    self.cityName = [aDecoder decodeObjectForKey:kCityCityName];
    self.districtList = [aDecoder decodeObjectForKey:kCityDistrictList];
    self.lat = [[aDecoder decodeObjectForKey:kCityLat] floatValue];
    self.lng = [[aDecoder decodeObjectForKey:kCityLng] floatValue];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    City *copy = [City new];
    
    copy.cityCode = self.cityCode;
    copy.cityName = [self.cityName copy];
    copy.districtList = [self.districtList copy];
    copy.lat = self.lat;
    copy.lng = self.lng;
    
    return copy;
}
@end
