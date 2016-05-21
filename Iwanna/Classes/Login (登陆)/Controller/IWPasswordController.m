//
//  IWPasswordController.m
//  Iwanna
//
//  Created by apple on 15/12/27.
//  Copyright © 2015年 Iwanna. All rights reserved.
//

#import "IWPasswordController.h"
#import "IWLoginCellView.h"
#import "IWDetailedController.h"

#define MARGIN 32

@interface IWPasswordController ()
@property (weak, nonatomic) IWLoginCellView *passwordCell;
@property (weak, nonatomic) IWLoginCellView *passwordAgainCell;
@end

@implementation IWPasswordController




#pragma mark -
#pragma mark - CycLife

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = YKBackColor;
    
    UIBarButtonItem *leftItem = [UIBarButtonItem itemWithImageName:@"back-icon" target:self action:@selector(leftBarButtonItemClick:)];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -12;
    self.navigationItem.leftBarButtonItems = @[negativeSpacer,leftItem];    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage
                                                                                                                                               imageNamed:@"iwanna-icon_small"]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClick:)];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont boldSystemFontOfSize:18]} forState:UIControlStateNormal];
    
    
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    [self addSubViews];
}

- (void)addSubViews{
    CGFloat subViewH = 100 * kPP;
    
    IWLoginCellView *password = [[IWLoginCellView alloc] initWithFrame:CGRectMake(0, MARGIN, SCREENW, subViewH) titleName:@"设置密码" placeholder:@"请输入密码" isReference:YES];
    password.textField.secureTextEntry = YES;
    [self.view addSubview:password];
    self.passwordCell = password;
    
    IWLoginCellView *passwordAgain = [[IWLoginCellView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(password.frame) + MARGIN, SCREENW, subViewH) titleName:@"确认密码" placeholder:@"请再次输入密码" isReference:YES];
    passwordAgain.textField.secureTextEntry = YES;
    [self.view addSubview:passwordAgain];
    self.passwordAgainCell = passwordAgain;
    
}

#pragma mark -
#pragma mark - Settings, Gettings

#pragma mark -
#pragma mark - Events

- (void)rightBarButtonItemClick:(UIBarButtonItem *)item{
    if (![self checkingPassword]) {
        return;
    }
    
    IWDetailedController *detailVC = [[IWDetailedController alloc] init];
    detailVC.phone = self.phone;
    detailVC.password = self.passwordCell.textField.text;
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)leftBarButtonItemClick:(UIBarButtonItem *)item{
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark - Methods

- (BOOL)checkingPassword {
    if (self.passwordCell.textField.text.length <= 0) {
        [SVProgressHUD showErrorWithStatus:@"密码不能为空"];
        return NO;
    } else if (![self.passwordCell.textField.text isEqualToString:self.passwordAgainCell.textField.text]) {
        [SVProgressHUD showErrorWithStatus:@"密码不一致"];
        return NO;
    } else return YES;
}

#pragma mark -
#pragma mark - <#Delegate#>

#pragma mark -
#pragma mark - NSNotification

#pragma mark -
#pragma mark - KVO/KVC



@end
