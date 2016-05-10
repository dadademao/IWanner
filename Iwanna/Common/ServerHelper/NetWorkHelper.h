//
//  NetWorkHelper.h
//  Customer
//
//  Created by fuyuan on 4/8/16.
//  Copyright © 2016 yangyiyao. All rights reserved.
//

#import "AFNetworking.h"


typedef void(^NetWorkErrorBlock)(NSError *error);
typedef void(^NetWorkSucceedBlock)(NSDictionary *responseDict , NSDictionary *responseHeader);

@interface NetWorkHelper : AFHTTPSessionManager

//管理请求
+ (NetWorkHelper *) shareManager;


//post
- (NSURLSessionDataTask *)postRequest:(NSDictionary *)header
                                    body:(NSDictionary *)body
                           serverAPIURL:(NSString *)serverAPIURL
                           completeBlock:(NetWorkSucceedBlock)completeBlock
                              errorBlock:(NetWorkErrorBlock)errorBlock
                           finishedBlock:(NetWorkErrorBlock)finishedBlock;

//get
- (NSURLSessionDataTask *)getRequest:(NSDictionary *)header
                            serverAPIURL:(NSString *)serverAPIURL
                           completeBlock:(NetWorkSucceedBlock)completeBlock
                              errorBlock:(NetWorkErrorBlock)errorBlock
                           finishedBlock:(NetWorkErrorBlock)finishedBlock;

//Multipart post
- (NSURLSessionDataTask *)multiPartPostRequest:(NSDictionary *)header
                                          body:(NSDictionary *)body
                                     imageData:(NSData *)imageData
                                  serverAPIURL:(NSString *)serverAPIURL
                                 completeBlock:(NetWorkSucceedBlock)completeBlock
                                    errorBlock:(NetWorkErrorBlock)errorBlock
                                 finishedBlock:(NetWorkErrorBlock)finishedBlock;
@end
