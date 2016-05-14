//
//  BaseClass.m
//
//  Created by 晨 符 on 5/12/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "BaseNewestModel.h"
#import "NewestModel.h"


NSString *const kBaseClassNewestModel = @"NewestModel";


@interface BaseNewestModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation BaseNewestModel

@synthesize newestModel = _newestModel;


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
    NSObject *receivedNewestModel = [dict objectForKey:kBaseClassNewestModel];
    NSMutableArray *parsedNewestModel = [NSMutableArray array];
    if ([receivedNewestModel isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedNewestModel) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedNewestModel addObject:[NewestModel modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedNewestModel isKindOfClass:[NSDictionary class]]) {
       [parsedNewestModel addObject:[NewestModel modelObjectWithDictionary:(NSDictionary *)receivedNewestModel]];
    }

    self.newestModel = [NSArray arrayWithArray:parsedNewestModel];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForNewestModel = [NSMutableArray array];
    for (NSObject *subArrayObject in self.newestModel) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForNewestModel addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForNewestModel addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForNewestModel] forKey:kBaseClassNewestModel];

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

    self.newestModel = [aDecoder decodeObjectForKey:kBaseClassNewestModel];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_newestModel forKey:kBaseClassNewestModel];
}

- (id)copyWithZone:(NSZone *)zone
{
    BaseNewestModel *copy = [[BaseNewestModel alloc] init];
    
    if (copy) {

        copy.newestModel = [self.newestModel copyWithZone:zone];
    }
    
    return copy;
}


@end
