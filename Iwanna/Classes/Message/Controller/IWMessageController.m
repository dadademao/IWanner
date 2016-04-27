//
//  IWMessageController.m
//  Iwanna
//
//  Created by apple on 16/1/3.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "IWMessageController.h"
#import "IWMessageMainView.h"


@interface IWMessageController ()
@property (nonatomic, weak) IWMessageMainView *mainView;
@property (nonatomic, strong) NSArray *bottomViewButtons;
@property (nonatomic, strong) NSArray *topButtons;
@end

@implementation IWMessageController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.bottomViewButtons = @[@"旅游", @"帆船", @"珠宝", @"汽车", @"地产"];
    self.topButtons = @[@"豪华飞机", @"私人飞机", @"超级跑车", @"高级家具", @"高级珠宝"];
    
    self.view.backgroundColor = [UIColor blackColor];
    [self bottomViewAddSubViews];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"点我" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonClick:)];
    
    IWMessageMainView *mainView = [[IWMessageMainView alloc] initWithFrame:self.view.bounds WithParentView:self.view WithData:self.topButtons];
    self.mainView = mainView;
    mainView.backgroundColor = YKBackColor;
    [self.view insertSubview:mainView atIndex:self.view.subviews.count];
}

// 底部View添加一系列button
- (void)bottomViewAddSubViews{
    for (int i = 0; i < self.bottomViewButtons.count; i ++) {
        UIButton *button = [[UIButton alloc] init];
        [button setTitle:self.bottomViewButtons[i] forState:UIControlStateNormal];
        button.tag = i + 100;
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        button.x = 0;
        button.width = SCREENW * 2 / 5;
        button.height = (SCREENH - self.navigationController.navigationBar.height  - 20) / self.bottomViewButtons.count;
        button.y = i * button.height;
        [button addTarget:self action:@selector(bottomViewBUttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

// 底部view的button的点击事件
- (void)bottomViewBUttonClick:(UIButton *)button{
    NSInteger index = button.tag - 100;
    NSLog(@"%@",self.bottomViewButtons[index]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)leftBarButtonClick:(UIBarButtonItem *)item{
    self.tabBarController.tabBar.userInteractionEnabled = !self.tabBarController.tabBar.userInteractionEnabled;
    [self.mainView openOrCloseView];
}

@end
