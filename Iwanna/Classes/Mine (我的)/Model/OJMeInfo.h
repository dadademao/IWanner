//
//  OJMeInfo.h
//  Iwanna
//
//  Created by One'J on 16/5/2.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OJMeInfo : NSObject

/** 名称 */
@property (nonatomic, copy) NSString *title;

/** 图标 */
@property (nonatomic, copy) NSString *details;



+ (instancetype)meWithDict:(NSDictionary *)dict;

@end
