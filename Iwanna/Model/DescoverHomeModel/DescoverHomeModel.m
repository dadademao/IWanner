//
//  DescoverHomeModel.m
//
//  Created by 晨 符 on 5/12/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "DescoverHomeModel.h"
#import "ListXinxianshi.h"
#import "ListHuodong.h"


NSString *const kDescoverHomeModelListXinxianshi = @"list_xinxianshi";
NSString *const kDescoverHomeModelListHuodong = @"list_huodong";


@interface DescoverHomeModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DescoverHomeModel

@synthesize listXinxianshi = _listXinxianshi;
@synthesize listHuodong = _listHuodong;


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
    NSObject *receivedListXinxianshi = [dict objectForKey:kDescoverHomeModelListXinxianshi];
    NSMutableArray *parsedListXinxianshi = [NSMutableArray array];
    if ([receivedListXinxianshi isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedListXinxianshi) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedListXinxianshi addObject:[ListXinxianshi modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedListXinxianshi isKindOfClass:[NSDictionary class]]) {
       [parsedListXinxianshi addObject:[ListXinxianshi modelObjectWithDictionary:(NSDictionary *)receivedListXinxianshi]];
    }

    self.listXinxianshi = [NSArray arrayWithArray:parsedListXinxianshi];
    NSObject *receivedListHuodong = [dict objectForKey:kDescoverHomeModelListHuodong];
    NSMutableArray *parsedListHuodong = [NSMutableArray array];
    if ([receivedListHuodong isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedListHuodong) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedListHuodong addObject:[ListHuodong modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedListHuodong isKindOfClass:[NSDictionary class]]) {
       [parsedListHuodong addObject:[ListHuodong modelObjectWithDictionary:(NSDictionary *)receivedListHuodong]];
    }

    self.listHuodong = [NSArray arrayWithArray:parsedListHuodong];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForListXinxianshi = [NSMutableArray array];
    for (NSObject *subArrayObject in self.listXinxianshi) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForListXinxianshi addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForListXinxianshi addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForListXinxianshi] forKey:kDescoverHomeModelListXinxianshi];
    NSMutableArray *tempArrayForListHuodong = [NSMutableArray array];
    for (NSObject *subArrayObject in self.listHuodong) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForListHuodong addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForListHuodong addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForListHuodong] forKey:kDescoverHomeModelListHuodong];

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

    self.listXinxianshi = [aDecoder decodeObjectForKey:kDescoverHomeModelListXinxianshi];
    self.listHuodong = [aDecoder decodeObjectForKey:kDescoverHomeModelListHuodong];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_listXinxianshi forKey:kDescoverHomeModelListXinxianshi];
    [aCoder encodeObject:_listHuodong forKey:kDescoverHomeModelListHuodong];
}

- (id)copyWithZone:(NSZone *)zone
{
    DescoverHomeModel *copy = [[DescoverHomeModel alloc] init];
    
    if (copy) {

        copy.listXinxianshi = [self.listXinxianshi copyWithZone:zone];
        copy.listHuodong = [self.listHuodong copyWithZone:zone];
    }
    
    return copy;
}


@end
