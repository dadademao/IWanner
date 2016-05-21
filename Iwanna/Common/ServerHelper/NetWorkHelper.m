//
//  NetWorkHelper.m
//  Customer
//
//  Created by fuyuan on 4/8/16.
//  Copyright © 2016 yangyiyao. All rights reserved.
//
#import "NetWorkHelper.h"
@implementation NetWorkHelper
//管理请求
+ (NetWorkHelper *) shareManager {
    static NetWorkHelper *_helper = nil;
    static dispatch_once_t onceQuetue;
    dispatch_once(&onceQuetue, ^{
#pragma mark -
#pragma mark - TODO
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _helper = [[NetWorkHelper alloc] initWithSessionConfiguration:configuration];
        _helper.requestSerializer  = [AFJSONRequestSerializer serializer];
//
        _helper.responseSerializer = [AFJSONResponseSerializer serializer];
        _helper.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];;

        _helper.requestSerializer.timeoutInterval = 15;
    });
    return _helper;
}

- (void)setCustomHeader:(NSString *) url header:(NSDictionary *) header {
    if(header !=nil){
        for(NSString *key in header.allKeys){
            [[NetWorkHelper shareManager].requestSerializer setValue:header[key] forHTTPHeaderField:key];
            
        }
      

    }
}

//获取响应头
- (NSDictionary *)getResponseHeader:(NSURLResponse *)operation {
    
    if(!operation){
        return [NSDictionary dictionary];
    }
    if ([operation respondsToSelector:@selector(allHeaderFields)]) {
        return [(NSHTTPURLResponse *)operation allHeaderFields];
    } else {
        return [NSDictionary dictionary];
    }
    
}


//post
- (NSURLSessionDataTask *)postRequest:(NSDictionary *)header
                                    body:(NSDictionary *)body
                            serverAPIURL:(NSString *)serverAPIURL
                           completeBlock:(NetWorkSucceedBlock)completeBlock
                              errorBlock:(NetWorkErrorBlock)errorBlock
                           finishedBlock:(NetWorkErrorBlock)finishedBlock {

    [[NetWorkHelper shareManager] setCustomHeader:serverAPIURL header:header];
    NSMutableURLRequest *request =  [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:serverAPIURL parameters:body error:nil];
    
    NSURLSessionDataTask *dataTask =   [[NetWorkHelper shareManager] dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (error) {
           NSLog(@"Error: %@", error);
        } else {
            completeBlock(responseObject,[[NetWorkHelper shareManager] getResponseHeader:response]);
        }
         
    }];
    [dataTask resume];
    return  dataTask;

}

//get
- (NSURLSessionDataTask *)getRequest:(NSDictionary *)header
                           serverAPIURL:(NSString *)serverAPIURL
                          completeBlock:(NetWorkSucceedBlock)completeBlock
                             errorBlock:(NetWorkErrorBlock)errorBlock
                          finishedBlock:(NetWorkErrorBlock)finishedBlock {

    [[NetWorkHelper shareManager] setCustomHeader:serverAPIURL header:header];
    NSMutableURLRequest *request =  [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:serverAPIURL parameters:nil error:nil];
    
    NSURLSessionDataTask *dataTask =   [[NetWorkHelper shareManager] dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            completeBlock(responseObject,[[NetWorkHelper shareManager] getResponseHeader:response]);
        }
        
    } ];
    [dataTask resume];
    return  dataTask;
    
}


//Multipart post
- (NSURLSessionDataTask *)multiPartPostRequest:(NSDictionary *)header
                                 body:(NSDictionary *)body
                            imageData:(NSData *)imageData
                         serverAPIURL:(NSString *)serverAPIURL
                        completeBlock:(NetWorkSucceedBlock)completeBlock
                           errorBlock:(NetWorkErrorBlock)errorBlock
                        finishedBlock:(NetWorkErrorBlock)finishedBlock {
    
    [[NetWorkHelper shareManager] setCustomHeader:serverAPIURL header:header];
    NSMutableURLRequest *request =  [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:serverAPIURL parameters:body constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (imageData) {
            [formData appendPartWithFileData:imageData name:@"file" fileName:@"image.jpg" mimeType:@"image/jpeg"];
        }
    } error:nil];
    
    
    NSURLSessionDataTask *dataTask =   [[NetWorkHelper shareManager] dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            completeBlock(responseObject,[[NetWorkHelper shareManager] getResponseHeader:response]);
        }
        
    }];
    [dataTask resume];
    return  dataTask;
    
}

/**
 *  开始网络请求的状态
 */
+ (void)startNetworkActivity {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

/**
 *  关闭网络请求的状态
 */
+ (void)stopNetworkActivity {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}
@end
