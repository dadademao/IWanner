//
//  ProductTypeModel.m
//
//  Created by 晨 符 on 5/22/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ProductTypeModel.h"


NSString *const kProductTypeModelTypeVal = @"type_val";
NSString *const kProductTypeModelTypeLogoUrl = @"type_logo_url";
NSString *const kProductTypeModelTypeIds = @"type_ids";
NSString *const kProductTypeModelTypeName = @"type_name";


@interface ProductTypeModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ProductTypeModel

@synthesize typeVal = _typeVal;
@synthesize typeLogoUrl = _typeLogoUrl;
@synthesize typeIds = _typeIds;
@synthesize typeName = _typeName;


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
            self.typeVal = [self objectOrNilForKey:kProductTypeModelTypeVal fromDictionary:dict];
            self.typeLogoUrl = [self objectOrNilForKey:kProductTypeModelTypeLogoUrl fromDictionary:dict];
            self.typeIds = [self objectOrNilForKey:kProductTypeModelTypeIds fromDictionary:dict];
            self.typeName = [self objectOrNilForKey:kProductTypeModelTypeName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.typeVal forKey:kProductTypeModelTypeVal];
    [mutableDict setValue:self.typeLogoUrl forKey:kProductTypeModelTypeLogoUrl];
    [mutableDict setValue:self.typeIds forKey:kProductTypeModelTypeIds];
    [mutableDict setValue:self.typeName forKey:kProductTypeModelTypeName];

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

    self.typeVal = [aDecoder decodeObjectForKey:kProductTypeModelTypeVal];
    self.typeLogoUrl = [aDecoder decodeObjectForKey:kProductTypeModelTypeLogoUrl];
    self.typeIds = [aDecoder decodeObjectForKey:kProductTypeModelTypeIds];
    self.typeName = [aDecoder decodeObjectForKey:kProductTypeModelTypeName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_typeVal forKey:kProductTypeModelTypeVal];
    [aCoder encodeObject:_typeLogoUrl forKey:kProductTypeModelTypeLogoUrl];
    [aCoder encodeObject:_typeIds forKey:kProductTypeModelTypeIds];
    [aCoder encodeObject:_typeName forKey:kProductTypeModelTypeName];
}

- (id)copyWithZone:(NSZone *)zone
{
    ProductTypeModel *copy = [[ProductTypeModel alloc] init];
    
    if (copy) {

        copy.typeVal = [self.typeVal copyWithZone:zone];
        copy.typeLogoUrl = [self.typeLogoUrl copyWithZone:zone];
        copy.typeIds = [self.typeIds copyWithZone:zone];
        copy.typeName = [self.typeName copyWithZone:zone];
    }
    
    return copy;
}


@end
