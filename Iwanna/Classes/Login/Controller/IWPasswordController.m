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

#define MARGIN 20

@interface IWPasswordController ()

@end

@implementation IWPasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = YKBackColor;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemClick:)];;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClick:)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    [self addSubViews];
}

- (void)addSubViews{
    CGFloat subViewH = 50 * kPP;
    
    IWLoginCellView *password = [[IWLoginCellView alloc] initWithFrame:CGRectMake(0, MARGIN, SCREENW, subViewH) titleName:@"设置密码" placeholder:@"请输入密码" isReference:YES];
    password.textField.secureTextEntry = YES;
    [self.view addSubview:password];
    
    IWLoginCellView *passwordAgain = [[IWLoginCellView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(password.frame) + MARGIN, SCREENW, subViewH) titleName:@"确认密码" placeholder:@"请再次输入密码" isReference:YES];
    passwordAgain.textField.secureTextEntry = YES;
    [self.view addSubview:passwordAgain];

}


- (void)leftBarButtonItemClick:(UIBarButtonItem *)item{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBarButtonItemClick:(UIBarButtonItem *)item{
    [self.navigationController pushViewController:[[IWDetailedController alloc] init] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
