//
//  AppDelegate.m
//  Iwanna
//
//  Created by apple on 15/12/26.
//  Copyright © 2015年 Iwanna. All rights reserved.
//

#import "AppDelegate.h"
#import "IWTabBarController.h"
#import "IWLoginController.h"
#import "UserProvider.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setNavigationBarStyle];
    // 统一设置状态栏外观
    application.statusBarStyle = UIStatusBarStyleLightContent;
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    if (0) {
        self.window.rootViewController = [[IWLoginController alloc] init];
    }else{
        self.window.rootViewController = [[IWTabBarController alloc] init];
    }
    // 设置环信
//    [[EaseMob sharedInstance] registerSDKWithAppKey:@"yikai#yikaidemo" apnsCertName:nil];
//    [[EaseMob sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];

    
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

// 统一设置导航栏外观
- (void)setNavigationBarStyle{
    // appearance方法返回当前控件的外观代理对象,只要修改了这个控件的外观代理对象的"外观",那么当前app中所有这类型的控件的外观都改了
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];

    // 设置装有属性的字典
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSBackgroundColorAttributeName] = YKMainColor;
    attributes[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attributes[NSFontAttributeName] = SYS_FONT(18);
    // 把字典里的属性设置为导航栏中的标题文字
    [navBar setTitleTextAttributes:attributes];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

// App进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
//    [[EaseMob sharedInstance] applicationDidEnterBackground:application];
}

// App将要从后台返回
- (void)applicationWillEnterForeground:(UIApplication *)application {
//    [[EaseMob sharedInstance] applicationWillEnterForeground:application];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

// 申请处理时间
- (void)applicationWillTerminate:(UIApplication *)application {
//    [[EaseMob sharedInstance] applicationWillTerminate:application];
}

@end
