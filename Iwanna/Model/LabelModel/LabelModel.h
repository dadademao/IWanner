//
//  LabelModel.h
//
//  Created by 晨 符 on 5/10/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface LabelModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *labelName;
@property (nonatomic, assign) id updatedate;
@property (nonatomic, assign) id remarks;
@property (nonatomic, assign) double weight;
@property (nonatomic, strong) NSString *createby;
@property (nonatomic, assign) double seqNo;
@property (nonatomic, strong) NSString *ids;
@property (nonatomic, assign) id updateby;
@property (nonatomic, strong) NSString *createdate;
@property (nonatomic, assign) double version;
@property (nonatomic, strong) NSString *delflag;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
