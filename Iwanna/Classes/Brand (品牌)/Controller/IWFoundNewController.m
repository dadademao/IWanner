//
//  IWFoundNewController.m
//  Iwanna
//
//  Created by 易凯 on 16/4/28.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "IWFoundNewController.h"
#import "IWFoundNewCell.h"
#import "IWFoundNewModel.h"

@interface IWFoundNewController ()
<
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation IWFoundNewController

- (instancetype)initWithData:(NSArray *)dataArray{
    if (self = [super init]) {
        self.dataArray = dataArray;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavigation];
    
    [self addSubViews];
}

- (void)setNavigation{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = SYS_FONT(40 * kPP);
    titleLabel.text = @"新鲜事";
    titleLabel.textColor = [UIColor whiteColor];
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
}

- (void)addSubViews{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height - 64)];
    self.tableView = tableView;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200 * kPP;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 18 * kPP;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 18 * kPP)];
    footerView.backgroundColor = YKBackColor;
    return footerView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    IWFoundNewCell *cell = [IWFoundNewCell cellWithTableView:tableView];
    IWFoundNewModel *newModel = [[IWFoundNewModel alloc] init];
    newModel.imageName = self.dataArray[indexPath.section][@"image"];
    newModel.title = self.dataArray[indexPath.section][@"title"];
    newModel.time = self.dataArray[indexPath.section][@"time"];
    newModel.content = @"我是一只小青蛙, 呱呱呱呱呱.每天快乐的唱歌,啦啦啦啦啦.我是一只小青蛙, 呱呱呱呱呱.每天快乐的唱歌,啦啦啦啦啦.我是一只小青蛙, 呱呱呱呱呱.每天快乐的唱歌,啦啦啦啦啦.我是一只小青蛙, 呱呱呱呱呱.每天快乐的唱歌,啦啦啦啦啦.我是一只小青蛙, 呱呱呱呱呱.每天快乐的唱歌,啦啦啦啦啦.";
    cell.model = newModel;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 让选中状态变成非选中状态
    [self performSelector:@selector(deSelect) withObject:nil afterDelay:0.01f];
}

// 取消选中状态
- (void)deSelect{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
