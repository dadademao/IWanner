//
//  BaseProvider.h
//  Iwanna
//
//  Created by fuyuan on 5/10/16.
//  Copyright © 2016 Iwanna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkHelper.h"
#import "HttpResultModel.h"
typedef void (^Complete)(HttpResultModel *result);

@interface BaseProvider : NSObject

+ (NSMutableDictionary *) getDefaultRequestHeader:(BOOL) isAppendLocation url:(NSString *)url;
@end
