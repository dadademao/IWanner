//
//  IWNavigationController.m
//  Iwanna
//
//  Created by apple on 15/12/26.
//  Copyright © 2015年 Iwanna. All rights reserved.
//

#import "IWNavigationController.h"

@interface IWNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation IWNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
<<<<<<< HEAD
    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];

=======
    
//    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
//    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
>>>>>>> kingwang
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    self.navigationBar.titleTextAttributes = dict;
}

- (void)viewDidAppear:(BOOL)animated{
    __weak typeof(self) weakSelf = self;
    self.interactivePopGestureRecognizer.delegate = weakSelf;
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer*)gestureRecognizer{
    //判断是否为rootViewController
    if (self && self.viewControllers.count == 1) {
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    NSString *title = @"返回";
    // 如果执行到这个地方,判断里面有一个控制器的话,代码当家要往导航控制里面push的是第二个控制器
    if (self.childViewControllers.count >= 1) {
        
//        if (self.childViewControllers.count == 1) {
//            title = [[self.childViewControllers firstObject] title];
//        }
        
        // 隐藏底部tabBar
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigation_back" target:self action:@selector(leftBarButtonItemClick:)];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)leftBarButtonItemClick:(UIBarButtonItem *)item{
    [self popViewControllerAnimated:YES];
}

@end
