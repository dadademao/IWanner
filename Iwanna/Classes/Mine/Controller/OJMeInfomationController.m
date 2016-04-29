//
//  OJMeInfomationController.m
//  Iwanna
//
//  Created by One'J on 16/4/28.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "OJMeInfomationController.h"


@interface OJMeInfomationController () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation OJMeInfomationController
static NSString * const ID = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏
    [self setUpNav];
    
    

}

//设置导航栏
-(void)setUpNav {
    self.navigationItem.titleView = nil;
    self.navigationItem.title = @"个人信息";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigation_back" target:self action:@selector(leftBarButtonItemClick:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)leftBarButtonItemClick:(UIBarButtonItem *)item{
    NSLog(@"123");
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark ---------------
#pragma mark tableview数据源
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 4;
    }else if(section == 1){
        return 2;
    }else{
        return 2;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.backgroundColor = RandomColor;
    cell.textLabel.text = [NSString stringWithFormat:@"%ld组%zd行-其他数据",indexPath.section,indexPath.row];
    return cell;
}


@end
