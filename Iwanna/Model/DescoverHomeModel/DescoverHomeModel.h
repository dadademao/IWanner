//
//  DescoverHomeModel.h
//
//  Created by 晨 符 on 5/12/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DescoverHomeModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *listXinxianshi;
@property (nonatomic, strong) NSArray *listHuodong;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
