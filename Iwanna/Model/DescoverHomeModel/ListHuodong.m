//
//  ListHuodong.m
//
//  Created by 晨 符 on 5/12/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ListHuodong.h"


NSString *const kListHuodongMultiPage = @"multi_page";
NSString *const kListHuodongDescription = @"description";
NSString *const kListHuodongTitleImageUrl = @"title_image_url";
NSString *const kListHuodongImageUrl = @"image_url";
NSString *const kListHuodongUrl = @"url";
NSString *const kListHuodongSeq = @"seq";
NSString *const kListHuodongTitle = @"title";
NSString *const kListHuodongLinkType = @"link_type";
NSString *const kListHuodongType = @"type";
NSString *const kListHuodongFileName = @"file_name";
NSString *const kListHuodongFileUrl = @"file_url";
NSString *const kListHuodongNewsIds = @"news_ids";
NSString *const kListHuodongStatus = @"status";
NSString *const kListHuodongContent = @"content";


@interface ListHuodong ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ListHuodong

@synthesize multiPage = _multiPage;
@synthesize listHuodongDescription = _listHuodongDescription;
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
            self.multiPage = [[self objectOrNilForKey:kListHuodongMultiPage fromDictionary:dict] doubleValue];
            self.listHuodongDescription = [self objectOrNilForKey:kListHuodongDescription fromDictionary:dict];
            self.titleImageUrl = [self objectOrNilForKey:kListHuodongTitleImageUrl fromDictionary:dict];
            self.imageUrl = [self objectOrNilForKey:kListHuodongImageUrl fromDictionary:dict];
            self.url = [self objectOrNilForKey:kListHuodongUrl fromDictionary:dict];
            self.seq = [self objectOrNilForKey:kListHuodongSeq fromDictionary:dict];
            self.title = [self objectOrNilForKey:kListHuodongTitle fromDictionary:dict];
            self.linkType = [[self objectOrNilForKey:kListHuodongLinkType fromDictionary:dict] doubleValue];
            self.type = [[self objectOrNilForKey:kListHuodongType fromDictionary:dict] doubleValue];
            self.fileName = [self objectOrNilForKey:kListHuodongFileName fromDictionary:dict];
            self.fileUrl = [self objectOrNilForKey:kListHuodongFileUrl fromDictionary:dict];
            self.newsIds = [self objectOrNilForKey:kListHuodongNewsIds fromDictionary:dict];
            self.status = [[self objectOrNilForKey:kListHuodongStatus fromDictionary:dict] doubleValue];
            self.content = [self objectOrNilForKey:kListHuodongContent fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.multiPage] forKey:kListHuodongMultiPage];
    [mutableDict setValue:self.listHuodongDescription forKey:kListHuodongDescription];
    [mutableDict setValue:self.titleImageUrl forKey:kListHuodongTitleImageUrl];
    [mutableDict setValue:self.imageUrl forKey:kListHuodongImageUrl];
    [mutableDict setValue:self.url forKey:kListHuodongUrl];
    [mutableDict setValue:self.seq forKey:kListHuodongSeq];
    [mutableDict setValue:self.title forKey:kListHuodongTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.linkType] forKey:kListHuodongLinkType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kListHuodongType];
    [mutableDict setValue:self.fileName forKey:kListHuodongFileName];
    [mutableDict setValue:self.fileUrl forKey:kListHuodongFileUrl];
    [mutableDict setValue:self.newsIds forKey:kListHuodongNewsIds];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kListHuodongStatus];
    [mutableDict setValue:self.content forKey:kListHuodongContent];

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

    self.multiPage = [aDecoder decodeDoubleForKey:kListHuodongMultiPage];
    self.listHuodongDescription = [aDecoder decodeObjectForKey:kListHuodongDescription];
    self.titleImageUrl = [aDecoder decodeObjectForKey:kListHuodongTitleImageUrl];
    self.imageUrl = [aDecoder decodeObjectForKey:kListHuodongImageUrl];
    self.url = [aDecoder decodeObjectForKey:kListHuodongUrl];
    self.seq = [aDecoder decodeObjectForKey:kListHuodongSeq];
    self.title = [aDecoder decodeObjectForKey:kListHuodongTitle];
    self.linkType = [aDecoder decodeDoubleForKey:kListHuodongLinkType];
    self.type = [aDecoder decodeDoubleForKey:kListHuodongType];
    self.fileName = [aDecoder decodeObjectForKey:kListHuodongFileName];
    self.fileUrl = [aDecoder decodeObjectForKey:kListHuodongFileUrl];
    self.newsIds = [aDecoder decodeObjectForKey:kListHuodongNewsIds];
    self.status = [aDecoder decodeDoubleForKey:kListHuodongStatus];
    self.content = [aDecoder decodeObjectForKey:kListHuodongContent];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_multiPage forKey:kListHuodongMultiPage];
    [aCoder encodeObject:_listHuodongDescription forKey:kListHuodongDescription];
    [aCoder encodeObject:_titleImageUrl forKey:kListHuodongTitleImageUrl];
    [aCoder encodeObject:_imageUrl forKey:kListHuodongImageUrl];
    [aCoder encodeObject:_url forKey:kListHuodongUrl];
    [aCoder encodeObject:_seq forKey:kListHuodongSeq];
    [aCoder encodeObject:_title forKey:kListHuodongTitle];
    [aCoder encodeDouble:_linkType forKey:kListHuodongLinkType];
    [aCoder encodeDouble:_type forKey:kListHuodongType];
    [aCoder encodeObject:_fileName forKey:kListHuodongFileName];
    [aCoder encodeObject:_fileUrl forKey:kListHuodongFileUrl];
    [aCoder encodeObject:_newsIds forKey:kListHuodongNewsIds];
    [aCoder encodeDouble:_status forKey:kListHuodongStatus];
    [aCoder encodeObject:_content forKey:kListHuodongContent];
}

- (id)copyWithZone:(NSZone *)zone
{
    ListHuodong *copy = [[ListHuodong alloc] init];
    
    if (copy) {

        copy.multiPage = self.multiPage;
        copy.listHuodongDescription = [self.listHuodongDescription copyWithZone:zone];
        copy.titleImageUrl = [self.titleImageUrl copyWithZone:zone];
        copy.imageUrl = [self.imageUrl copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.seq = [self.seq copyWithZone:zone];
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
