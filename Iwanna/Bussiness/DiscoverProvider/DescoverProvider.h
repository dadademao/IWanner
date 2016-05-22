//
//  DescoverProvider.h
//  Iwanna
//
//  Created by fuyuan on 5/12/16.
//  Copyright © 2016 Iwanna. All rights reserved.
//

#import "BaseProvider.h"

@interface DescoverProvider : BaseProvider

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
                                                error:(NetWorkErrorBlock)errorBlock;


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
                                          error:(NetWorkErrorBlock)errorBlock;




@end
