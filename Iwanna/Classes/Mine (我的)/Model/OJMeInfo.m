//
//  OJMeInfo.m
//  Iwanna
//
//  Created by One'J on 16/5/2.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "OJMeInfo.h"

@implementation OJMeInfo
+ (instancetype)meWithDict:(NSDictionary *)dict
{
    OJMeInfo *meInfo = [[self alloc] init];
    meInfo.title = dict[@"title"];
    meInfo.details = dict[@"details"];
    return meInfo;
}

@end
