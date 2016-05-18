//
//  ListXinxianshi.m
//
//  Created by 晨 符 on 5/12/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ListXinxianshi.h"


NSString *const kListXinxianshiMultiPage = @"multi_page";
NSString *const kListXinxianshiDescription = @"description";
NSString *const kListXinxianshiTitleImageUrl = @"title_image_url";
NSString *const kListXinxianshiImageUrl = @"image_url";
NSString *const kListXinxianshiUrl = @"url";
NSString *const kListXinxianshiSeq = @"seq";
NSString *const kListXinxianshiTitle = @"title";
NSString *const kListXinxianshiLinkType = @"link_type";
NSString *const kListXinxianshiType = @"type";
NSString *const kListXinxianshiFileName = @"file_name";
NSString *const kListXinxianshiFileUrl = @"file_url";
NSString *const kListXinxianshiNewsIds = @"news_ids";
NSString *const kListXinxianshiStatus = @"status";
NSString *const kListXinxianshiContent = @"content";
NSString *const kListXinxianshiCreatedate = @"createdate";


@interface ListXinxianshi ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ListXinxianshi

@synthesize multiPage = _multiPage;
@synthesize listXinxianshiDescription = _listXinxianshiDescription;
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
@synthesize createdate = _createdate;


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
        self.multiPage = [self objectOrNilForKey:kListXinxianshiMultiPage fromDictionary:dict];
        self.listXinxianshiDescription = [self objectOrNilForKey:kListXinxianshiDescription fromDictionary:dict];
        self.titleImageUrl = [self objectOrNilForKey:kListXinxianshiTitleImageUrl fromDictionary:dict];
        self.imageUrl = [self objectOrNilForKey:kListXinxianshiImageUrl fromDictionary:dict];
        self.url = [self objectOrNilForKey:kListXinxianshiUrl fromDictionary:dict];
        self.seq = [self objectOrNilForKey:kListXinxianshiSeq fromDictionary:dict];
        self.title = [self objectOrNilForKey:kListXinxianshiTitle fromDictionary:dict];
        self.linkType = [[self objectOrNilForKey:kListXinxianshiLinkType fromDictionary:dict] intValue];
        self.type = [self objectOrNilForKey:kListXinxianshiType fromDictionary:dict];
        self.fileName = [self objectOrNilForKey:kListXinxianshiFileName fromDictionary:dict];
        self.fileUrl = [self objectOrNilForKey:kListXinxianshiFileUrl fromDictionary:dict];
        self.newsIds = [self objectOrNilForKey:kListXinxianshiNewsIds fromDictionary:dict];
        self.status = [[self objectOrNilForKey:kListXinxianshiStatus fromDictionary:dict] intValue];
        self.content = [self objectOrNilForKey:kListXinxianshiContent fromDictionary:dict];
        self.createdate = [self objectOrNilForKey:kListXinxianshiCreatedate fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.multiPage forKey:kListXinxianshiMultiPage];
    [mutableDict setValue:self.listXinxianshiDescription forKey:kListXinxianshiDescription];
    [mutableDict setValue:self.titleImageUrl forKey:kListXinxianshiTitleImageUrl];
    [mutableDict setValue:self.imageUrl forKey:kListXinxianshiImageUrl];
    [mutableDict setValue:self.url forKey:kListXinxianshiUrl];
    [mutableDict setValue:self.seq forKey:kListXinxianshiSeq];
    [mutableDict setValue:self.title forKey:kListXinxianshiTitle];
    [mutableDict setValue:[NSNumber numberWithInt:self.linkType] forKey:kListXinxianshiLinkType];
    [mutableDict setValue:self.type forKey:kListXinxianshiType];
    [mutableDict setValue:self.fileName forKey:kListXinxianshiFileName];
    [mutableDict setValue:self.fileUrl forKey:kListXinxianshiFileUrl];
    [mutableDict setValue:self.newsIds forKey:kListXinxianshiNewsIds];
    [mutableDict setValue:[NSNumber numberWithInt:self.status] forKey:kListXinxianshiStatus];
    [mutableDict setValue:self.content forKey:kListXinxianshiContent];
    [mutableDict setValue:self.createdate forKey:kListXinxianshiCreatedate];

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

    self.multiPage = [aDecoder decodeObjectForKey:kListXinxianshiMultiPage];
    self.listXinxianshiDescription = [aDecoder decodeObjectForKey:kListXinxianshiDescription];
    self.titleImageUrl = [aDecoder decodeObjectForKey:kListXinxianshiTitleImageUrl];
    self.imageUrl = [aDecoder decodeObjectForKey:kListXinxianshiImageUrl];
    self.url = [aDecoder decodeObjectForKey:kListXinxianshiUrl];
    self.seq = [aDecoder decodeObjectForKey:kListXinxianshiSeq];
    self.title = [aDecoder decodeObjectForKey:kListXinxianshiTitle];
    self.linkType = [aDecoder decodeIntForKey:kListXinxianshiLinkType];
    self.type = [aDecoder decodeObjectForKey:kListXinxianshiType];
    self.fileName = [aDecoder decodeObjectForKey:kListXinxianshiFileName];
    self.fileUrl = [aDecoder decodeObjectForKey:kListXinxianshiFileUrl];
    self.newsIds = [aDecoder decodeObjectForKey:kListXinxianshiNewsIds];
    self.status = [aDecoder decodeIntForKey:kListXinxianshiStatus];
    self.content = [aDecoder decodeObjectForKey:kListXinxianshiContent];
    self.createdate = [aDecoder decodeObjectForKey:kListXinxianshiCreatedate];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_multiPage forKey:kListXinxianshiMultiPage];
    [aCoder encodeObject:_listXinxianshiDescription forKey:kListXinxianshiDescription];
    [aCoder encodeObject:_titleImageUrl forKey:kListXinxianshiTitleImageUrl];
    [aCoder encodeObject:_imageUrl forKey:kListXinxianshiImageUrl];
    [aCoder encodeObject:_url forKey:kListXinxianshiUrl];
    [aCoder encodeObject:_seq forKey:kListXinxianshiSeq];
    [aCoder encodeObject:_title forKey:kListXinxianshiTitle];
    [aCoder encodeInt:_linkType forKey:kListXinxianshiLinkType];
    [aCoder encodeObject:_type forKey:kListXinxianshiType];
    [aCoder encodeObject:_fileName forKey:kListXinxianshiFileName];
    [aCoder encodeObject:_fileUrl forKey:kListXinxianshiFileUrl];
    [aCoder encodeObject:_newsIds forKey:kListXinxianshiNewsIds];
    [aCoder encodeInt:_status forKey:kListXinxianshiStatus];
    [aCoder encodeObject:_content forKey:kListXinxianshiContent];
    [aCoder encodeObject:_createdate forKey:kListXinxianshiCreatedate];
}

- (id)copyWithZone:(NSZone *)zone
{
    ListXinxianshi *copy = [[ListXinxianshi alloc] init];
    
    if (copy) {

        copy.multiPage = [self.multiPage copyWithZone:zone];
        copy.listXinxianshiDescription = [self.listXinxianshiDescription copyWithZone:zone];
        copy.titleImageUrl = [self.titleImageUrl copyWithZone:zone];
        copy.imageUrl = [self.imageUrl copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.seq = [self.seq copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.linkType = self.linkType;
        copy.type = [self.type copyWithZone:zone];
        copy.fileName = [self.fileName copyWithZone:zone];
        copy.fileUrl = [self.fileUrl copyWithZone:zone];
        copy.newsIds = [self.newsIds copyWithZone:zone];
        copy.status = self.status;
        copy.content = [self.content copyWithZone:zone];
        copy.createdate = [self.createdate copyWithZone:zone];
    }
    
    return copy;
}


@end
