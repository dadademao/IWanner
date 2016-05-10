//
//  OJMeCollectController.m
//  Iwanna
//
//  Created by One'J on 16/5/3.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "OJMeCollectController.h"
#import "OJBaseViewController.h"

@interface OJMeCollectController ()

@end

@implementation OJMeCollectController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化所有子控制器
    [self setupAllChlidController];
    
    //设置导航条
    [self setupNav];
    
    
    
    
}

#pragma mark ---------------
#pragma mark 初始化所有子控制器
-(void)setupAllChlidController
{
    [self addChildViewController:[[OJBaseViewController alloc]init]];
    
    
}

-(void)setupNav {
    self.navigationItem.titleView = nil;
    self.navigationItem.title = @"我的收藏";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigation_back" target:self action:@selector(leftBarButtonItemClick:)];
}

- (void)leftBarButtonItemClick:(UIBarButtonItem *)item{
    NSLog(@"123");
    [self dismissViewControllerAnimated:YES completion:nil];
}




@end
