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
#import "UserProvider.h"
#import "VerificationModel.h"
#define MARGIN 20

@interface IWRegisterController ()
@property (nonatomic, weak) IWLoginCellView *userName;
@property (weak, nonatomic) IWLoginCellView *passwordCell;
@property (strong, nonatomic) VerificationModel *verifyModel;

@end

@implementation IWRegisterController



#pragma mark -
#pragma mark - CycLife

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNav];
    
    [self addSubViews];
}

- (void) initNav {
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigation_back" target:self action:@selector(leftBarButtonItemClick:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"right" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClick:)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    UIBarButtonItem *leftItem = [UIBarButtonItem itemWithImageName:@"back-icon" target:self action:@selector(leftBarButtonItemClick:)];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -12;
    self.navigationItem.leftBarButtonItems = @[negativeSpacer,leftItem];
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage
                                                                       imageNamed:@"iwanna-icon_small"]];
    
    
    UIBarButtonItem *rightItem = [UIBarButtonItem itemWithImageName:@"next-icon" target:self action:@selector(rightBarButtonItemClick:)];
    
    self.navigationItem.rightBarButtonItems = @[negativeSpacer,rightItem];
}

- (void)addSubViews{
    self.view.backgroundColor = YKBackColor;
    
    CGFloat subViewH = 100 * kPP;
    
    IWLoginCellView *userName = [[IWLoginCellView alloc] initWithFrame:CGRectMake(0, MARGIN, SCREENW, subViewH) titleName:@"中国(+86)" placeholder:@"请输入手机号" isReference:NO];
    self.userName = userName;
    userName.textField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:userName];
    
    IWLoginCellView *password = [[IWLoginCellView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(userName.frame) + MARGIN, SCREENW, subViewH) titleName:@"验证码" placeholder:@"请输入验证码" isReference:NO];
    password.textField.keyboardType = UIKeyboardTypeNumberPad;

    [self.view addSubview:password];
    self.passwordCell = password;
    CGFloat buttonW = 80;
    UIButton *sendBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREENW - buttonW, 0, buttonW, subViewH)];
    sendBtn.titleLabel.font = SYS_FONT(16);
    [sendBtn setBackgroundColor:YKMainColor];
    [sendBtn setTitle:@"发送" forState:UIControlStateNormal];
    [sendBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sendBtn addTarget:self action:@selector(sendBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [userName addSubview:sendBtn];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark -
#pragma mark - Settings, Gettings

#pragma mark -
#pragma mark - Events

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
    
    if (![self checkingVerify]) {
        [SVProgressHUD showErrorWithStatus:@"验证码与手机号不匹配"];
        return;
    }
    
    IWPasswordController *passwordVC = [[IWPasswordController alloc] init];
    passwordVC.phone = self.verifyModel.phone;
    [self.navigationController pushViewController:passwordVC animated:YES];
}


- (void)sendBtnClick:(UIButton *)button{
    
    if (![self checkingPhone]) {
        return;
    }
    @weakify(self);
    [SVProgressHUD show];
    [UserProvider getVerificationWithPhoneNum:self.userName.textField.text complete:^(HttpResultModel *result) {
        if (result.isComplete) {
            weak_self.verifyModel = result.data;
            NSLog(@"verify = %@",weak_self.verifyModel.smsMessage);
            dispatch_async(dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
        } else {
            [SVProgressHUD showErrorWithStatus:result.message];
        }
        
    } error:^(NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [SVProgressHUD showErrorWithStatus:error.domain];
        });
    }];
    
    NSLog(@"发送验证码");
    
}


#pragma mark -
#pragma mark - Methods
//验证手机号
- (BOOL) checkingPhone {
    
    if (self.userName.textField.text.length <= 0) {
        [[[UIAlertView alloc] initWithTitle:@"号码错误" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil] show];
        return NO;
    }
    
    return YES;

}
//验证验证码与手机号是否匹配
- (BOOL) checkingVerify {
    if ([self.userName.textField.text isEqualToString:self.verifyModel.phone] && [self.passwordCell.textField.text isEqualToString:self.verifyModel.smsMessage]) {
        return YES;
    } else return NO;
}

#pragma mark -
#pragma mark - <#Delegate#>

#pragma mark -
#pragma mark - NSNotification

#pragma mark -
#pragma mark - KVO/KVC


@end
