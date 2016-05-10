//
//  HttpResultModel.h
//  Customer
//
//  Created by fuyuan on 4/9/16.
//  Copyright © 2016 yangyiyao. All rights reserved.
//

#import "BaseModel.h"

@interface HttpResultModel : BaseModel
@property (assign, nonatomic) BOOL isComplete;
@property (strong, nonatomic) id data;
@property (strong, nonatomic) NSString *message;

+ (instancetype) getSuccessInstance:(id) data;
+ (instancetype) getWarningInstance:(NSString *) msg;
+ (instancetype) getSuccessInstance:(id) data nextCursor:(NSString *)nextCursor;

/**
 *  从错误字典中返回实例
 *
 *  @param data
 *
 *  @return
 */
+ (instancetype)getWarning:(NSDictionary *) data;

+ (instancetype)getWarningWithMsg:(NSString *) msg;

+ (instancetype)getError:(NSError *)error;

@end
