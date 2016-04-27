//
//  MALTabBarViewController.h
//  TabBarControllerModel
//
//  Created by wangtian on 14-6-25.
//  Copyright (c) 2014年 wangtian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MALTabBar.h"
#import "MALTabBarChinldVIewControllerDelegate.h"
@interface MALTabBarViewController : UIViewController <UIViewControllerTransitioningDelegate,MALTabBarChinldVIewControllerDelegate>

@property (nonatomic, strong) NSArray *itemsArray;
@property (nonatomic, strong) MALTabBar *tabBar;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIViewController *currentViewController;//当前被选中controller
@property (nonatomic, assign) id<MALTabBarChinldVIewControllerDelegate>delegate;
@property (nonatomic, assign) NSInteger currentIndex;

- (id)initWithItemModels:(NSArray *)itemModelArray;
- (id)initWithItemModels:(NSArray *)itemModelArray defaultSelectedIndex:(NSInteger)defaultSelectedIndex;
- (void)setTabBarBgImage:(NSString *)imageName;
- (void)selectItemWithIndex:(NSInteger)index;
@end
