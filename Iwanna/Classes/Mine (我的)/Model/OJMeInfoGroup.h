//
//  OJMeInfoGroup.h
//  Iwanna
//
//  Created by One'J on 16/5/2.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OJMeInfoGroup : NSObject

/** 头部 */
@property (nonatomic, copy) NSString *header;

/** 尾部 */
@property (nonatomic, copy) NSString *footer;

/** 所有(装的是OJMeInfo模型) */
@property (nonatomic, strong) NSArray *meInfos;

+ (instancetype)meInfoGroupWithDict:(NSDictionary *)dict;

@end
