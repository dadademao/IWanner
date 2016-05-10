//
//  LabelModel.m
//
//  Created by 晨 符 on 5/10/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "LabelModel.h"


NSString *const kLabelModelLabelName = @"label_name";
NSString *const kLabelModelUpdatedate = @"updatedate";
NSString *const kLabelModelRemarks = @"remarks";
NSString *const kLabelModelWeight = @"weight";
NSString *const kLabelModelCreateby = @"createby";
NSString *const kLabelModelSeqNo = @"seq_no";
NSString *const kLabelModelIds = @"ids";
NSString *const kLabelModelUpdateby = @"updateby";
NSString *const kLabelModelCreatedate = @"createdate";
NSString *const kLabelModelVersion = @"version";
NSString *const kLabelModelDelflag = @"delflag";


@interface LabelModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LabelModel

@synthesize labelName = _labelName;
@synthesize updatedate = _updatedate;
@synthesize remarks = _remarks;
@synthesize weight = _weight;
@synthesize createby = _createby;
@synthesize seqNo = _seqNo;
@synthesize ids = _ids;
@synthesize updateby = _updateby;
@synthesize createdate = _createdate;
@synthesize version = _version;
@synthesize delflag = _delflag;


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
            self.labelName = [self objectOrNilForKey:kLabelModelLabelName fromDictionary:dict];
            self.updatedate = [self objectOrNilForKey:kLabelModelUpdatedate fromDictionary:dict];
            self.remarks = [self objectOrNilForKey:kLabelModelRemarks fromDictionary:dict];
            self.weight = [[self objectOrNilForKey:kLabelModelWeight fromDictionary:dict] doubleValue];
            self.createby = [self objectOrNilForKey:kLabelModelCreateby fromDictionary:dict];
            self.seqNo = [[self objectOrNilForKey:kLabelModelSeqNo fromDictionary:dict] doubleValue];
            self.ids = [self objectOrNilForKey:kLabelModelIds fromDictionary:dict];
            self.updateby = [self objectOrNilForKey:kLabelModelUpdateby fromDictionary:dict];
            self.createdate = [self objectOrNilForKey:kLabelModelCreatedate fromDictionary:dict];
            self.version = [[self objectOrNilForKey:kLabelModelVersion fromDictionary:dict] doubleValue];
            self.delflag = [self objectOrNilForKey:kLabelModelDelflag fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.labelName forKey:kLabelModelLabelName];
    [mutableDict setValue:self.updatedate forKey:kLabelModelUpdatedate];
    [mutableDict setValue:self.remarks forKey:kLabelModelRemarks];
    [mutableDict setValue:[NSNumber numberWithDouble:self.weight] forKey:kLabelModelWeight];
    [mutableDict setValue:self.createby forKey:kLabelModelCreateby];
    [mutableDict setValue:[NSNumber numberWithDouble:self.seqNo] forKey:kLabelModelSeqNo];
    [mutableDict setValue:self.ids forKey:kLabelModelIds];
    [mutableDict setValue:self.updateby forKey:kLabelModelUpdateby];
    [mutableDict setValue:self.createdate forKey:kLabelModelCreatedate];
    [mutableDict setValue:[NSNumber numberWithDouble:self.version] forKey:kLabelModelVersion];
    [mutableDict setValue:self.delflag forKey:kLabelModelDelflag];

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

    self.labelName = [aDecoder decodeObjectForKey:kLabelModelLabelName];
    self.updatedate = [aDecoder decodeObjectForKey:kLabelModelUpdatedate];
    self.remarks = [aDecoder decodeObjectForKey:kLabelModelRemarks];
    self.weight = [aDecoder decodeDoubleForKey:kLabelModelWeight];
    self.createby = [aDecoder decodeObjectForKey:kLabelModelCreateby];
    self.seqNo = [aDecoder decodeDoubleForKey:kLabelModelSeqNo];
    self.ids = [aDecoder decodeObjectForKey:kLabelModelIds];
    self.updateby = [aDecoder decodeObjectForKey:kLabelModelUpdateby];
    self.createdate = [aDecoder decodeObjectForKey:kLabelModelCreatedate];
    self.version = [aDecoder decodeDoubleForKey:kLabelModelVersion];
    self.delflag = [aDecoder decodeObjectForKey:kLabelModelDelflag];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_labelName forKey:kLabelModelLabelName];
    [aCoder encodeObject:_updatedate forKey:kLabelModelUpdatedate];
    [aCoder encodeObject:_remarks forKey:kLabelModelRemarks];
    [aCoder encodeDouble:_weight forKey:kLabelModelWeight];
    [aCoder encodeObject:_createby forKey:kLabelModelCreateby];
    [aCoder encodeDouble:_seqNo forKey:kLabelModelSeqNo];
    [aCoder encodeObject:_ids forKey:kLabelModelIds];
    [aCoder encodeObject:_updateby forKey:kLabelModelUpdateby];
    [aCoder encodeObject:_createdate forKey:kLabelModelCreatedate];
    [aCoder encodeDouble:_version forKey:kLabelModelVersion];
    [aCoder encodeObject:_delflag forKey:kLabelModelDelflag];
}

- (id)copyWithZone:(NSZone *)zone
{
    LabelModel *copy = [[LabelModel alloc] init];
    
    if (copy) {

        copy.labelName = [self.labelName copyWithZone:zone];
        copy.updatedate = [self.updatedate copyWithZone:zone];
        copy.remarks = [self.remarks copyWithZone:zone];
        copy.weight = self.weight;
        copy.createby = [self.createby copyWithZone:zone];
        copy.seqNo = self.seqNo;
        copy.ids = [self.ids copyWithZone:zone];
        copy.updateby = [self.updateby copyWithZone:zone];
        copy.createdate = [self.createdate copyWithZone:zone];
        copy.version = self.version;
        copy.delflag = [self.delflag copyWithZone:zone];
    }
    
    return copy;
}


@end
