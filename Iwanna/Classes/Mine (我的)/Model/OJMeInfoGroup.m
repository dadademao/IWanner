//
//  OJMeInfoGroup.m
//  Iwanna
//
//  Created by One'J on 16/5/2.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "OJMeInfoGroup.h"
#import "OJMeInfo.h"

@implementation OJMeInfoGroup

+ (instancetype)meInfoGroupWithDict:(NSDictionary *)dict
{
    OJMeInfoGroup *group = [[self alloc] init];
    //    [group setValuesForKeysWithDictionary:dict];
    group.header = dict[@"header"];
    group.footer = dict[@"footer"];
    
    // 字典数组-> 模型数组
    NSMutableArray *temp = [NSMutableArray array];
    for (NSDictionary *meInfoDict in dict[@"items"]) {
        OJMeInfo *meInfo = [OJMeInfo meWithDict:meInfoDict];
        [temp addObject:meInfo];
    }
    group.meInfos = temp;
    
    return group;
}

@end
