//
//  UserInfoModel.h
//
//  Created by 晨 符 on 5/10/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface UserInfoModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *androidDeviceId;
@property (nonatomic, strong) NSString *introduce;
@property (nonatomic, strong) NSString *birthday;
@property (nonatomic, strong) NSString *createby;
@property (nonatomic, strong) NSString *updateby;
@property (nonatomic, strong) NSString *ids;
@property (nonatomic, strong) NSString *logoImgPath;
@property (nonatomic, strong) NSString *updatedate;
@property (nonatomic, strong) NSString *interest;
@property (nonatomic, strong) NSString *keywords;
@property (nonatomic, strong) NSString *locationY;
@property (nonatomic, assign) double version;
@property (nonatomic, strong) NSString *userIds;
@property (nonatomic, strong) NSString *locationX;
@property (nonatomic, strong) NSString *delflag;
@property (nonatomic, strong) NSString *provinceCity;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double gender;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *label;
@property (nonatomic, assign) double serviceLevel;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *wx;
@property (nonatomic, strong) NSString *remarks;
@property (nonatomic, strong) NSString *createdate;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *qq;
@property (nonatomic, strong) NSString *isoDeviceId;
@property (nonatomic, strong) NSString *content;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;
+ (UserInfoModel *)shareUserModel;
- (void) setContentWithDic:(NSDictionary *)dict;
@end

