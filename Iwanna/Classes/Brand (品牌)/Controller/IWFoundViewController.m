//
//  IWFoundViewController.m
//  Iwanna
//
//  Created by 易凯 on 16/4/27.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "IWFoundViewController.h"
#import "IWFoundXinxianshi.h"
#import "IWFoundHuodong.h"
#import "IWFoundNewController.h"
#import "IWFoundActivityController.h"
#import "DescoverProvider.h"
#import "DescoverHomeModel.h"

@interface IWFoundViewController () <IWFoundXinxianshiDelegate, IWFoundHuodongDelegate>

@property (nonatomic, weak) IWFoundXinxianshi *xinxianshiView;
@property (nonatomic, weak) IWFoundHuodong *huodongView;
@property (nonatomic, strong) NSArray *listXinxianshi;
@property (nonatomic, strong) NSArray *listHuodong;
@end

@implementation IWFoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"1314");
    [self setNavigation];
    [self addSubViews];
    [self reloadData];
}

- (void)setNavigation{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigation_sort" target:self action:@selector(leftButtonClick:)];
}

- (void)leftButtonClick:(UIBarButtonItem *)item{
    NSLog(@"123");
}

- (void)addSubViews{
    IWFoundXinxianshi *xinxianshiView = [[IWFoundXinxianshi alloc] initWithFrame:CGRectMake(0, 0, SCREENW, (SCREENH - 108) * 0.5)];
    self.xinxianshiView = xinxianshiView;
    xinxianshiView.delegate = self;
    [self.view addSubview:xinxianshiView];
    
    IWFoundHuodong *huodongView = [[IWFoundHuodong alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(xinxianshiView.frame), SCREENW, (SCREENH - 108) * 0.5)];
    self.huodongView = huodongView;
    huodongView.delegate = self;
    [self.view addSubview:huodongView];
}

- (void)xinxianshiMoreButtonClick{
//    IWFoundNewController * newController = [[IWFoundNewController alloc] initWithData:self.dataDict[@"new"]];
//    [self.navigationController pushViewController:newController animated:YES];
}

- (void)huodongMoreButtonClick{
//    IWFoundActivityController * activityController = [[IWFoundActivityController alloc] initWithData:self.dataDict[@"activity"]];
//    [self.navigationController pushViewController:activityController animated:YES];
}

- (void)reloadData{
    NSDictionary *params = @{
                             @"token" : @"79ddddfbc3a8479e98cc5228e6823772_20160510113329",
                             @"u_ids" : @"64016e0f00bb4d709f1f1772e91bb5cb",
                             @"get_rows" : @"1"
                             };
    [DescoverProvider getDescoverHomeViewWithDic:params Complete:^(HttpResultModel *result) {
        if (result.isComplete) {
            DescoverHomeModel *homeModel = result.data;
            self.listXinxianshi = homeModel.listXinxianshi;
            self.listHuodong = homeModel.listHuodong;
            [self setDataSource];
        }
    } error:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)setDataSource{
    self.xinxianshiView.dataArray = self.listXinxianshi;
    self.huodongView.dataArray = self.listHuodong;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
