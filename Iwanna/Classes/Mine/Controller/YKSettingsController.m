//
//  YKSettingsController.m
//  Iwanna
//
//  Created by 易凯 on 16/1/6.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "YKSettingsController.h"
#import "YKSettingsCell.h"
#import <MessageUI/MessageUI.h>

@interface YKSettingsController () <MFMessageComposeViewControllerDelegate>
@property (nonatomic, strong) NSArray *groups;
@end

@implementation YKSettingsController

- (NSArray *)groups{
    if (!_groups) {
        // 文件路径
        NSString *path = [[NSBundle mainBundle] pathForResource:self.plistName ofType:@"plist"];
        // 读取文件返回数组
        _groups = [NSArray arrayWithContentsOfFile:path];
    }
    return _groups;
}

// 重写init方法,让外面通过init来创建这个类的时候创建的是分组模式
- (instancetype)init{
    return [super initWithStyle:UITableViewStyleGrouped];
}
// 重写initWithStyle方法,让外面通过init来创建这个类的时候创建的是分组模式
- (instancetype)initWithStyle:(UITableViewStyle)style{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 去掉左边分割线间距
    [self setSeparatorWithTarget:self.tableView Inset:UIEdgeInsetsZero];
    // 设置导航控制器的左按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"NavBack" target:self action:@selector(back)];
    self.view.backgroundColor = YKBackColor;
    // 取消tableView的垂直滚动
    self.tableView.showsVerticalScrollIndicator = NO;
//    self.tableView.scrollEnabled = NO;
}

// 设置分割分模式(左边间距为0)
- (void)setSeparatorWithTarget:(id)target Inset:(UIEdgeInsets)inset{
    [target setSeparatorInset:inset];
    if ([target respondsToSelector:@selector(setLayoutMargins:)]) {
        [target setLayoutMargins:inset];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)back{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *groupDict = self.groups[section];
    NSArray *items = groupDict[@"items"];
    return items.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 获取数据
    NSDictionary *groupDict = self.groups[indexPath.section];
    NSDictionary *item = groupDict[@"items"][indexPath.row];
    
    YKSettingsCell *cell = [YKSettingsCell cellWithTableView:tableView withDict:item];
    
    // 把数据设置给cell
    cell.item = item;
    
    // 返回cell
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

//- (CGFloat)table

// 当选中某个cell的时候系统执行的代码
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    // 获取数据
    NSDictionary *groupDict = self.groups[indexPath.section];
    NSDictionary *item = groupDict[@"items"][indexPath.row];
    
    // 判断当前选中的cell是否有目标控制器
    if (item[@"targetVcName"] && [item[@"targetVcName"] length] > 0) {
        // 根据targetVcName里面的value值确定对应的控制器类型
        Class targetClass = NSClassFromString(item[@"targetVcName"]);
        // 创建目标控制器对象
        UIViewController *targetVc = [[targetClass alloc] init];
        // 设置即将跳转的控制器的标题
        targetVc.navigationItem.title = item[@"title"];
        
        // 判断目标控制器是否是一个设置控制器,那么就需要加载对应的plist文件
        if ([targetVc isKindOfClass:[YKSettingsController class]]) {
            // 获取plistName的文件名
            NSString *plistName = item[@"plistName"];
            YKSettingsController *targetSettingVc = (YKSettingsController *)targetVc;
            targetSettingVc.plistName = plistName;
        }
        // 把目标控制器push到导航控制器
        [self.navigationController pushViewController:targetVc animated:YES];
        return;/****************如果有跳转功能的cell都不需要检查新版本就可以加return****************/
    }
    
    // 判断当前选中的cell是否需要检查新版本
    if (item[@"funcName"] && [item[@"funcName"] length] > 0) {
        // 把字符串转成方法名
        SEL func = NSSelectorFromString(item[@"funcName"]);
        // 判断如果func这个方法可以执行
        if ([self respondsToSelector:func]) {
            // 执行这个方法
# pragma clang diagnostic push
# pragma clang diagnostic ignored "-Warc-performSelector-leaks" // 在这三个 "pragma" 之间的警告可忽略
            [self performSelector:func];
# pragma clang diagnostic pop
            // 让选中的cell变成非选中的cell,达到选中颜色闪一下就没的效果
            [tableView deselectRowAtIndexPath:indexPath animated:YES];
        }
    }
    
}

// 检查版本的逻辑
- (void)checkUpdate{
    // 弹框
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"已经是最新版本了" message:@"信凯哥得永生" delegate:self cancelButtonTitle:@"好的" otherButtonTitles:nil, nil];
    [alertView show];
}

// 评分支持的逻辑
- (void)comment{
    // 跳转到当前应用程序在appStore的位置
    NSString *urlStr = @"对应程序在appStore的位置";
    NSURL *url = [NSURL URLWithString:urlStr];
    // 跳到苹果的应用商店
    UIApplication *app = [UIApplication sharedApplication];
    [app openURL:url]; // 打开
}

// 打电话
- (void)callService{
    // 拿到用户选中cell的indexPath
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    // 根据indexPath拿到cell里面的数据
    NSDictionary *groupDict = self.groups[indexPath.section];
    NSDictionary *item = groupDict[@"items"][indexPath.row];
    // 获取电话号码
    NSString *number = item[@"details"];
    // 打电话
    NSString *urlStr = [NSString stringWithFormat:@"tel://%@",number]; // 创建一个打电话的urlStr <tel://电话号码>
    NSURL *url = [NSURL URLWithString:urlStr]; // 把urlStr转换成url
    [[UIApplication sharedApplication] openURL:url]; // 打开这个url
}

// 发短信
- (void)sendMessages{
    /**********************************只是跳转到发短信的界面**********************************/
    NSString *urlStr = @"sms://18518965558"; // 创建一个发短信的urlStr <sms://电话号码> <mailto://收件人邮箱地址>
    NSURL *url = [NSURL URLWithString:urlStr]; // 把urlStr转换成url
    [[UIApplication sharedApplication] openURL:url]; // 打开这个url
    
    /*******************编辑好要发的短信内容,需要导入MessageUI/MessageUI.h框架*******************/
    // 创建一个要发短信的控制器    <MFMailComposeViewController 为发邮件的控制器, 代码步骤和短信的一样>
    MFMessageComposeViewController *MCVController = [[MFMessageComposeViewController alloc] init];
    MCVController.body = @"需要发送的短信内容"; // 编辑短信内容
    MCVController.recipients = @[@"18518965558", @"13133713772"]; // 设置收件人列表(可以为多个人)
    MCVController.messageComposeDelegate = self; // 设置代理 (要遵守 MFMessageComposeViewControllerDelegate 协议)
    // 把发短信的控制器modal进去
    [self presentViewController:MCVController animated:YES completion:nil];
}

// 发短信控制器的代理方法, 当短信界面关闭的时候调,可在里面关闭短信界面
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    [controller dismissViewControllerAnimated:YES completion:nil];
    if (result == MessageComposeResultCancelled) {
        NSLog(@"取消发送");
    }else if (result == MessageComposeResultSent){
        NSLog(@"已经发出");
    }else if (result == MessageComposeResultFailed){
        NSLog(@"发送失败");
    }
}

// 编辑cell的脚标签(没有内容的时候也不会报错)
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    NSDictionary *groupDict = self.groups[section];
    return groupDict[@"footer"];
}

// 编辑cell的头标签(没有内容的时候也不会报错)
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSDictionary *groupDict = self.groups[section];
    return groupDict[@"header"];
}

@end
