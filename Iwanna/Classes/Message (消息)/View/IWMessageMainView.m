//
//  IWMessageMainView.m
//  Iwanna
//
//  Created by apple on 16/1/3.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "IWMessageMainView.h"
#import "IWMessageTopBar.h"

#define OPENCENTERX ([UIScreen mainScreen].bounds.size.width * 2 / 5)
#define DIVIDWIDTH 70.0 //OPENCENTERX 对应确认是否打开或关闭的分界线。

@interface IWMessageMainView ()
@property (nonatomic, strong) NSArray *dataArray;
@end


@implementation IWMessageMainView


- (id)initWithFrame:(CGRect)frame WithParentView:(UIView *)parentview WithData:(NSArray *)dataArray{
    if (self = [super initWithFrame:frame]) {
        self.parentView = parentview;
        self.dataArray = dataArray;
        
        [self addTopBar];
        
        UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        [self addGestureRecognizer:panGestureRecognizer];
        
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        
        [self addGestureRecognizer:tapGestureRecognizer];
        openPointCenter = CGPointMake(self.parentView.center.x + OPENCENTERX, self.parentView.center.y);
        
        NSLog(@"openPointCenter x:%f, openPointCenter y:%f",
              openPointCenter.x,
              openPointCenter.y);
        
        
    }
    return self;
}

- (void)addTopBar{
    IWMessageTopBar *topBar = [[IWMessageTopBar alloc] initWithFrame:CGRectMake(0, 0, SCREENW, 80) withData:self.dataArray];
    [self addSubview:topBar];
}

- (void)handlePan:(UIPanGestureRecognizer *)recognizer
{
    CGPoint translation = [recognizer translationInView:self.parentView];
    
    float x = self.center.x + translation.x;
    NSLog(@"translation x:%f", translation.x);
    
    if (x < self.parentView.center.x) {
        x = self.parentView.center.x;
    }
    
    self.center = CGPointMake(x, openPointCenter.y);
    [self viewController].tabBarController.tabBar.centerX = x;
    [self viewController].tabBarController.tabBar.userInteractionEnabled = NO;
    
    if(recognizer.state == UIGestureRecognizerStateEnded)
    {
        [UIView animateWithDuration:0.5 animations:^{
            if (x > openPointCenter.x -  DIVIDWIDTH) {
                self.center = openPointCenter;
                [self viewController].tabBarController.tabBar.centerX = openPointCenter.x;
            }else{
                self.center = CGPointMake(openPointCenter.x - OPENCENTERX, openPointCenter.y);
                [self viewController].tabBarController.tabBar.centerX = openPointCenter.x - OPENCENTERX;
                [self viewController].tabBarController.tabBar.userInteractionEnabled = YES;
            }
        }];
    }
    
    [recognizer setTranslation:CGPointZero inView:self.parentView];
}

- (void)handleTap:(UITapGestureRecognizer *)recognizer
{
    [self viewController].tabBarController.tabBar.userInteractionEnabled = YES;
    [UIView animateWithDuration:0.5 animations:^{
        self.center = CGPointMake(openPointCenter.x - OPENCENTERX, openPointCenter.y);
        [self viewController].tabBarController.tabBar.centerX = openPointCenter.x - OPENCENTERX;
    }];
}

- (void)openOrCloseView{
    if (self.x > self.parentView.x) {
        [UIView animateWithDuration:0.5 animations:^{
            self.center = CGPointMake(openPointCenter.x - OPENCENTERX, openPointCenter.y);
            [self viewController].tabBarController.tabBar.centerX = openPointCenter.x - OPENCENTERX;
        }];
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            self.center = openPointCenter;
            [self viewController].tabBarController.tabBar.centerX = openPointCenter.x;
        }];
    }
}

// 获取当前View所在的控制器
- (UIViewController *)viewController {
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end
