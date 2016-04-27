//
//  IWMineController.m
//  Iwanna
//
//  Created by 易凯 on 16/1/5.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "IWMineController.h"
#import "IWMineHeaderView.h"

@interface IWMineController () <IWMineHeaderViewDelegate>

@end

@implementation IWMineController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    // 改变状态栏的背景颜色
    UIView *statusBarView=[[UIView alloc] initWithFrame:CGRectMake(0, -20, SCREENW, 20)];
    statusBarView.backgroundColor = YKMainColor;
    [self.view addSubview:statusBarView];
    
    // 隐藏导航栏
    self.navigationController.navigationBar.hidden = YES;
    
    IWMineHeaderView *mineHeaderView = [[IWMineHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREENW, 180)];
    mineHeaderView.delegate = self;
    self.tableView.tableHeaderView = mineHeaderView;
}

- (void)mineHeaderViewClick{
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
