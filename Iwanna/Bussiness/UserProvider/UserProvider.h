//
//  UserProvider.h
//  Iwanna
//
//  Created by fuyuan on 5/10/16.
//  Copyright © 2016 Iwanna. All rights reserved.
//

#import "BaseProvider.h"

@interface UserProvider : BaseProvider

/**
 *  注册接口
 *
 *  @param dic           注册信息参数
 *  @param compelteBlock 完成
 *  @param errorBlock    失败
 */
+ (NSURLSessionDataTask *) registWithDic:(NSDictionary *)dic
              complete:(Complete)compelteBlock
                 error:(NetWorkErrorBlock)errorBlock;

@end
