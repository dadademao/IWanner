//
//  UserInfoModel.h
//
//  Created by 晨 符 on 5/10/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface UserInfoModel : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id androidDeviceId;
@property (nonatomic, assign) id introduce;
@property (nonatomic, strong) NSString *birthday;
@property (nonatomic, assign) id createby;
@property (nonatomic, assign) id updateby;
@property (nonatomic, strong) NSString *ids;
@property (nonatomic, assign) id logoImgPath;
@property (nonatomic, assign) id updatedate;
@property (nonatomic, assign) id interest;
@property (nonatomic, assign) id keywords;
@property (nonatomic, assign) id locationY;
@property (nonatomic, assign) double version;
@property (nonatomic, assign) id userIds;
@property (nonatomic, assign) id locationX;
@property (nonatomic, strong) NSString *delflag;
@property (nonatomic, strong) NSString *provinceCity;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double gender;
@property (nonatomic, assign) id email;
@property (nonatomic, assign) id label;
@property (nonatomic, assign) double serviceLevel;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, assign) id wx;
@property (nonatomic, assign) id remarks;
@property (nonatomic, strong) NSString *createdate;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, assign) id qq;
@property (nonatomic, assign) id isoDeviceId;
@property (nonatomic, assign) id content;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;
+ (UserInfoModel *)shareUserModel;
- (void) setContentWithDic:(NSDictionary *)dict;
@end

