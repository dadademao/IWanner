
//
//  ProductProvider.m
//  Iwanna
//
//  Created by fuyuan on 5/22/16.
//  Copyright © 2016 Iwanna. All rights reserved.
//

#import "ProductProvider.h"
#import "ProductListModel.h"
#import "ProductTypeModel.h"
#import "BrandModel.h"
@implementation ProductProvider
//获取品牌、区域经销商、码头与俱乐部-产品列表
+ (NSURLSessionDataTask *) getProductListWithParam:(NSDictionary *)param
                        complete:(Complete)completeBlock
                           error:(NetWorkErrorBlock)errorBlock {
    NSString *url = [RequestUrlHelper createRequestURL:kBussunessGetProductList];
    NSMutableDictionary *header = [[self class] getDefaultRequestHeader:YES url:url];
    return [[NetWorkHelper shareManager] postRequest:header body:param serverAPIURL:url completeBlock:^(NSDictionary *responseDict, NSDictionary *responseHeader) {
        if ([responseDict[@"code"] longValue] == 1) {
            NSMutableArray *productList = [NSMutableArray array];
            for (NSDictionary *product in responseDict[@"data"]) {
                ProductListModel *model = [ProductListModel modelObjectWithDictionary:product];
                [productList addObject:model];
            }
            
            
            HttpResultModel *result = [HttpResultModel getSuccessInstance:productList];
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
 *  获取产品类型列表
 */

+ (NSURLSessionDataTask *) getProductTypeListWithParam:(NSDictionary *)param
                                              complete:(Complete)completeBlock
                                                 error:(NetWorkErrorBlock)errorBlock {
    NSString *url = [RequestUrlHelper createRequestURL:kBussinessGetProductTypeList];
    NSMutableDictionary *header = [[self class] getDefaultRequestHeader:YES url:url];
    return [[NetWorkHelper shareManager] postRequest:header body:param serverAPIURL:url completeBlock:^(NSDictionary *responseDict, NSDictionary *responseHeader) {
        if ([responseDict[@"code"] longValue] == 1) {
            NSMutableArray *productList = [NSMutableArray array];
            for (NSDictionary *product in responseDict[@"data"]) {
                ProductTypeModel *model = [ProductTypeModel modelObjectWithDictionary:product];
                [productList addObject:model];
            }
            
            
            HttpResultModel *result = [HttpResultModel getSuccessInstance:productList];
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
 *  获取产品类型-品牌列表，对应的商户表、
 *  type：(0-品牌；1-经销商；2-服务商；3-游艇俱乐部；4-飞行俱乐部；5-超跑俱乐部)
 */
+ (NSURLSessionDataTask *) getBrandListWithParam:(NSDictionary *)param
                                        complete:(Complete)completeBlock
                                           error:(NetWorkErrorBlock)errorBlock {
    NSString *url = [RequestUrlHelper createRequestURL:kBussinessGetBrandList];
    NSMutableDictionary *header = [[self class] getDefaultRequestHeader:YES url:url];
    return [[NetWorkHelper shareManager] postRequest:header body:param serverAPIURL:url completeBlock:^(NSDictionary *responseDict, NSDictionary *responseHeader) {
        if ([responseDict[@"code"] longValue] == 1) {
            NSMutableArray *brandList = [NSMutableArray array];
            for (NSDictionary *brand in responseDict[@"data"]) {
                BrandModel *model = [BrandModel modelObjectWithDictionary:brand];
                [brandList addObject:model];
            }
            
            HttpResultModel *result = [HttpResultModel getSuccessInstance:brandList];
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
