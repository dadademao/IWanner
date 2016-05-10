//
//  BaseProvider.m
//  Iwanna
//
//  Created by fuyuan on 5/10/16.
//  Copyright © 2016 Iwanna. All rights reserved.
//

#import "BaseProvider.h"

@implementation BaseProvider
+ (NSMutableDictionary *) getDefaultHeader:(BOOL) isAppendLocation {
    NSMutableDictionary *header = [[NSMutableDictionary alloc]init];
    [header setValue:@"application/json" forKey:@"Content-Type"];
    if(isAppendLocation) {
        //        [header setValue:[self getCurrentLocationString] forKey:@"accept-location"];
    }
    
    return header;
}

//TODO:临时处理，待重构
+ (NSMutableDictionary *) getDefaultRequestHeader:(BOOL) isAppendLocation url:(NSString *)url {
    NSMutableDictionary *header = [[self class] getDefaultHeader:isAppendLocation];
    //    if([SysDefaultCacheProvider get:@"keytoken"]) {
    //        if (![url isEqualToString:@"/users/login"] && ![url isEqualToString:@"/users/snslogin"] && ![url isEqualToString:@"/users/regwithcode"]) {
    //            NSString *token = [NSString stringWithFormat:@"Bearer %@",[SysDefaultCacheProvider get:@"keytoken"]];
    //            [header setValue:token forKey:@"Authorization"];
    //        }
    //    }
    
    return header;
}
@end
