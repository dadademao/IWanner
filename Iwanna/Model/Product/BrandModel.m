//
//  BrandModel.m
//
//  Created by 晨 符 on 5/22/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BrandModel.h"


NSString *const kBrandModelIntroduce = @"introduce";
NSString *const kBrandModelIndustry = @"industry";
NSString *const kBrandModelLabel = @"label";
NSString *const kBrandModelProvince = @"province";
NSString *const kBrandModelMerchantIds = @"merchant_ids";
NSString *const kBrandModelWeight = @"weight";
NSString *const kBrandModelType = @"type";
NSString *const kBrandModelLevel = @"level";
NSString *const kBrandModelAddress = @"address";
NSString *const kBrandModelCity = @"city";
NSString *const kBrandModelLogoImgPath = @"logo_img_path";
NSString *const kBrandModelParentIds = @"parent_ids";
NSString *const kBrandModelTel = @"tel";
NSString *const kBrandModelName = @"name";
NSString *const kBrandModelStatus = @"status";


@interface BrandModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BrandModel

@synthesize introduce = _introduce;
@synthesize industry = _industry;
@synthesize label = _label;
@synthesize province = _province;
@synthesize merchantIds = _merchantIds;
@synthesize weight = _weight;
@synthesize type = _type;
@synthesize level = _level;
@synthesize address = _address;
@synthesize city = _city;
@synthesize logoImgPath = _logoImgPath;
@synthesize parentIds = _parentIds;
@synthesize tel = _tel;
@synthesize name = _name;
@synthesize status = _status;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.introduce = [self objectOrNilForKey:kBrandModelIntroduce fromDictionary:dict];
            self.industry = [[self objectOrNilForKey:kBrandModelIndustry fromDictionary:dict] doubleValue];
            self.label = [self objectOrNilForKey:kBrandModelLabel fromDictionary:dict];
            self.province = [self objectOrNilForKey:kBrandModelProvince fromDictionary:dict];
            self.merchantIds = [self objectOrNilForKey:kBrandModelMerchantIds fromDictionary:dict];
            self.weight = [[self objectOrNilForKey:kBrandModelWeight fromDictionary:dict] doubleValue];
            self.type = [[self objectOrNilForKey:kBrandModelType fromDictionary:dict] doubleValue];
            self.level = [[self objectOrNilForKey:kBrandModelLevel fromDictionary:dict] doubleValue];
            self.address = [self objectOrNilForKey:kBrandModelAddress fromDictionary:dict];
            self.city = [self objectOrNilForKey:kBrandModelCity fromDictionary:dict];
            self.logoImgPath = [self objectOrNilForKey:kBrandModelLogoImgPath fromDictionary:dict];
            self.parentIds = [self objectOrNilForKey:kBrandModelParentIds fromDictionary:dict];
            self.tel = [self objectOrNilForKey:kBrandModelTel fromDictionary:dict];
            self.name = [self objectOrNilForKey:kBrandModelName fromDictionary:dict];
            self.status = [[self objectOrNilForKey:kBrandModelStatus fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.introduce forKey:kBrandModelIntroduce];
    [mutableDict setValue:[NSNumber numberWithDouble:self.industry] forKey:kBrandModelIndustry];
    [mutableDict setValue:self.label forKey:kBrandModelLabel];
    [mutableDict setValue:self.province forKey:kBrandModelProvince];
    [mutableDict setValue:self.merchantIds forKey:kBrandModelMerchantIds];
    [mutableDict setValue:[NSNumber numberWithDouble:self.weight] forKey:kBrandModelWeight];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kBrandModelType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.level] forKey:kBrandModelLevel];
    [mutableDict setValue:self.address forKey:kBrandModelAddress];
    [mutableDict setValue:self.city forKey:kBrandModelCity];
    [mutableDict setValue:self.logoImgPath forKey:kBrandModelLogoImgPath];
    [mutableDict setValue:self.parentIds forKey:kBrandModelParentIds];
    [mutableDict setValue:self.tel forKey:kBrandModelTel];
    [mutableDict setValue:self.name forKey:kBrandModelName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kBrandModelStatus];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.introduce = [aDecoder decodeObjectForKey:kBrandModelIntroduce];
    self.industry = [aDecoder decodeDoubleForKey:kBrandModelIndustry];
    self.label = [aDecoder decodeObjectForKey:kBrandModelLabel];
    self.province = [aDecoder decodeObjectForKey:kBrandModelProvince];
    self.merchantIds = [aDecoder decodeObjectForKey:kBrandModelMerchantIds];
    self.weight = [aDecoder decodeDoubleForKey:kBrandModelWeight];
    self.type = [aDecoder decodeDoubleForKey:kBrandModelType];
    self.level = [aDecoder decodeDoubleForKey:kBrandModelLevel];
    self.address = [aDecoder decodeObjectForKey:kBrandModelAddress];
    self.city = [aDecoder decodeObjectForKey:kBrandModelCity];
    self.logoImgPath = [aDecoder decodeObjectForKey:kBrandModelLogoImgPath];
    self.parentIds = [aDecoder decodeObjectForKey:kBrandModelParentIds];
    self.tel = [aDecoder decodeObjectForKey:kBrandModelTel];
    self.name = [aDecoder decodeObjectForKey:kBrandModelName];
    self.status = [aDecoder decodeDoubleForKey:kBrandModelStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_introduce forKey:kBrandModelIntroduce];
    [aCoder encodeDouble:_industry forKey:kBrandModelIndustry];
    [aCoder encodeObject:_label forKey:kBrandModelLabel];
    [aCoder encodeObject:_province forKey:kBrandModelProvince];
    [aCoder encodeObject:_merchantIds forKey:kBrandModelMerchantIds];
    [aCoder encodeDouble:_weight forKey:kBrandModelWeight];
    [aCoder encodeDouble:_type forKey:kBrandModelType];
    [aCoder encodeDouble:_level forKey:kBrandModelLevel];
    [aCoder encodeObject:_address forKey:kBrandModelAddress];
    [aCoder encodeObject:_city forKey:kBrandModelCity];
    [aCoder encodeObject:_logoImgPath forKey:kBrandModelLogoImgPath];
    [aCoder encodeObject:_parentIds forKey:kBrandModelParentIds];
    [aCoder encodeObject:_tel forKey:kBrandModelTel];
    [aCoder encodeObject:_name forKey:kBrandModelName];
    [aCoder encodeDouble:_status forKey:kBrandModelStatus];
}

- (id)copyWithZone:(NSZone *)zone
{
    BrandModel *copy = [[BrandModel alloc] init];
    
    if (copy) {

        copy.introduce = [self.introduce copyWithZone:zone];
        copy.industry = self.industry;
        copy.label = [self.label copyWithZone:zone];
        copy.province = [self.province copyWithZone:zone];
        copy.merchantIds = [self.merchantIds copyWithZone:zone];
        copy.weight = self.weight;
        copy.type = self.type;
        copy.level = self.level;
        copy.address = [self.address copyWithZone:zone];
        copy.city = [self.city copyWithZone:zone];
        copy.logoImgPath = [self.logoImgPath copyWithZone:zone];
        copy.parentIds = [self.parentIds copyWithZone:zone];
        copy.tel = [self.tel copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.status = self.status;
    }
    
    return copy;
}


@end
