//
//  OJMeInfomationController.m
//  Iwanna
//
//  Created by One'J on 16/4/28.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "OJMeInfomationController.h"
#import "OJMeInfo.h"
#import "OJMeInfoGroup.h"
#import "OJMeInfoCell.h"


@interface OJMeInfomationController () <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) NSArray *groups;

@end

@implementation OJMeInfomationController
static NSString * const ID = @"cell";

- (NSArray *)groups{
    if (!_groups) {
        // 1.加载字典数组
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"IWMeInfo" ofType:@"plist"]];
        // 2.创建模型数组
        NSMutableArray *temp = [NSMutableArray array];
        // 3.字典数组 -> 模型数组
        for (NSDictionary *meInfoGroupDict in dictArray) {
            OJMeInfoGroup *group = [OJMeInfoGroup meInfoGroupWithDict:meInfoGroupDict];
            [temp addObject:group];
        }
        _groups = temp;
    }
    return _groups;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航栏
    [self setUpNav];

    self.tableView.backgroundColor = YKBackColor;
    

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
    return self.groups.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if (section == 0) {
//        return 4;
//    }else if(section == 1){
//        return 2;
//    }else{
//        return 2;
//    }
    // 取出第section组的组模型
    OJMeInfoGroup *group = self.groups[section];
    return group.meInfos.count;
}

//// 编辑cell的脚标签(没有内容的时候也不会报错)
//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
//    OJMeInfoGroup *group = self.groups[section];
//    return group.footer;
//}
//
//// 编辑cell的头标签(没有内容的时候也不会报错)
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    OJMeInfoGroup *group = self.groups[section];
//    return group.header;
//}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    
    
    OJMeInfoCell *cell1 = [[NSBundle mainBundle]loadNibNamed:@"OJMeInfoCell" owner:nil options:nil].lastObject;
    
    
//    cell.imageView.image = [UIImage imageNamed:@"mine_defaultHeader"];
    
    // 设置cell右边的指示样式
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // 取出indexPath.secton这组的组模型
    OJMeInfoGroup *group = self.groups[indexPath.section];
    
    // 取出indexPath.row对应的车模型
    OJMeInfo *meInfo = group.meInfos[indexPath.row];
    
    if (indexPath.row == 0 && indexPath.section == 0) {
        //        cell.imageView.image = [UIImage imageNamed:@"mine_defaultHeader"];
        cell1.textLabel.text = meInfo.title;
        
        cell1.meInfoView.image = [UIImage imageNamed:meInfo.details];
        return cell1;
    }
    
    // 设置数据
    cell.textLabel.text = meInfo.title;
    cell.detailTextLabel.text = meInfo.details;
    return cell;
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 18;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = YKBackColor;
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 && indexPath.section == 0) {
        return 105;
    }
    else{
        return 44;
    }
}

@end
