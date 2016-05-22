//
//  DescoverProvider.m
//  Iwanna
//
//  Created by fuyuan on 5/12/16.
//  Copyright © 2016 Iwanna. All rights reserved.
//

#import "DescoverProvider.h"
#import "DescoverHomeModel.h"
#import "BaseNewestModel.h"
@implementation DescoverProvider


/**
 *  获取发现主页数据
 *  @param dic     请求数据
 *  @param completeBlock 完成
 *  @param errorBlock    失败
 *
 *  @return <#return value description#>
 */
+ (NSURLSessionDataTask *) getDescoverHomeViewWithDic:(NSDictionary *)dic
                                             Complete:(Complete)completeBlock
                                                error:(NetWorkErrorBlock)errorBlock {
    NSString *url = [RequestUrlHelper createRequestURL:kBussinessGetDescoverHome];
    NSMutableDictionary *header = [[self class] getDefaultRequestHeader:YES url:url];
    return [[NetWorkHelper shareManager] postRequest:header body:dic serverAPIURL:url completeBlock:^(NSDictionary *responseDict, NSDictionary *responseHeader) {
        if ([responseDict[@"code"] longValue] == 1) {
            DescoverHomeModel *model = [DescoverHomeModel modelObjectWithDictionary:responseDict[@"data"][0]];
            
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
 *  获取新鲜事
 *
 *  @param dic           请求参数
 *  @param completeBlock 完成
 *  @param errorBlock    失败
 *
 *  @return <#return value description#>
 */
+ (NSURLSessionDataTask *) getNewestListWithDic:(NSDictionary *)dic
                                       complete:(Complete)completeBlock
                                          error:(NetWorkErrorBlock)errorBlock {
    NSString *url = [RequestUrlHelper createRequestURL:kBussinessGetNewest];
    NSMutableDictionary *header = [[self class] getDefaultRequestHeader:YES url:url];
    return [[NetWorkHelper shareManager] postRequest:header body:dic serverAPIURL:url completeBlock:^(NSDictionary *responseDict, NSDictionary *responseHeader) {
        if ([responseDict[@"code"] longValue] == 1) {
            NSDictionary *newsDic = @{@"NewestModel":responseDict[@"data"]};
            BaseNewestModel *model = [BaseNewestModel modelObjectWithDictionary:newsDic];
            
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
