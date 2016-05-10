//
//  HttpResultModel.m
//  Customer
//
//  Created by fuyuan on 4/9/16.
//  Copyright © 2016 yangyiyao. All rights reserved.
//

#import "HttpResultModel.h"

@implementation HttpResultModel
+ (instancetype)getSuccessInstance:(id) data {
    HttpResultModel *result = [[HttpResultModel alloc] init];
    result.isComplete = YES;
    result.data = data;
    return result;
}

+ (instancetype) getSuccessInstance:(id) data nextCursor:(NSString *)nextCursor {
    HttpResultModel *result = [[self class] getSuccessInstance:data];
    return result;
}

+ (instancetype)getWarningInstance:(NSString *) msg {
    HttpResultModel *result = [[HttpResultModel alloc] init];
    result.isComplete = NO;
    result.message = msg;
    return result;
}

+ (instancetype)getWarning:(NSDictionary *) data {
    HttpResultModel *result = [[HttpResultModel alloc] init];
    result.isComplete = NO;
    result.message = data[@"message"]?data[@"message"]:@"网络请求超时.";
    return result;
}

+ (instancetype)getError:(NSError *)error {
    HttpResultModel *result = [[HttpResultModel alloc] init];
    result.isComplete = NO;
    result.message = @"网络请求错误.";
    result.data = error;
    return result;
}

+ (instancetype)getWarningWithMsg:(NSString *) msg {
    HttpResultModel *result = [[HttpResultModel alloc] init];
    result.isComplete = NO;
    result.message = msg;
    return result;
}
@end
