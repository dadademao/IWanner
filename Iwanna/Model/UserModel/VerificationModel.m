//
//  VerificationModel.m
//
//  Created by 晨 符 on 5/10/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "VerificationModel.h"


NSString *const kVerificationModelPhone = @"phone";
NSString *const kVerificationModelSmsMessage = @"sms_message";


@interface VerificationModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation VerificationModel

@synthesize phone = _phone;
@synthesize smsMessage = _smsMessage;


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
            self.phone = [self objectOrNilForKey:kVerificationModelPhone fromDictionary:dict];
            self.smsMessage = [self objectOrNilForKey:kVerificationModelSmsMessage fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.phone forKey:kVerificationModelPhone];
    [mutableDict setValue:self.smsMessage forKey:kVerificationModelSmsMessage];

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

    self.phone = [aDecoder decodeObjectForKey:kVerificationModelPhone];
    self.smsMessage = [aDecoder decodeObjectForKey:kVerificationModelSmsMessage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_phone forKey:kVerificationModelPhone];
    [aCoder encodeObject:_smsMessage forKey:kVerificationModelSmsMessage];
}

- (id)copyWithZone:(NSZone *)zone
{
    VerificationModel *copy = [[VerificationModel alloc] init];
    
    if (copy) {

        copy.phone = [self.phone copyWithZone:zone];
        copy.smsMessage = [self.smsMessage copyWithZone:zone];
    }
    
    return copy;
}


@end
