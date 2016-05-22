//
//  ProductProvider.h
//  Iwanna
//
//  Created by fuyuan on 5/22/16.
//  Copyright © 2016 Iwanna. All rights reserved.
//

#import "BaseProvider.h"

@interface ProductProvider : BaseProvider

//获取品牌、区域经销商、码头与俱乐部-产品列表
+ (NSURLSessionDataTask *) getProductListWithParam:(NSDictionary *)param
                        complete:(Complete)completeBlock
                           error:(NetWorkErrorBlock)errorBlock;

/**
 *  获取产品类型列表
 */

+ (NSURLSessionDataTask *) getProductTypeListWithParam:(NSDictionary *)param
                                              complete:(Complete)completeBlock
                                                 error:(NetWorkErrorBlock)errorBlock;

/**
 *  获取产品明细
 */
@end
