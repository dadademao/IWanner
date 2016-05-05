//
//  IWOldUserLoginController.m
//  Iwanna
//
//  Created by 易凯 on 16/2/10.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "IWOldUserLoginController.h"
#import "IWLoginTextField.h"
#import "IWForgetPasswordView.h"

@interface IWOldUserLoginController ()

@end

@implementation IWOldUserLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self addSubViews];
}

- (void)addSubViews{
    CGFloat margin = 20;
    IWLoginTextField *phoneNumTextField = [[IWLoginTextField alloc] initWithFrame:CGRectMake(margin, self.view.height * 0.5, self.view.width - 2 * margin, 45) andPlaceholder:@"手机号/昵称"];
    [phoneNumTextField.attributeBtn setImage:[UIImage imageNamed:@"tempImage"] forState:UIControlStateNormal];
    phoneNumTextField.textField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:phoneNumTextField];
    
    IWLoginTextField *passwordTextField = [[IWLoginTextField alloc] initWithFrame:CGRectMake(margin, CGRectGetMaxY(phoneNumTextField.frame) + margin, self.view.width - 2 * margin, 45) andPlaceholder:@"输入密码"];
    [passwordTextField.attributeBtn setImage:[UIImage imageNamed:@"tempImage"] forState:UIControlStateNormal];
    [self.view addSubview:passwordTextField];
    
    UIButton *forgetPasswordBtn = [[UIButton alloc] init];
    forgetPasswordBtn.imageView.backgroundColor = [UIColor redColor];
    forgetPasswordBtn.titleLabel.text = @"忘记密码";
    [forgetPasswordBtn sizeToFit];
    forgetPasswordBtn.x = margin;
    forgetPasswordBtn.y = CGRectGetMaxY(passwordTextField.frame) + margin;
    [self.view addSubview:forgetPasswordBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
