//
//  MALTabBarViewController.m
//  TabBarControllerModel
//
//  Created by wangtian on 14-6-25.
//  Copyright (c) 2014年 wangtian. All rights reserved.
//

#import "MALTabBarViewController.h"

@interface MALTabBarViewController ()<MALTabBarDelegate>
{
    NSInteger _defauletSelectedIndex;
    NSString *_tabBarBgImageName;
    BOOL _isShowTab;
    BOOL _isStatusBarStyleBlack;
}


@end

@implementation MALTabBarViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //self.modalPresentationStyle = UIModalPresentationCustom;

    }
    return self;
}
- (id)initWithItemModels:(NSArray *)itemModelArray
{
    if (self = [super init]) {
        
        self.itemsArray = itemModelArray;
        _defauletSelectedIndex = 0;
        //self.modalPresentationStyle = UIModalPresentationCustom;

    }
    return self;
}

- (id)initWithItemModels:(NSArray *)itemModelArray defaultSelectedIndex:(NSInteger)defaultSelectedIndex
{
    self = [self initWithItemModels:itemModelArray];
    if (self) {
        //self.modalPresentationStyle = UIModalPresentationCustom;

        _defauletSelectedIndex = defaultSelectedIndex;
        
    }
    return self;
}

- (UIView *)contentView
{
    if (_contentView == nil) {
        
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, MainScreenBoundsSize.width, MainScreenBoundsSize.height)];
        [self.view addSubview:_contentView];
    }
    return  _contentView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _isStatusBarStyleBlack = YES;

    _isShowTab = YES;
    self.view.backgroundColor = [UIColor blackColor];
    self.view.layer.borderColor = [UIColor blackColor].CGColor;
    self.view.layer.borderWidth = 0.5;




    // Do any additional setup after loading the view.
}

- (void) setNotice
{
    
    [self.tabBar setItemBadgeNumberWithIndex:2 badgeNumber:2];

}


- (void) setNonNotice
{
    [self.tabBar setItemBadgeNumberWithIndex:2 badgeNumber:0];

}

- (void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    [self performSelector:@selector(notifyToCamera) withObject:nil afterDelay:5];

    
}

- (void)notifyToCamera
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"CANCELCAMERA" object:nil];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
       

}
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(notifyToCamera) object:nil];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    [[UIApplication sharedApplication] setStatusBarHidden:YES];
}

- (void)setUpViewsWithDefauletSelectedIndex:(NSInteger)defauletSelectedIndex
{
    if (self.itemsArray.count == 0) {
        
        return;
    }
    
    self.tabBar = [MALTabBar getMALTabBarWithItemModels:self.itemsArray defaultSelectedIndex:defauletSelectedIndex];
    _currentIndex = defauletSelectedIndex;
    if (_tabBarBgImageName) {
        
        [self.tabBar setBackgroundColor:[UIColor redColor]];
    }

    self.tabBar.delegate = self;
    [self.view addSubview:self.tabBar];
    for(int i = 0; i< self.itemsArray.count; i++){
    
        MALTabBarItemModel *itemModel = [self.itemsArray objectAtIndex:i];
        id childViewController = [[NSClassFromString(itemModel.controllerName) alloc] init];
        [childViewController setDelegate:self];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:childViewController];
       [self addChildViewController:nav];
        if (i == defauletSelectedIndex) {
            
            [[childViewController view] setFrame:self.contentView.bounds];
            [self.contentView addSubview:[nav view]];
            _currentViewController = nav;
        }
    }
    [self.view bringSubviewToFront:self.tabBar];
}

#pragma mark -设置tabBar背景图片
- (void)setTabBarBgImage:(NSString *)imageName
{
//    _tabBarBgImageName = imageName;
}

#pragma mark - 点击item触发代理方法
- (void)selectedItem:(MALTabBarItemModel *)selectedItemModel
{
    [self selectItemWithIndex:selectedItemModel.itemIndex];
}

- (void)selectItemWithIndex:(NSInteger)index
{
    UIViewController *childViewController = [self.childViewControllers objectAtIndex:index];
    [childViewController.view setFrame:self.contentView.bounds];
    [_currentViewController.view removeFromSuperview];
    [self.contentView addSubview:childViewController.view];
    _currentViewController = childViewController;
    _currentIndex = index;
}

/**
 *  短按相机按钮事件
 */
- (void)shortTouchOnCameraBtn {
  
}





#pragma mark -设置item  badge红圈
- (void)setBadgeNumber:(NSInteger)number index:(NSInteger)index
{
    [self.tabBar setItemBadgeNumberWithIndex:index badgeNumber:number];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)HiddenTabbar
{
    if (_isShowTab) {
        _isShowTab = NO;

        [UIView animateWithDuration:0.2 animations:^{
            CGRect rect =  self.tabBar.frame;
            rect.origin.y += tabBarHeight;
            self.tabBar.frame = rect;
            self.tabBar.alpha = 0;
        } completion:^(BOOL finished) {
        }];
    }

}
- (void)ShowTabbar
{
    if (!_isShowTab) {
        _isShowTab = YES;

        [UIView animateWithDuration:0.2 animations:^{
            CGRect rect =  self.tabBar.frame;
            rect.origin.y -= tabBarHeight;
            self.tabBar.frame = rect;
            self.tabBar.alpha = 1;
        } completion:^(BOOL finished) {
        }];
    }

}

- (void)selectionMessage
{
    [self selectItemWithIndex:2];
}

#pragma mark 设置导航

- (void) changeStatusBarLight {
    _isStatusBarStyleBlack = NO;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void) changeStatusBarDefault {
    _isStatusBarStyleBlack = YES;
    [self setNeedsStatusBarAppearanceUpdate];

}
//设置导航
- (UIStatusBarStyle)preferredStatusBarStyle {
    if (_isStatusBarStyleBlack) {
        return UIStatusBarStyleDefault;
    }
    return UIStatusBarStyleLightContent;
}

//- (BOOL)prefersStatusBarHidden
//{
//    return NO;
//}

//- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation
//{
//    return UIStatusBarAnimationFade;
//}


- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
