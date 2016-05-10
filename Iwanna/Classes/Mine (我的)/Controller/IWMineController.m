//
//  IWMineController.m
//  Iwanna
//
//  Created by 易凯 on 16/1/5.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "IWMineController.h"
#import "IWMineHeaderView.h"
#import "OJMeInfomationController.h"
#import "IWNavigationController.h"
#import "OJMeCollectController.h"


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
    NSLog(@"跳转个人信息");
    OJMeInfomationController *meInfoVc = [[OJMeInfomationController alloc]init];
    [self.navigationController presentViewController:[[IWNavigationController alloc] initWithRootViewController:meInfoVc] animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2 && indexPath.section == 0) {
        NSLog(@"我的收藏");
       
        OJMeCollectController *meCollectVC = [[OJMeCollectController alloc]init];

        [self.navigationController presentViewController:[[IWNavigationController alloc] initWithRootViewController:meCollectVC] animated:YES completion:nil];
        

    }
}




@end
