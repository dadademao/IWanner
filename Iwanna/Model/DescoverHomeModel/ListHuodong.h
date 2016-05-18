//
//  ListHuodong.h
//
//  Created by 晨 符 on 5/12/16
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ListHuodong : NSObject <NSCoding, NSCopying>

@property (nonatomic, copy) NSString *multiPage; //是否多页
@property (nonatomic, copy) NSString *listHuodongDescription; //文章简介
@property (nonatomic, copy) NSString *titleImageUrl; //标题图片
@property (nonatomic, copy) NSString *imageUrl; //图片路径
@property (nonatomic, copy) NSString *url; //链接地址
@property (nonatomic, copy) NSString *seq; //序号
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) int linkType; //链接类型
@property (nonatomic, copy) NSString *type;  //文章类型
@property (nonatomic, copy) NSString *fileName; //附件名称
@property (nonatomic, copy) NSString *fileUrl; //附件路径
@property (nonatomic, copy) NSString *newsIds; //文章编号
@property (nonatomic, assign) int status; //是否可用
@property (nonatomic, copy) NSString *content; //文章内容
@property (nonatomic, copy) NSString *createdate; //时间

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
