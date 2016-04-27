//
//  IWRegisterController.m
//  Iwanna
//
//  Created by apple on 15/12/26.
//  Copyright © 2015年 Iwanna. All rights reserved.
//

#import "IWRegisterController.h"
#import "IWLoginCellView.h"
#import "IWPasswordController.h"

#define MARGIN 20

@interface IWRegisterController ()
@property (nonatomic, weak) IWLoginCellView *userName;
@end

@implementation IWRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = YKBackColor;
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigation_back" target:self action:@selector(leftBarButtonItemClick:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"right" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClick:)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    [self addSubViews];
}

- (void)addSubViews{
    CGFloat subViewH = 50 * kPP;
    
    IWLoginCellView *userName = [[IWLoginCellView alloc] initWithFrame:CGRectMake(0, MARGIN, SCREENW, subViewH) titleName:@"中国(+86)" placeholder:@"请输入手机号" isReference:NO];
    self.userName = userName;
    userName.textField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:userName];
    
    IWLoginCellView *password = [[IWLoginCellView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(userName.frame) + MARGIN, SCREENW, subViewH) titleName:@"验证码" placeholder:@"请输入验证码" isReference:NO];
    [self.view addSubview:password];
    
    CGFloat buttonW = 80;
    UIButton *sendBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREENW - buttonW, 0, buttonW, subViewH)];
    [sendBtn setBackgroundColor:YKMainColor];
    [sendBtn setTitle:@"发送" forState:UIControlStateNormal];
    [sendBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sendBtn addTarget:self action:@selector(sendBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [userName addSubview:sendBtn];
}

- (void)leftBarButtonItemClick:(UIBarButtonItem *)item{
    NSLog(@"123");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)rightBarButtonItemClick:(UIBarButtonItem *)item{
    
//    // 注册环信
//    [[EaseMob sharedInstance].chatManager asyncRegisterNewAccount:self.userName.textField.text password:@"123456" withCompletion:^(NSString *username, NSString *password, EMError *error) {
//        if (!error) {
//            NSLog(@"注册成功");
//            // 如果没有开启自动登录
//            BOOL isAutoLogin = [[EaseMob sharedInstance].chatManager isAutoLoginEnabled];
//            if (!isAutoLogin) {
//                // 登录环信
//                [[EaseMob sharedInstance].chatManager asyncLoginWithUsername:username password:password completion:^(NSDictionary *loginInfo, EMError *error) {
//                    if (!error) {
//                        NSLog(@"登录成功");
//                    }
//                } onQueue:nil];
//            }
//        }
//    } onQueue:nil];
    
    [self.navigationController pushViewController:[[IWPasswordController alloc] init] animated:YES];
}

- (void)sendBtnClick:(UIButton *)button{
    NSLog(@"发送验证码");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
