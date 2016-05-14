//
//  NewestModel.m
//
//  Created by 晨 符 on 5/12/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NewestModel.h"


NSString *const kNewestModelMultiPage = @"multi_page";
NSString *const kNewestModelDescription = @"description";
NSString *const kNewestModelTitleImageUrl = @"title_image_url";
NSString *const kNewestModelImageUrl = @"image_url";
NSString *const kNewestModelUrl = @"url";
NSString *const kNewestModelSeq = @"seq";
NSString *const kNewestModelTitle = @"title";
NSString *const kNewestModelLinkType = @"link_type";
NSString *const kNewestModelType = @"type";
NSString *const kNewestModelFileName = @"file_name";
NSString *const kNewestModelFileUrl = @"file_url";
NSString *const kNewestModelNewsIds = @"news_ids";
NSString *const kNewestModelStatus = @"status";
NSString *const kNewestModelContent = @"content";


@interface NewestModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NewestModel

@synthesize multiPage = _multiPage;
@synthesize newestModelDescription = _newestModelDescription;
@synthesize titleImageUrl = _titleImageUrl;
@synthesize imageUrl = _imageUrl;
@synthesize url = _url;
@synthesize seq = _seq;
@synthesize title = _title;
@synthesize linkType = _linkType;
@synthesize type = _type;
@synthesize fileName = _fileName;
@synthesize fileUrl = _fileUrl;
@synthesize newsIds = _newsIds;
@synthesize status = _status;
@synthesize content = _content;


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
            self.multiPage = [[self objectOrNilForKey:kNewestModelMultiPage fromDictionary:dict] doubleValue];
            self.newestModelDescription = [self objectOrNilForKey:kNewestModelDescription fromDictionary:dict];
            self.titleImageUrl = [self objectOrNilForKey:kNewestModelTitleImageUrl fromDictionary:dict];
            self.imageUrl = [self objectOrNilForKey:kNewestModelImageUrl fromDictionary:dict];
            self.url = [self objectOrNilForKey:kNewestModelUrl fromDictionary:dict];
            self.seq = [[self objectOrNilForKey:kNewestModelSeq fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kNewestModelTitle fromDictionary:dict];
            self.linkType = [[self objectOrNilForKey:kNewestModelLinkType fromDictionary:dict] doubleValue];
            self.type = [[self objectOrNilForKey:kNewestModelType fromDictionary:dict] doubleValue];
            self.fileName = [self objectOrNilForKey:kNewestModelFileName fromDictionary:dict];
            self.fileUrl = [self objectOrNilForKey:kNewestModelFileUrl fromDictionary:dict];
            self.newsIds = [self objectOrNilForKey:kNewestModelNewsIds fromDictionary:dict];
            self.status = [[self objectOrNilForKey:kNewestModelStatus fromDictionary:dict] doubleValue];
            self.content = [self objectOrNilForKey:kNewestModelContent fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.multiPage] forKey:kNewestModelMultiPage];
    [mutableDict setValue:self.newestModelDescription forKey:kNewestModelDescription];
    [mutableDict setValue:self.titleImageUrl forKey:kNewestModelTitleImageUrl];
    [mutableDict setValue:self.imageUrl forKey:kNewestModelImageUrl];
    [mutableDict setValue:self.url forKey:kNewestModelUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.seq] forKey:kNewestModelSeq];
    [mutableDict setValue:self.title forKey:kNewestModelTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.linkType] forKey:kNewestModelLinkType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kNewestModelType];
    [mutableDict setValue:self.fileName forKey:kNewestModelFileName];
    [mutableDict setValue:self.fileUrl forKey:kNewestModelFileUrl];
    [mutableDict setValue:self.newsIds forKey:kNewestModelNewsIds];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kNewestModelStatus];
    [mutableDict setValue:self.content forKey:kNewestModelContent];

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

    self.multiPage = [aDecoder decodeDoubleForKey:kNewestModelMultiPage];
    self.newestModelDescription = [aDecoder decodeObjectForKey:kNewestModelDescription];
    self.titleImageUrl = [aDecoder decodeObjectForKey:kNewestModelTitleImageUrl];
    self.imageUrl = [aDecoder decodeObjectForKey:kNewestModelImageUrl];
    self.url = [aDecoder decodeObjectForKey:kNewestModelUrl];
    self.seq = [aDecoder decodeDoubleForKey:kNewestModelSeq];
    self.title = [aDecoder decodeObjectForKey:kNewestModelTitle];
    self.linkType = [aDecoder decodeDoubleForKey:kNewestModelLinkType];
    self.type = [aDecoder decodeDoubleForKey:kNewestModelType];
    self.fileName = [aDecoder decodeObjectForKey:kNewestModelFileName];
    self.fileUrl = [aDecoder decodeObjectForKey:kNewestModelFileUrl];
    self.newsIds = [aDecoder decodeObjectForKey:kNewestModelNewsIds];
    self.status = [aDecoder decodeDoubleForKey:kNewestModelStatus];
    self.content = [aDecoder decodeObjectForKey:kNewestModelContent];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_multiPage forKey:kNewestModelMultiPage];
    [aCoder encodeObject:_newestModelDescription forKey:kNewestModelDescription];
    [aCoder encodeObject:_titleImageUrl forKey:kNewestModelTitleImageUrl];
    [aCoder encodeObject:_imageUrl forKey:kNewestModelImageUrl];
    [aCoder encodeObject:_url forKey:kNewestModelUrl];
    [aCoder encodeDouble:_seq forKey:kNewestModelSeq];
    [aCoder encodeObject:_title forKey:kNewestModelTitle];
    [aCoder encodeDouble:_linkType forKey:kNewestModelLinkType];
    [aCoder encodeDouble:_type forKey:kNewestModelType];
    [aCoder encodeObject:_fileName forKey:kNewestModelFileName];
    [aCoder encodeObject:_fileUrl forKey:kNewestModelFileUrl];
    [aCoder encodeObject:_newsIds forKey:kNewestModelNewsIds];
    [aCoder encodeDouble:_status forKey:kNewestModelStatus];
    [aCoder encodeObject:_content forKey:kNewestModelContent];
}

- (id)copyWithZone:(NSZone *)zone
{
    NewestModel *copy = [[NewestModel alloc] init];
    
    if (copy) {

        copy.multiPage = self.multiPage;
        copy.newestModelDescription = [self.newestModelDescription copyWithZone:zone];
        copy.titleImageUrl = [self.titleImageUrl copyWithZone:zone];
        copy.imageUrl = [self.imageUrl copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.seq = self.seq;
        copy.title = [self.title copyWithZone:zone];
        copy.linkType = self.linkType;
        copy.type = self.type;
        copy.fileName = [self.fileName copyWithZone:zone];
        copy.fileUrl = [self.fileUrl copyWithZone:zone];
        copy.newsIds = [self.newsIds copyWithZone:zone];
        copy.status = self.status;
        copy.content = [self.content copyWithZone:zone];
    }
    
    return copy;
}


@end
