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
#import "APRoundedButton.h"
#import "UserProvider.h"
#import "IWTabBarController.h"
@interface IWOldUserLoginController ()
@property (weak, nonatomic) IBOutlet UITextField *acountTextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;
@property (weak, nonatomic) IBOutlet APRoundedButton *rememberPasswordBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgotPasswordBtn;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
- (IBAction)loginBtnClick:(id)sender;

@end

@implementation IWOldUserLoginController


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark -
#pragma mark - CycLife

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self setSubViews];
}

- (void)setSubViews{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark -
#pragma mark - Settings, Gettings

#pragma mark -
#pragma mark - Events

- (IBAction)loginBtnClick:(id)sender {
    [self.view endEditing:YES];
    [self login];
}

#pragma mark -
#pragma mark - Methods

- (void) login {
    if (![self checkingInput]) {
        return;
    }
    NSDictionary *param = @{@"phone":_acountTextfield.text,@"password":[_passwordTextfield.text md5String]};
    @weakify(self);
    [SVProgressHUD show];
    [UserProvider loginWithDic:param complete:^(HttpResultModel *result) {
        if (result.isComplete) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
                IWTabBarController *tabvc =  [[IWTabBarController alloc] init];
                [weak_self presentViewController:tabvc animated:YES completion:nil];
            });
            
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [SVProgressHUD showErrorWithStatus:result.message];
            });
         
        }
        
    } error:^(NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
            [SVProgressHUD showErrorWithStatus:error.domain];
        });
    }];
}

- (BOOL) checkingInput {
    if (_acountTextfield.text.length <= 0) {
        [[[UIAlertView alloc] initWithTitle:@"账号不能为空！" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil]show];
        return NO;
    } else if (_passwordTextfield.text.length <= 0) {
        [[[UIAlertView alloc] initWithTitle:@"密码不能为空！" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil]show];
        return NO;
    }
    return YES;
}

#pragma mark -
#pragma mark - <#Delegate#>

#pragma mark -
#pragma mark - NSNotification

#pragma mark -
#pragma mark - KVO/KVC


@end
