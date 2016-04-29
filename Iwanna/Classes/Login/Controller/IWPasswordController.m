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

@end

@implementation IWPasswordController

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
    CGFloat subViewH = 50 * kPP;
    
    IWLoginCellView *password = [[IWLoginCellView alloc] initWithFrame:CGRectMake(0, MARGIN, SCREENW, subViewH) titleName:@"设置密码" placeholder:@"请输入密码" isReference:YES];
    password.textField.secureTextEntry = YES;
    [self.view addSubview:password];
    
    IWLoginCellView *passwordAgain = [[IWLoginCellView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(password.frame) + MARGIN, SCREENW, subViewH) titleName:@"确认密码" placeholder:@"请再次输入密码" isReference:YES];
    passwordAgain.textField.secureTextEntry = YES;
    [self.view addSubview:passwordAgain];

}

- (void)rightBarButtonItemClick:(UIBarButtonItem *)item{
    [self.navigationController pushViewController:[[IWDetailedController alloc] init] animated:YES];
}

- (void)leftBarButtonItemClick:(UIBarButtonItem *)item{
    NSLog(@"123");
    [self.navigationController popViewControllerAnimated:YES];
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
