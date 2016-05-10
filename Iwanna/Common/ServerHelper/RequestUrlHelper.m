//
//  RequestUrlHelper.m
//  Iwanna
//
//  Created by fuyuan on 5/10/16.
//  Copyright © 2016 Iwanna. All rights reserved.
//


/**
 *服务器地址和端口号
 */
#define IP_AND_PORT @"http://121.42.146.153/iwanna/apps/intfacecall/"

/**
 *  注册
 */
#define USER_REGIST @"register"


/**
 *  登陆
 */
#define USER_LOGIN @"login"

#import "RequestUrlHelper.h"

@implementation RequestUrlHelper

+(NSString *)createRequestURL:(RequestUrlTag)tag {
    switch (tag) {
        case KBussinessUserRequest:
            return [NSString stringWithFormat:@"%@%@",IP_AND_PORT,USER_REGIST];
            break;
        case kBussinessUserLogin:
            return [NSString stringWithFormat:@"%@%@",IP_AND_PORT,USER_LOGIN];
            break;
        default:
            return @"";
            break;
    }
}

@end
