//
//  IWTabBarControllerViewController.m
//  Iwanna
//
//  Created by apple on 15/12/26.
//  Copyright © 2015年 Iwanna. All rights reserved.
//

#import "IWTabBarController.h"
#import "IWNavigationController.h"
#import "IWMessageController.h"
#import "IWMineController.h"

@interface IWTabBarController ()

@end

@implementation IWTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"addas");
    UIViewController *oneVC = [[UIViewController alloc] init];
    oneVC.view.backgroundColor = [UIColor whiteColor];
    [self addChildViewController:oneVC imageName:@"tempImage" title:@"发现"];
    
    IWMessageController *messageVC = [[IWMessageController alloc] init];
    [self addChildViewController:messageVC imageName:@"tempImage" title:@"消息"];
    
    IWMineController *mineVC = [[IWMineController alloc] init];
    mineVC.plistName = @"IWMine";
    [self addChildViewController:mineVC imageName:@"tempImage" title:@"我的"];
    
}

- (void)addChildViewController:(UIViewController *)childController imageName:(NSString *)imageName title:(NSString *)title{
    
    // 设置默认状态下tabBarItem图片,并且却掉系统对图片的渲染方法
    childController.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置选中状态下tabBarItem图片,并且却掉系统对图片的渲染方法
    childController.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 设置文字
    childController.title = title;
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor orangeColor];
    //设置文字属性
    [childController.tabBarItem setTitleTextAttributes:dict forState:UIControlStateSelected];
    
    IWNavigationController *navController = [[IWNavigationController alloc] initWithRootViewController:childController];
    [self addChildViewController:navController];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
