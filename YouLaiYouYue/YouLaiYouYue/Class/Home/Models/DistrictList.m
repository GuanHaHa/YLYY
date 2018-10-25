//
//    DistrictList.m
//
//    Create by 代科技 时 on 29/4/2018
//    Copyright © 2018. All rights reserved.
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "DistrictList.h"

NSString *const kDistrictListDistrictCode = @"districtCode";
NSString *const kDistrictListDistrictName = @"districtName";
NSString *const kDistrictListSort = @"sort";

@interface DistrictList ()
@end
@implementation DistrictList




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kDistrictListDistrictCode] isKindOfClass:[NSNull class]]){
        self.districtCode = [dictionary[kDistrictListDistrictCode] integerValue];
    }
    
    if(![dictionary[kDistrictListDistrictName] isKindOfClass:[NSNull class]]){
        self.districtName = dictionary[kDistrictListDistrictName];
    }
    if(![dictionary[kDistrictListSort] isKindOfClass:[NSNull class]]){
        self.sort = dictionary[kDistrictListSort];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    dictionary[kDistrictListDistrictCode] = @(self.districtCode);
    if(self.districtName != nil){
        dictionary[kDistrictListDistrictName] = self.districtName;
    }
    if(self.sort != nil){
        dictionary[kDistrictListSort] = self.sort;
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
    [aCoder encodeObject:@(self.districtCode) forKey:kDistrictListDistrictCode];    if(self.districtName != nil){
        [aCoder encodeObject:self.districtName forKey:kDistrictListDistrictName];
    }
    if(self.sort != nil){
        [aCoder encodeObject:self.sort forKey:kDistrictListSort];
    }
    
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.districtCode = [[aDecoder decodeObjectForKey:kDistrictListDistrictCode] integerValue];
    self.districtName = [aDecoder decodeObjectForKey:kDistrictListDistrictName];
    self.sort = [aDecoder decodeObjectForKey:kDistrictListSort];
    return self;
    
}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    DistrictList *copy = [DistrictList new];
    
    copy.districtCode = self.districtCode;
    copy.districtName = [self.districtName copy];
    copy.sort = [self.sort copy];
    
    return copy;
}
@end
