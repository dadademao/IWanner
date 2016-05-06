//
//  IWBaseViewController.m
//  Iwanna
//
//  Created by 易凯 on 16/4/27.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "IWBaseViewController.h"

@interface IWBaseViewController ()

@end

@implementation IWBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navigation_titleView"]];
    self.navigationItem.titleView = imageView;
    self.view.backgroundColor = YKBackColor;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
