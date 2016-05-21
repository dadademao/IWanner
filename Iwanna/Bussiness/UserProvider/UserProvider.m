//
//  UserProvider.m
//  Iwanna
//
//  Created by fuyuan on 5/10/16.
//  Copyright © 2016 Iwanna. All rights reserved.
//

#import "UserProvider.h"
#import "RequestUrlHelper.h"
#import "UserInfoModel.h"
#import "VerificationModel.h"
#import "LabelModel.h"
@implementation UserProvider

/**
 *  注册接口
 *
 *  @param dic           注册信息参数
 *  @param compelteBlock 完成
 *  @param errorBlock    失败
 */
+ (NSURLSessionDataTask *) registWithDic:(NSDictionary *)dic
              complete:(Complete)compelteBlock
                 error:(NetWorkErrorBlock)errorBlock {
    NSString *url = [RequestUrlHelper createRequestURL:KBussinessUserRequest];
    NSMutableDictionary *header = [[self class] getDefaultRequestHeader:YES url:url];
    return [[NetWorkHelper shareManager] postRequest:header body:dic serverAPIURL:url completeBlock:^(NSDictionary *responseDict, NSDictionary *responseHeader) {
        if ([responseDict[@"code"] longValue] == 1) {
            UserInfoModel *model = [UserInfoModel modelObjectWithDictionary:responseDict[@"data"][0]];
            HttpResultModel *result = [HttpResultModel getSuccessInstance:model];
            UserInfoModel *myUserInfo = [UserInfoModel shareUserModel];
            [myUserInfo  setContentWithDic:responseDict[@"data"][0]];
            dispatch_async(dispatch_get_main_queue(), ^{
                compelteBlock(result);
                
            });
        } else {
            
            HttpResultModel *result = [HttpResultModel getWarningWithMsg:responseDict[@"message"]];
            dispatch_async(dispatch_get_main_queue(), ^{
                compelteBlock(result);
                
            });
        }
    } errorBlock:^(NSError *error) {
        errorBlock(error);
    } finishedBlock:^(NSError *error) {
        errorBlock(error);
    }];
}



/**
 *  登陆接口
 *
 *  @param dic           登陆信息
 *  @param completeBlock 完成
 *  @param errorBlock    失败
 *
 *  @return <#return value description#>
 */
+ (NSURLSessionDataTask *) loginWithDic:(NSDictionary *)dic
                               complete:(Complete)completeBlock
                                  error:(NetWorkErrorBlock)errorBlock {
    NSString *url = [RequestUrlHelper createRequestURL:kBussinessUserLogin];
    NSMutableDictionary *header = [[self class] getDefaultRequestHeader:YES url:url];
    return [[NetWorkHelper shareManager] postRequest:header body:dic serverAPIURL:url completeBlock:^(NSDictionary *responseDict, NSDictionary *responseHeader) {
        if ([responseDict[@"code"] longValue] == 1) {
            UserInfoModel *model = [UserInfoModel modelObjectWithDictionary:responseDict[@"data"][0]];
            UserInfoModel *myUserInfo = [UserInfoModel shareUserModel];
            [myUserInfo  setContentWithDic:responseDict[@"data"][0]];
            HttpResultModel *result = [HttpResultModel getSuccessInstance:model];
            dispatch_async(dispatch_get_main_queue(), ^{
                completeBlock(result);
                
            });
        } else {
            HttpResultModel *result = [HttpResultModel getWarningWithMsg:responseDict[@"message"]];
            dispatch_async(dispatch_get_main_queue(), ^{
                completeBlock(result);
                
            });
        }
    } errorBlock:^(NSError *error) {
        errorBlock(error);
    } finishedBlock:^(NSError *error) {
        errorBlock(error);
    }];
}


/**
 *  获取验证码
 *
 *  @param phoneNum      手机号码
 *  @param completeBlock 成功
 *  @param errorBlock    失败
 *
 *  @return <#return value description#>
 */
+ (NSURLSessionDataTask *) getVerificationWithPhoneNum:(NSString *)phoneNum
                                              complete:(Complete)completeBlock
                                                 error:(NetWorkErrorBlock)errorBlock {
    NSString *url = [RequestUrlHelper createRequestURL:kBussinessGetVerificationCode];
    NSMutableDictionary *header = [[self class] getDefaultRequestHeader:YES url:url];
    NSDictionary *dic = @{@"phone":phoneNum};
    return [[NetWorkHelper shareManager] postRequest:header body:dic serverAPIURL:url completeBlock:^(NSDictionary *responseDict, NSDictionary *responseHeader) {
        if ([responseDict[@"code"] longValue] == 1) {
            VerificationModel *model = [VerificationModel modelObjectWithDictionary:responseDict[@"data"][0]];
            
            HttpResultModel *result = [HttpResultModel getSuccessInstance:model];
            dispatch_async(dispatch_get_main_queue(), ^{
                completeBlock(result);
                
            });
        } else {
            HttpResultModel *result = [HttpResultModel getWarningWithMsg:responseDict[@"message"]];
            dispatch_async(dispatch_get_main_queue(), ^{
                completeBlock(result);
                
            });
        }
    } errorBlock:^(NSError *error) {
        errorBlock(error);
    } finishedBlock:^(NSError *error) {
        errorBlock(error);
    }];
}


/**
 *  获取标签
 *
 *  @param completeBlock 完成
 *  @param errorBlock    失败
 *
 *  @return <#return value description#>
 */
+ (NSURLSessionDataTask *) getLabelsComplete:(Complete)completeBlock
                                       error:(NetWorkErrorBlock)errorBlock {
    NSString *url = [RequestUrlHelper createRequestURL:kBussinessGetAllLabels];
    NSMutableDictionary *header = [[self class] getDefaultRequestHeader:YES url:url];
    return [[NetWorkHelper shareManager] postRequest:header body:nil serverAPIURL:url completeBlock:^(NSDictionary *responseDict, NSDictionary *responseHeader) {
        if ([responseDict[@"code"] longValue] == 1) {
            NSMutableArray *ary = [NSMutableArray array];
            for (NSDictionary *dic in responseDict[@"data"]) {
                LabelModel *model = [LabelModel modelObjectWithDictionary:dic];
                [ary addObject:model];
            }
            
            HttpResultModel *result = [HttpResultModel getSuccessInstance:ary];
            dispatch_async(dispatch_get_main_queue(), ^{
                completeBlock(result);
                
            });
        } else {
            HttpResultModel *result = [HttpResultModel getWarningWithMsg:responseDict[@"message"]];
            dispatch_async(dispatch_get_main_queue(), ^{
                completeBlock(result);
                
            });
        }
    } errorBlock:^(NSError *error) {
        errorBlock(error);
    } finishedBlock:^(NSError *error) {
        errorBlock(error);
    }];
}


/**
 *   修改密码
 *
 *  @param dic           参数
 *  @param completeBlock 完成
 *  @param errorBlock    失败
 *
 *  @return <#return value description#>
 */
+ (NSURLSessionDataTask *) changePasswordWithDic:(NSDictionary *)dic
                                        complete:(Complete)completeBlock
                                           error:(NetWorkErrorBlock)errorBlock {
    NSString *url = [RequestUrlHelper createRequestURL:kBussinessMidifyPassword];
    NSMutableDictionary *header = [[self class] getDefaultRequestHeader:YES url:url];
    return [[NetWorkHelper shareManager] postRequest:header body:dic serverAPIURL:url completeBlock:^(NSDictionary *responseDict, NSDictionary *responseHeader) {
        if ([responseDict[@"code"] longValue] == 1) {
            UserInfoModel *model = [UserInfoModel modelObjectWithDictionary:responseDict[@"data"][0]];
            
            HttpResultModel *result = [HttpResultModel getSuccessInstance:model];
            dispatch_async(dispatch_get_main_queue(), ^{
                completeBlock(result);
                
            });
        } else {
            HttpResultModel *result = [HttpResultModel getWarningWithMsg:responseDict[@"message"]];
            dispatch_async(dispatch_get_main_queue(), ^{
                completeBlock(result);
                
            });
        }
    } errorBlock:^(NSError *error) {
        errorBlock(error);
    } finishedBlock:^(NSError *error) {
        errorBlock(error);
    }];

}


/**
 *  获取个人信息
 *
 *  @param dic           参数
 *  @param completeBlock 完成
 *  @param errorBlock    失败
 *
 *  @return <#return value description#>
 */
+ (NSURLSessionDataTask *) getUserInfoWithDic:(NSDictionary *)dic
                                     complete:(Complete)completeBlock
                                        error:(NetWorkErrorBlock)errorBlock {
    NSString *url = [RequestUrlHelper createRequestURL:kBussinessGetUserInfo];
    NSMutableDictionary *header = [[self class] getDefaultRequestHeader:YES url:url];
    return [[NetWorkHelper shareManager] postRequest:header body:dic serverAPIURL:url completeBlock:^(NSDictionary *responseDict, NSDictionary *responseHeader) {
        if ([responseDict[@"code"] longValue] == 1) {
            UserInfoModel *model = [UserInfoModel modelObjectWithDictionary:responseDict[@"data"][0]];
            
            HttpResultModel *result = [HttpResultModel getSuccessInstance:model];
            dispatch_async(dispatch_get_main_queue(), ^{
                completeBlock(result);
                
            });
        } else {
            HttpResultModel *result = [HttpResultModel getWarningWithMsg:responseDict[@"message"]];
            dispatch_async(dispatch_get_main_queue(), ^{
                completeBlock(result);
                
            });
        }
    } errorBlock:^(NSError *error) {
        errorBlock(error);
    } finishedBlock:^(NSError *error) {
        errorBlock(error);
    }];
}
@end
