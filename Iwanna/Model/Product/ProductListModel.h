//
//  ProductListModel.h
//
//  Created by 晨 符 on 5/22/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ProductListModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *introduce;
@property (nonatomic, assign) double status;
@property (nonatomic, strong) NSString *marque;
@property (nonatomic, assign) double seqNo;
@property (nonatomic, assign) double price;
@property (nonatomic, strong) NSString *shelfTime;
@property (nonatomic, strong) NSString *productIds;
@property (nonatomic, strong) NSString *merchantIds;
@property (nonatomic, strong) NSString *removeTime;
@property (nonatomic, strong) NSString *industry;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
