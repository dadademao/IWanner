//
//  ListXinxianshi.h
//
//  Created by 晨 符 on 5/12/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ListXinxianshi : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double multiPage;
@property (nonatomic, strong) NSString *listXinxianshiDescription;
@property (nonatomic, assign) id titleImageUrl;
@property (nonatomic, assign) id imageUrl;
@property (nonatomic, assign) id url;
@property (nonatomic, assign) id seq;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double linkType;
@property (nonatomic, assign) double type;
@property (nonatomic, assign) id fileName;
@property (nonatomic, assign) id fileUrl;
@property (nonatomic, strong) NSString *newsIds;
@property (nonatomic, assign) double status;
@property (nonatomic, strong) NSString *content;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
