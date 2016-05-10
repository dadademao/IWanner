//
//  UserProvider.m
//  Iwanna
//
//  Created by fuyuan on 5/10/16.
//  Copyright © 2016 Iwanna. All rights reserved.
//

#import "UserProvider.h"
#import "RequestUrlHelper.h"
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
            HttpResultModel *result = [HttpResultModel getSuccessInstance:responseDict[@"data"]];
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
            HttpResultModel *result = [HttpResultModel getSuccessInstance:responseDict[@"data"]];
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
