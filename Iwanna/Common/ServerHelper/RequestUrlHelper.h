//
//  RequestUrlHelper.h
//  Iwanna
//
//  Created by fuyuan on 5/10/16.
//  Copyright © 2016 Iwanna. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, RequestUrlTag) {
    /**
     *  用户注册
     */
    KBussinessUserRequest = 1000,
    
    /**
     *  用户输入
     */
    kBussinessUserLogin = 1001
};


@interface RequestUrlHelper : NSObject

/***获取网络请求地址*/
+(NSString *)createRequestURL:(RequestUrlTag)tag;

@end
