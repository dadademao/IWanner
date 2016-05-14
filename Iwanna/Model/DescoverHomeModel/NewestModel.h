//
//  NewestModel.h
//
//  Created by 晨 符 on 5/12/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NewestModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double multiPage;
@property (nonatomic, strong) NSString *newestModelDescription;
@property (nonatomic, strong) NSString *titleImageUrl;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, assign) double seq;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double linkType;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) NSString *fileName;
@property (nonatomic, strong) NSString *fileUrl;
@property (nonatomic, strong) NSString *newsIds;
@property (nonatomic, assign) double status;
@property (nonatomic, strong) NSString *content;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
