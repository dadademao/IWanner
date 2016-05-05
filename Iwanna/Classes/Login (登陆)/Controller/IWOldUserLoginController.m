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


@property (weak, nonatomic) IBOutlet UITextField *userNameTF;

@property (weak, nonatomic) IBOutlet UITextField *passWordTF;



@end

@implementation IWOldUserLoginController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
}

- (IBAction)loginBtnClick:(id)sender {
    NSLog(@"登录");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
