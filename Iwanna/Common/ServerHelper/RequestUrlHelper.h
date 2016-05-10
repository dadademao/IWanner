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
     *  用户登陆
     */
    kBussinessUserLogin = 1001,
    
    /**
     *  获取验证码
     */
    kBussinessGetVerificationCode = 1002,
    
    /**
     *  获取所有标签
     */
    kBussinessGetAllLabels = 1003,
    
    /**
     *  修改密码
     */
    kBussinessMidifyPassword = 1004,
    
    /**
     *  获取个人信息
     */
    kBussinessGetUserInfo = 1005
};


@interface RequestUrlHelper : NSObject

/***获取网络请求地址*/
+(NSString *)createRequestURL:(RequestUrlTag)tag;

@end
