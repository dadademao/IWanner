//
//  ProductTypeModel.h
//
//  Created by 晨 符 on 5/22/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ProductTypeModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *typeVal;
@property (nonatomic, strong) NSString *typeLogoUrl;
@property (nonatomic, strong) NSString *typeIds;
@property (nonatomic, strong) NSString *typeName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
