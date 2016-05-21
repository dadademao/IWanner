//
//  IWLoginController.m
//  Iwanna
//
//  Created by apple on 15/12/26.
//  Copyright © 2015年 Iwanna. All rights reserved.
//

#import "IWLoginController.h"
#import "IWRegisterController.h"
#import "IWNavigationController.h"
#import "IWOldUserLoginController.h"

#define MARGIN 30

@interface IWLoginController ()

@property (nonatomic, weak) UIButton *registerBtn;
@property (nonatomic, weak) UIButton *loginBtn;

@end

@implementation IWLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self addSubViews];
}

- (void)addSubViews{
    CGFloat buttonW = SCREENW - 2 * MARGIN;
    CGFloat buttonH = 100 * kPP;
    CGFloat buttonY = SCREENH * 0.5 + MARGIN;
    
    UIButton *registerBtn = [[UIButton alloc] initWithFrame:CGRectMake(MARGIN, buttonY, buttonW, buttonH)];
    self.registerBtn = registerBtn;
    [self setBtnStateWithButton:registerBtn Title:@"注册新用户"];
    [registerBtn addTarget:self action:@selector(registerBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    
    UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(MARGIN, CGRectGetMaxY(registerBtn.frame) + MARGIN, buttonW, buttonH)];
    self.loginBtn = loginBtn;
    [self setBtnStateWithButton:loginBtn Title:@"已有账户登陆"];
    [loginBtn addTarget:self action:@selector(loginBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    
}

- (void)setBtnStateWithButton:(UIButton *)button Title:(NSString *)btnStr{
    button.backgroundColor = RandomColor;
    [button setTitle:btnStr forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    button.layer.cornerRadius = button.height * 0.5;
}

- (void)registerBtnClick:(UIButton *)button{
    NSLog(@"注册新用户");
    IWRegisterController *registerController = [[IWRegisterController alloc] init];
    [self presentViewController:[[IWNavigationController alloc] initWithRootViewController:registerController] animated:YES completion:nil];
}

- (void)loginBtnClick:(UIButton *)button{
    NSLog(@"已有账户登陆");
    IWOldUserLoginController *registerController = [[IWOldUserLoginController alloc] initWithNibName:@"IWOldUserLoginController" bundle:[NSBundle mainBundle]];
    [self presentViewController:registerController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
