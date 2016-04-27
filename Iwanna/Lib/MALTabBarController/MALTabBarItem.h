//
//  MALTabBarItem.h
//  TabBarControllerModel
//
//  Created by wangtian on 14-6-25.
//  Copyright (c) 2014年 wangtian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MALTabBarItemModel.h"

#define itemWH 24 //tabBar里按钮的大小
#define itemTitleColor [UIColor blackColor]    //item里标题默认颜色
#define selectedItemTitleColor [UIColor colorWithRed:47/255.f green:160/255.f blue:227/255.f alpha:1]  // item被选中时标题的颜色
#define itemTitleFont [UIFont boldSystemFontOfSize:8]  //item 标题 字体font
#define badgeValueViewImageName @"userinfo_vip_background@2x.png" //小红圈 背景图片名称
#define badgeValueFont [UIFont systemFontOfSize:11]  //小红圈里字体的大小
#define badgeValueColor [UIColor whiteColor] //小红圈里字体的颜色
#define badgeValueViewWH itemWH * 0.4  //小红圈的大小

@interface MALTabBarItem : UIButton
@property (nonatomic, strong) UIButton *badgeValueView;

+ (MALTabBarItem *)getMALTabBarItemWithModel:(MALTabBarItemModel *)itemModel;
- (void)setItemBadgeNumber:(NSInteger)number;
@end
