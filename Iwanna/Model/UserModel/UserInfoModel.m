//
//  UserInfoModel.m
//
//  Created by 晨 符 on 5/10/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "UserInfoModel.h"


NSString *const kUserInfoModelAndroidDeviceId = @"android_device_id";
NSString *const kUserInfoModelIntroduce = @"introduce";
NSString *const kUserInfoModelBirthday = @"birthday";
NSString *const kUserInfoModelCreateby = @"createby";
NSString *const kUserInfoModelUpdateby = @"updateby";
NSString *const kUserInfoModelIds = @"ids";
NSString *const kUserInfoModelLogoImgPath = @"logo_img_path";
NSString *const kUserInfoModelUpdatedate = @"updatedate";
NSString *const kUserInfoModelInterest = @"interest";
NSString *const kUserInfoModelKeywords = @"keywords";
NSString *const kUserInfoModelLocationY = @"location_y";
NSString *const kUserInfoModelVersion = @"version";
NSString *const kUserInfoModelUserIds = @"user_ids";
NSString *const kUserInfoModelLocationX = @"location_x";
NSString *const kUserInfoModelDelflag = @"delflag";
NSString *const kUserInfoModelProvinceCity = @"province_city";
NSString *const kUserInfoModelName = @"name";
NSString *const kUserInfoModelGender = @"gender";
NSString *const kUserInfoModelEmail = @"email";
NSString *const kUserInfoModelLabel = @"label";
NSString *const kUserInfoModelServiceLevel = @"service_level";
NSString *const kUserInfoModelPhone = @"phone";
NSString *const kUserInfoModelWx = @"wx";
NSString *const kUserInfoModelRemarks = @"remarks";
NSString *const kUserInfoModelCreatedate = @"createdate";
NSString *const kUserInfoModelPassword = @"password";
NSString *const kUserInfoModelQq = @"qq";
NSString *const kUserInfoModelIsoDeviceId = @"iso_device_id";
NSString *const kUserInfoModelContent = @"content";

static UserInfoModel *myUserModel;

@interface UserInfoModel ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation UserInfoModel

@synthesize androidDeviceId = _androidDeviceId;
@synthesize introduce = _introduce;
@synthesize birthday = _birthday;
@synthesize createby = _createby;
@synthesize updateby = _updateby;
@synthesize ids = _ids;
@synthesize logoImgPath = _logoImgPath;
@synthesize updatedate = _updatedate;
@synthesize interest = _interest;
@synthesize keywords = _keywords;
@synthesize locationY = _locationY;
@synthesize version = _version;
@synthesize userIds = _userIds;
@synthesize locationX = _locationX;
@synthesize delflag = _delflag;
@synthesize provinceCity = _provinceCity;
@synthesize name = _name;
@synthesize gender = _gender;
@synthesize email = _email;
@synthesize label = _label;
@synthesize serviceLevel = _serviceLevel;
@synthesize phone = _phone;
@synthesize wx = _wx;
@synthesize remarks = _remarks;
@synthesize createdate = _createdate;
@synthesize password = _password;
@synthesize qq = _qq;
@synthesize isoDeviceId = _isoDeviceId;
@synthesize content = _content;

+ (UserInfoModel *)shareUserModel {
    static dispatch_once_t t;
    dispatch_once(&t, ^{
        myUserModel = [[UserInfoModel alloc] init];
    });
    return myUserModel;
}

- (void) setContentWithDic:(NSDictionary *)dict {
    if([dict isKindOfClass:[NSDictionary class]]) {
        self.androidDeviceId = [self objectOrNilForKey:kUserInfoModelAndroidDeviceId fromDictionary:dict];
        self.introduce = [self objectOrNilForKey:kUserInfoModelIntroduce fromDictionary:dict];
        self.birthday = [self objectOrNilForKey:kUserInfoModelBirthday fromDictionary:dict];
        self.createby = [self objectOrNilForKey:kUserInfoModelCreateby fromDictionary:dict];
        self.updateby = [self objectOrNilForKey:kUserInfoModelUpdateby fromDictionary:dict];
        self.ids = [self objectOrNilForKey:kUserInfoModelIds fromDictionary:dict];
        self.logoImgPath = [self objectOrNilForKey:kUserInfoModelLogoImgPath fromDictionary:dict];
        self.updatedate = [self objectOrNilForKey:kUserInfoModelUpdatedate fromDictionary:dict];
        self.interest = [self objectOrNilForKey:kUserInfoModelInterest fromDictionary:dict];
        self.keywords = [self objectOrNilForKey:kUserInfoModelKeywords fromDictionary:dict];
        self.locationY = [self objectOrNilForKey:kUserInfoModelLocationY fromDictionary:dict];
        self.version = [[self objectOrNilForKey:kUserInfoModelVersion fromDictionary:dict] doubleValue];
        self.userIds = [self objectOrNilForKey:kUserInfoModelUserIds fromDictionary:dict];
        self.locationX = [self objectOrNilForKey:kUserInfoModelLocationX fromDictionary:dict];
        self.delflag = [self objectOrNilForKey:kUserInfoModelDelflag fromDictionary:dict];
        self.provinceCity = [self objectOrNilForKey:kUserInfoModelProvinceCity fromDictionary:dict];
        self.name = [self objectOrNilForKey:kUserInfoModelName fromDictionary:dict];
        self.gender = [[self objectOrNilForKey:kUserInfoModelGender fromDictionary:dict] doubleValue];
        self.email = [self objectOrNilForKey:kUserInfoModelEmail fromDictionary:dict];
        self.label = [self objectOrNilForKey:kUserInfoModelLabel fromDictionary:dict];
        self.serviceLevel = [[self objectOrNilForKey:kUserInfoModelServiceLevel fromDictionary:dict] doubleValue];
        self.phone = [self objectOrNilForKey:kUserInfoModelPhone fromDictionary:dict];
        self.wx = [self objectOrNilForKey:kUserInfoModelWx fromDictionary:dict];
        self.remarks = [self objectOrNilForKey:kUserInfoModelRemarks fromDictionary:dict];
        self.createdate = [self objectOrNilForKey:kUserInfoModelCreatedate fromDictionary:dict];
        self.password = [self objectOrNilForKey:kUserInfoModelPassword fromDictionary:dict];
        self.qq = [self objectOrNilForKey:kUserInfoModelQq fromDictionary:dict];
        self.isoDeviceId = [self objectOrNilForKey:kUserInfoModelIsoDeviceId fromDictionary:dict];
        self.content = [self objectOrNilForKey:kUserInfoModelContent fromDictionary:dict];
        
    }
}

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.androidDeviceId = [self objectOrNilForKey:kUserInfoModelAndroidDeviceId fromDictionary:dict];
            self.introduce = [self objectOrNilForKey:kUserInfoModelIntroduce fromDictionary:dict];
            self.birthday = [self objectOrNilForKey:kUserInfoModelBirthday fromDictionary:dict];
            self.createby = [self objectOrNilForKey:kUserInfoModelCreateby fromDictionary:dict];
            self.updateby = [self objectOrNilForKey:kUserInfoModelUpdateby fromDictionary:dict];
            self.ids = [self objectOrNilForKey:kUserInfoModelIds fromDictionary:dict];
            self.logoImgPath = [self objectOrNilForKey:kUserInfoModelLogoImgPath fromDictionary:dict];
            self.updatedate = [self objectOrNilForKey:kUserInfoModelUpdatedate fromDictionary:dict];
            self.interest = [self objectOrNilForKey:kUserInfoModelInterest fromDictionary:dict];
            self.keywords = [self objectOrNilForKey:kUserInfoModelKeywords fromDictionary:dict];
            self.locationY = [self objectOrNilForKey:kUserInfoModelLocationY fromDictionary:dict];
            self.version = [[self objectOrNilForKey:kUserInfoModelVersion fromDictionary:dict] doubleValue];
            self.userIds = [self objectOrNilForKey:kUserInfoModelUserIds fromDictionary:dict];
            self.locationX = [self objectOrNilForKey:kUserInfoModelLocationX fromDictionary:dict];
            self.delflag = [self objectOrNilForKey:kUserInfoModelDelflag fromDictionary:dict];
            self.provinceCity = [self objectOrNilForKey:kUserInfoModelProvinceCity fromDictionary:dict];
            self.name = [self objectOrNilForKey:kUserInfoModelName fromDictionary:dict];
            self.gender = [[self objectOrNilForKey:kUserInfoModelGender fromDictionary:dict] doubleValue];
            self.email = [self objectOrNilForKey:kUserInfoModelEmail fromDictionary:dict];
            self.label = [self objectOrNilForKey:kUserInfoModelLabel fromDictionary:dict];
            self.serviceLevel = [[self objectOrNilForKey:kUserInfoModelServiceLevel fromDictionary:dict] doubleValue];
            self.phone = [self objectOrNilForKey:kUserInfoModelPhone fromDictionary:dict];
            self.wx = [self objectOrNilForKey:kUserInfoModelWx fromDictionary:dict];
            self.remarks = [self objectOrNilForKey:kUserInfoModelRemarks fromDictionary:dict];
            self.createdate = [self objectOrNilForKey:kUserInfoModelCreatedate fromDictionary:dict];
            self.password = [self objectOrNilForKey:kUserInfoModelPassword fromDictionary:dict];
            self.qq = [self objectOrNilForKey:kUserInfoModelQq fromDictionary:dict];
            self.isoDeviceId = [self objectOrNilForKey:kUserInfoModelIsoDeviceId fromDictionary:dict];
            self.content = [self objectOrNilForKey:kUserInfoModelContent fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.androidDeviceId forKey:kUserInfoModelAndroidDeviceId];
    [mutableDict setValue:self.introduce forKey:kUserInfoModelIntroduce];
    [mutableDict setValue:self.birthday forKey:kUserInfoModelBirthday];
    [mutableDict setValue:self.createby forKey:kUserInfoModelCreateby];
    [mutableDict setValue:self.updateby forKey:kUserInfoModelUpdateby];
    [mutableDict setValue:self.ids forKey:kUserInfoModelIds];
    [mutableDict setValue:self.logoImgPath forKey:kUserInfoModelLogoImgPath];
    [mutableDict setValue:self.updatedate forKey:kUserInfoModelUpdatedate];
    [mutableDict setValue:self.interest forKey:kUserInfoModelInterest];
    [mutableDict setValue:self.keywords forKey:kUserInfoModelKeywords];
    [mutableDict setValue:self.locationY forKey:kUserInfoModelLocationY];
    [mutableDict setValue:[NSNumber numberWithDouble:self.version] forKey:kUserInfoModelVersion];
    [mutableDict setValue:self.userIds forKey:kUserInfoModelUserIds];
    [mutableDict setValue:self.locationX forKey:kUserInfoModelLocationX];
    [mutableDict setValue:self.delflag forKey:kUserInfoModelDelflag];
    [mutableDict setValue:self.provinceCity forKey:kUserInfoModelProvinceCity];
    [mutableDict setValue:self.name forKey:kUserInfoModelName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.gender] forKey:kUserInfoModelGender];
    [mutableDict setValue:self.email forKey:kUserInfoModelEmail];
    [mutableDict setValue:self.label forKey:kUserInfoModelLabel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.serviceLevel] forKey:kUserInfoModelServiceLevel];
    [mutableDict setValue:self.phone forKey:kUserInfoModelPhone];
    [mutableDict setValue:self.wx forKey:kUserInfoModelWx];
    [mutableDict setValue:self.remarks forKey:kUserInfoModelRemarks];
    [mutableDict setValue:self.createdate forKey:kUserInfoModelCreatedate];
    [mutableDict setValue:self.password forKey:kUserInfoModelPassword];
    [mutableDict setValue:self.qq forKey:kUserInfoModelQq];
    [mutableDict setValue:self.isoDeviceId forKey:kUserInfoModelIsoDeviceId];
    [mutableDict setValue:self.content forKey:kUserInfoModelContent];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.androidDeviceId = [aDecoder decodeObjectForKey:kUserInfoModelAndroidDeviceId];
    self.introduce = [aDecoder decodeObjectForKey:kUserInfoModelIntroduce];
    self.birthday = [aDecoder decodeObjectForKey:kUserInfoModelBirthday];
    self.createby = [aDecoder decodeObjectForKey:kUserInfoModelCreateby];
    self.updateby = [aDecoder decodeObjectForKey:kUserInfoModelUpdateby];
    self.ids = [aDecoder decodeObjectForKey:kUserInfoModelIds];
    self.logoImgPath = [aDecoder decodeObjectForKey:kUserInfoModelLogoImgPath];
    self.updatedate = [aDecoder decodeObjectForKey:kUserInfoModelUpdatedate];
    self.interest = [aDecoder decodeObjectForKey:kUserInfoModelInterest];
    self.keywords = [aDecoder decodeObjectForKey:kUserInfoModelKeywords];
    self.locationY = [aDecoder decodeObjectForKey:kUserInfoModelLocationY];
    self.version = [aDecoder decodeDoubleForKey:kUserInfoModelVersion];
    self.userIds = [aDecoder decodeObjectForKey:kUserInfoModelUserIds];
    self.locationX = [aDecoder decodeObjectForKey:kUserInfoModelLocationX];
    self.delflag = [aDecoder decodeObjectForKey:kUserInfoModelDelflag];
    self.provinceCity = [aDecoder decodeObjectForKey:kUserInfoModelProvinceCity];
    self.name = [aDecoder decodeObjectForKey:kUserInfoModelName];
    self.gender = [aDecoder decodeDoubleForKey:kUserInfoModelGender];
    self.email = [aDecoder decodeObjectForKey:kUserInfoModelEmail];
    self.label = [aDecoder decodeObjectForKey:kUserInfoModelLabel];
    self.serviceLevel = [aDecoder decodeDoubleForKey:kUserInfoModelServiceLevel];
    self.phone = [aDecoder decodeObjectForKey:kUserInfoModelPhone];
    self.wx = [aDecoder decodeObjectForKey:kUserInfoModelWx];
    self.remarks = [aDecoder decodeObjectForKey:kUserInfoModelRemarks];
    self.createdate = [aDecoder decodeObjectForKey:kUserInfoModelCreatedate];
    self.password = [aDecoder decodeObjectForKey:kUserInfoModelPassword];
    self.qq = [aDecoder decodeObjectForKey:kUserInfoModelQq];
    self.isoDeviceId = [aDecoder decodeObjectForKey:kUserInfoModelIsoDeviceId];
    self.content = [aDecoder decodeObjectForKey:kUserInfoModelContent];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_androidDeviceId forKey:kUserInfoModelAndroidDeviceId];
    [aCoder encodeObject:_introduce forKey:kUserInfoModelIntroduce];
    [aCoder encodeObject:_birthday forKey:kUserInfoModelBirthday];
    [aCoder encodeObject:_createby forKey:kUserInfoModelCreateby];
    [aCoder encodeObject:_updateby forKey:kUserInfoModelUpdateby];
    [aCoder encodeObject:_ids forKey:kUserInfoModelIds];
    [aCoder encodeObject:_logoImgPath forKey:kUserInfoModelLogoImgPath];
    [aCoder encodeObject:_updatedate forKey:kUserInfoModelUpdatedate];
    [aCoder encodeObject:_interest forKey:kUserInfoModelInterest];
    [aCoder encodeObject:_keywords forKey:kUserInfoModelKeywords];
    [aCoder encodeObject:_locationY forKey:kUserInfoModelLocationY];
    [aCoder encodeDouble:_version forKey:kUserInfoModelVersion];
    [aCoder encodeObject:_userIds forKey:kUserInfoModelUserIds];
    [aCoder encodeObject:_locationX forKey:kUserInfoModelLocationX];
    [aCoder encodeObject:_delflag forKey:kUserInfoModelDelflag];
    [aCoder encodeObject:_provinceCity forKey:kUserInfoModelProvinceCity];
    [aCoder encodeObject:_name forKey:kUserInfoModelName];
    [aCoder encodeDouble:_gender forKey:kUserInfoModelGender];
    [aCoder encodeObject:_email forKey:kUserInfoModelEmail];
    [aCoder encodeObject:_label forKey:kUserInfoModelLabel];
    [aCoder encodeDouble:_serviceLevel forKey:kUserInfoModelServiceLevel];
    [aCoder encodeObject:_phone forKey:kUserInfoModelPhone];
    [aCoder encodeObject:_wx forKey:kUserInfoModelWx];
    [aCoder encodeObject:_remarks forKey:kUserInfoModelRemarks];
    [aCoder encodeObject:_createdate forKey:kUserInfoModelCreatedate];
    [aCoder encodeObject:_password forKey:kUserInfoModelPassword];
    [aCoder encodeObject:_qq forKey:kUserInfoModelQq];
    [aCoder encodeObject:_isoDeviceId forKey:kUserInfoModelIsoDeviceId];
    [aCoder encodeObject:_content forKey:kUserInfoModelContent];
}

- (id)copyWithZone:(NSZone *)zone
{
    UserInfoModel *copy = [[UserInfoModel alloc] init];
    
    if (copy) {

        copy.androidDeviceId = [self.androidDeviceId copyWithZone:zone];
        copy.introduce = [self.introduce copyWithZone:zone];
        copy.birthday = [self.birthday copyWithZone:zone];
        copy.createby = [self.createby copyWithZone:zone];
        copy.updateby = [self.updateby copyWithZone:zone];
        copy.ids = [self.ids copyWithZone:zone];
        copy.logoImgPath = [self.logoImgPath copyWithZone:zone];
        copy.updatedate = [self.updatedate copyWithZone:zone];
        copy.interest = [self.interest copyWithZone:zone];
        copy.keywords = [self.keywords copyWithZone:zone];
        copy.locationY = [self.locationY copyWithZone:zone];
        copy.version = self.version;
        copy.userIds = [self.userIds copyWithZone:zone];
        copy.locationX = [self.locationX copyWithZone:zone];
        copy.delflag = [self.delflag copyWithZone:zone];
        copy.provinceCity = [self.provinceCity copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.gender = self.gender;
        copy.email = [self.email copyWithZone:zone];
        copy.label = [self.label copyWithZone:zone];
        copy.serviceLevel = self.serviceLevel;
        copy.phone = [self.phone copyWithZone:zone];
        copy.wx = [self.wx copyWithZone:zone];
        copy.remarks = [self.remarks copyWithZone:zone];
        copy.createdate = [self.createdate copyWithZone:zone];
        copy.password = [self.password copyWithZone:zone];
        copy.qq = [self.qq copyWithZone:zone];
        copy.isoDeviceId = [self.isoDeviceId copyWithZone:zone];
        copy.content = [self.content copyWithZone:zone];
    }
    
    return copy;
}



@end
