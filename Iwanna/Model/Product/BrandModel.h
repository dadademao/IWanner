//
//  BrandModel.h
//
//  Created by 晨 符 on 5/22/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface BrandModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *introduce;
@property (nonatomic, assign) double industry;
@property (nonatomic, strong) NSString *label;
@property (nonatomic, strong) NSString *province;
@property (nonatomic, strong) NSString *merchantIds;
@property (nonatomic, assign) double weight;
@property (nonatomic, assign) double type;
@property (nonatomic, assign) double level;
@property (nonatomic, strong) NSString *address;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *logoImgPath;
@property (nonatomic, strong) NSString *parentIds;
@property (nonatomic, strong) NSString *tel;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double status;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
