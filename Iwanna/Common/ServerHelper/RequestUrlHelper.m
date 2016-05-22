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

//获取验证码
#define USER_GET_VERIFICATIONS @"get_sms_verification_code"

//获取所有标签
#define GET_ALL_LABEL @"get_all_taglist"

//修改密码
#define MODIFY_PASSWORD @"mod_pswd_do"

//获取用户个人信息
#define GET_USER_INFO @"get_user_info"

//获取发现首页
#define GET_DESCOVER_HOME @"get_discovery_main"

//获取新鲜事
#define GET_NEWEST @"get_new_list"

//获取产品类型
#define GET_PRODUCT_TYPE_LIST @"get_product_type_list"

//获取产品列表
#define GET_PRODUCT_LIST @"get_productlist_type"

//获取商户列表
#define GET_BRAND_LIST @"get_brand_list_product_type"

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
        case kBussinessGetVerificationCode:
            return [NSString stringWithFormat:@"%@%@",IP_AND_PORT,USER_GET_VERIFICATIONS];
            break;
        case kBussinessGetAllLabels:
            return [NSString stringWithFormat:@"%@%@",IP_AND_PORT,GET_ALL_LABEL];
            break;
        case kBussinessMidifyPassword:
            return [NSString stringWithFormat:@"%@%@",IP_AND_PORT,MODIFY_PASSWORD];
            break;
        case kBussinessGetUserInfo:
            return [NSString stringWithFormat:@"%@%@",IP_AND_PORT,GET_USER_INFO];
            break;
        case kBussinessGetDescoverHome:
            return [NSString stringWithFormat:@"%@%@",IP_AND_PORT,GET_DESCOVER_HOME];
            break;
        case kBussinessGetNewest:
            return [NSString stringWithFormat:@"%@%@",IP_AND_PORT,GET_NEWEST];
            break;
        case kBussinessGetProductTypeList:
            return [NSString stringWithFormat:@"%@%@",IP_AND_PORT,GET_PRODUCT_TYPE_LIST];
            break;
        case kBussunessGetProductList:
            return [NSString stringWithFormat:@"%@%@",IP_AND_PORT,GET_PRODUCT_LIST];
            break;
        case kBussinessGetBrandList:
            return [NSString stringWithFormat:@"%@%@",IP_AND_PORT,GET_BRAND_LIST];
            break;
        default:
            return @"";
            break;
    }
}

@end
