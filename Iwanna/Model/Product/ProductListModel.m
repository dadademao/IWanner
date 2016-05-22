//
//  ProductListModel.m
//
//  Created by 晨 符 on 5/22/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ProductListModel.h"


NSString *const kProductListModelIntroduce = @"introduce";
NSString *const kProductListModelStatus = @"status";
NSString *const kProductListModelMarque = @"marque";
NSString *const kProductListModelSeqNo = @"seq_no";
NSString *const kProductListModelPrice = @"price";
NSString *const kProductListModelShelfTime = @"shelf_time";
NSString *const kProductListModelProductIds = @"product_ids";
NSString *const kProductListModelMerchantIds = @"merchant_ids";
NSString *const kProductListModelRemoveTime = @"remove_time";
NSString *const kProductListModelIndustry = @"industry";
NSString *const kProductListModelName = @"name";


@interface ProductListModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ProductListModel

@synthesize introduce = _introduce;
@synthesize status = _status;
@synthesize marque = _marque;
@synthesize seqNo = _seqNo;
@synthesize price = _price;
@synthesize shelfTime = _shelfTime;
@synthesize productIds = _productIds;
@synthesize merchantIds = _merchantIds;
@synthesize removeTime = _removeTime;
@synthesize industry = _industry;
@synthesize name = _name;


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
            self.introduce = [self objectOrNilForKey:kProductListModelIntroduce fromDictionary:dict];
            self.status = [[self objectOrNilForKey:kProductListModelStatus fromDictionary:dict] doubleValue];
            self.marque = [self objectOrNilForKey:kProductListModelMarque fromDictionary:dict];
            self.seqNo = [[self objectOrNilForKey:kProductListModelSeqNo fromDictionary:dict] doubleValue];
            self.price = [[self objectOrNilForKey:kProductListModelPrice fromDictionary:dict] doubleValue];
            self.shelfTime = [self objectOrNilForKey:kProductListModelShelfTime fromDictionary:dict];
            self.productIds = [self objectOrNilForKey:kProductListModelProductIds fromDictionary:dict];
            self.merchantIds = [self objectOrNilForKey:kProductListModelMerchantIds fromDictionary:dict];
            self.removeTime = [self objectOrNilForKey:kProductListModelRemoveTime fromDictionary:dict];
            self.industry = [self objectOrNilForKey:kProductListModelIndustry fromDictionary:dict];
            self.name = [self objectOrNilForKey:kProductListModelName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.introduce forKey:kProductListModelIntroduce];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kProductListModelStatus];
    [mutableDict setValue:self.marque forKey:kProductListModelMarque];
    [mutableDict setValue:[NSNumber numberWithDouble:self.seqNo] forKey:kProductListModelSeqNo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.price] forKey:kProductListModelPrice];
    [mutableDict setValue:self.shelfTime forKey:kProductListModelShelfTime];
    [mutableDict setValue:self.productIds forKey:kProductListModelProductIds];
    [mutableDict setValue:self.merchantIds forKey:kProductListModelMerchantIds];
    [mutableDict setValue:self.removeTime forKey:kProductListModelRemoveTime];
    [mutableDict setValue:self.industry forKey:kProductListModelIndustry];
    [mutableDict setValue:self.name forKey:kProductListModelName];

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

    self.introduce = [aDecoder decodeObjectForKey:kProductListModelIntroduce];
    self.status = [aDecoder decodeDoubleForKey:kProductListModelStatus];
    self.marque = [aDecoder decodeObjectForKey:kProductListModelMarque];
    self.seqNo = [aDecoder decodeDoubleForKey:kProductListModelSeqNo];
    self.price = [aDecoder decodeDoubleForKey:kProductListModelPrice];
    self.shelfTime = [aDecoder decodeObjectForKey:kProductListModelShelfTime];
    self.productIds = [aDecoder decodeObjectForKey:kProductListModelProductIds];
    self.merchantIds = [aDecoder decodeObjectForKey:kProductListModelMerchantIds];
    self.removeTime = [aDecoder decodeObjectForKey:kProductListModelRemoveTime];
    self.industry = [aDecoder decodeObjectForKey:kProductListModelIndustry];
    self.name = [aDecoder decodeObjectForKey:kProductListModelName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_introduce forKey:kProductListModelIntroduce];
    [aCoder encodeDouble:_status forKey:kProductListModelStatus];
    [aCoder encodeObject:_marque forKey:kProductListModelMarque];
    [aCoder encodeDouble:_seqNo forKey:kProductListModelSeqNo];
    [aCoder encodeDouble:_price forKey:kProductListModelPrice];
    [aCoder encodeObject:_shelfTime forKey:kProductListModelShelfTime];
    [aCoder encodeObject:_productIds forKey:kProductListModelProductIds];
    [aCoder encodeObject:_merchantIds forKey:kProductListModelMerchantIds];
    [aCoder encodeObject:_removeTime forKey:kProductListModelRemoveTime];
    [aCoder encodeObject:_industry forKey:kProductListModelIndustry];
    [aCoder encodeObject:_name forKey:kProductListModelName];
}

- (id)copyWithZone:(NSZone *)zone
{
    ProductListModel *copy = [[ProductListModel alloc] init];
    
    if (copy) {

        copy.introduce = [self.introduce copyWithZone:zone];
        copy.status = self.status;
        copy.marque = [self.marque copyWithZone:zone];
        copy.seqNo = self.seqNo;
        copy.price = self.price;
        copy.shelfTime = [self.shelfTime copyWithZone:zone];
        copy.productIds = [self.productIds copyWithZone:zone];
        copy.merchantIds = [self.merchantIds copyWithZone:zone];
        copy.removeTime = [self.removeTime copyWithZone:zone];
        copy.industry = [self.industry copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
