//
//  IWFoundActivityController.m
//  Iwanna
//
//  Created by 易凯 on 16/4/28.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "IWFoundActivityController.h"
#import "YKBigCalendarView.h"
#import "YKSmallCalendarView.h"
#import "IWCalendarSelectedView.h"
#import "IWFoundActivityCell.h"

#import "IWFoundNewModel.h"

@interface IWFoundActivityController ()
<
CalendarDelegate,
YKSmallCalendarViewDelegate,
UITableViewDelegate,
UITableViewDataSource
>

@property (nonatomic, strong) YKBigCalendarView *bigCalendarView;
@property (nonatomic, weak) YKSmallCalendarView *smallCalendarView;
@property (nonatomic, strong) IWCalendarSelectedView *selectecView;
@property (nonatomic, weak) UIButton *navigationRightButton;
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, assign) BOOL accordingBigCalendarView;
@property (nonatomic, weak) UIView *whiteView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation IWFoundActivityController

- (UIView *)selectecView{
    if (!_selectecView) {
        CGFloat WH = SCREENW / 7 / 5 + SCREENW / 7;
        _selectecView = [[IWCalendarSelectedView alloc] initWithFrame:CGRectMake(0, 0, WH, WH)];
    }
    return _selectecView;
}

- (instancetype)initWithData:(NSArray *)dataArray{
    if (self = [super init]) {
//        self.dataArray = dataArray;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigation];
    [self addSmallCalendarView];
    [self.view addSubview:self.bigCalendarView];
    [self addTableView];
}

- (void)setNavigation{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = SYS_FONT(40 * kPP);
    titleLabel.text = @"活动";
    titleLabel.textColor = [UIColor whiteColor];
    [titleLabel sizeToFit];
    self.navigationItem.titleView = titleLabel;
    
    UIButton *navigationRightButton = [[UIButton alloc] init];
    self.navigationRightButton = navigationRightButton;
    [navigationRightButton setTitle:[self dateStringWithDate:[NSDate date]] forState:UIControlStateNormal];
    [navigationRightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [navigationRightButton sizeToFit];
    [navigationRightButton addTarget:self action:@selector(rightBarButtonItemClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:navigationRightButton];
}

- (void)addSmallCalendarView{
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 103 * kPP)];
    self.whiteView = whiteView;
    whiteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:whiteView];
    YKSmallCalendarView *smallCalendarView = [[YKSmallCalendarView alloc] initWithFrame:whiteView.frame];
    self.smallCalendarView = smallCalendarView;
    smallCalendarView.delegate = self;
    [self.view addSubview:smallCalendarView];
}

- (YKBigCalendarView *)bigCalendarView{
    if (!_bigCalendarView) {
        CGFloat height1 = SCREENW / 7 * 4 + 48 * kPP;
        CGFloat height2 = SCREENW / 7 * 5 + 48 * kPP;
        CGFloat height3 = SCREENW / 7 * 6 + 48 * kPP;
        _bigCalendarView = [[YKBigCalendarView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 0)];
        _bigCalendarView.backgroundColor = RGB(77, 65, 175);
        _bigCalendarView.delegate = self;
        [_bigCalendarView addSubviews];
        if (_bigCalendarView.subviews.count == 49) {
            _bigCalendarView.height = height3;
            _bigCalendarView.y = -height3;
        }else if (_bigCalendarView.subviews.count == 42){
            _bigCalendarView.height = height2;
            _bigCalendarView.y = -height2;
        }else if (_bigCalendarView.subviews.count == 35){
            _bigCalendarView.height = height1;
            _bigCalendarView.y = -height1;
        }
    }
    return _bigCalendarView;
}

- (void)addTableView{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.smallCalendarView.height, self.view.width, self.view.height - self.smallCalendarView.height - 64)];
    self.tableView = tableView;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (void)rightBarButtonItemClick:(UIBarButtonItem *)item{
    self.navigationRightButton.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.navigationRightButton.userInteractionEnabled = YES;
    });
    self.accordingBigCalendarView = !self.accordingBigCalendarView;
    if (self.accordingBigCalendarView) {
        [UIView animateWithDuration:0.5 animations:^{
            self.smallCalendarView.y = -self.smallCalendarView.height;
            self.whiteView.y = -self.smallCalendarView.height;
            self.tableView.y = 0;
            self.tableView.height = self.view.height;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
                self.bigCalendarView.y = 0;
                self.tableView.y = self.bigCalendarView.height;
                self.tableView.height = self.view.height - self.bigCalendarView.height;
            }];
        }];
    }else{
        [self.selectecView removeFromSuperview];
        CGFloat Y;
        if (_bigCalendarView.subviews.count == 49) {
            Y = - (SCREENW / 7 * 6 + 48 * kPP);
        }else if (_bigCalendarView.subviews.count == 42){
            Y = - (SCREENW / 7 * 5 + 48 * kPP);
        }else if (_bigCalendarView.subviews.count == 35){
            Y = - (SCREENW / 7 * 4 + 48 * kPP);
        }
        [UIView animateWithDuration:0.5 animations:^{
            self.bigCalendarView.y = Y;
            self.tableView.y = 0;
            self.tableView.height = self.view.height;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
                self.smallCalendarView.y = 0;
                self.whiteView.y = 0;
                self.tableView.y = self.smallCalendarView.height;
                self.tableView.height = self.view.height - self.smallCalendarView.height;
            }];
        }];
    }
}

#pragma mark - CalendarDelegate
- (void)dayChangedToDate:(NSDate *)selectedDate{
    [self.bigCalendarView addSubviews];
    CGFloat height1 = SCREENW / 7 * 4 + 48 * kPP;
    CGFloat height2 = SCREENW / 7 * 5 + 48 * kPP;
    CGFloat height3 = SCREENW / 7 * 6 + 48 * kPP;
    if (self.bigCalendarView.subviews.count == 49) {
        self.bigCalendarView.height = height3;
    }else if (self.bigCalendarView.subviews.count == 42){
        self.bigCalendarView.height = height2;
    }else if (self.bigCalendarView.subviews.count == 35){
        self.bigCalendarView.height = height1;
    }
    NSDate *navigationDate = [self chinaDateWithDate:selectedDate];
    [self.navigationRightButton setTitle:[self dateStringWithDate:navigationDate] forState:UIControlStateNormal];
    [self.navigationRightButton sizeToFit];
    self.tableView.y = self.bigCalendarView.height;
    self.tableView.height = self.view.height - self.bigCalendarView.height;
}
#pragma mark - YKSmallCalendarViewDelegate
- (void)smallCalendarViewDateDidChange:(NSDate *)date{
    NSDate *navigationDate = [self chinaDateWithDate:date];
    [self.navigationRightButton setTitle:[self dateStringWithDate:navigationDate] forState:UIControlStateNormal];
    [self.navigationRightButton sizeToFit];
}

- (void)dateButtonClick:(UIButton *)button withSelectedDate:(NSDate *)date{
    self.selectecView.center = button.center;
    self.selectecView.titleLabel.text = button.titleLabel.text;
    [self.bigCalendarView addSubview:self.selectecView];
}

- (NSDate *)chinaDateWithDate:(NSDate *)date{
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    NSDate *localeDate = [date dateByAddingTimeInterval:interval];
    return localeDate;
}

- (NSString *)dateStringWithDate:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM"];
    return [dateFormatter stringFromDate:date];
}

#pragma mark - UITableViewDelegate and UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSDictionary *contentDict = [self.dataArray[section] firstObject];
    NSArray *contentArray = contentDict[@"content"];
    return [contentArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200 * kPP;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 32 * kPP;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 32 * kPP)];
    UILabel *dateLabel = [[UILabel alloc] init];
    dateLabel.text = [self.dataArray[section] firstObject][@"date"];
    dateLabel.font = SYS_FONT(20 * kPP);
    [dateLabel sizeToFit];
    dateLabel.x = 10;
    dateLabel.centerY = 16 * kPP;
    [footerView addSubview:dateLabel];
    footerView.backgroundColor = YKBackColor;
    return footerView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *contentDict = [self.dataArray[indexPath.section] firstObject];
    NSArray *contentArray = contentDict[@"content"];
    IWFoundActivityCell *cell = [IWFoundActivityCell cellWithTableView:tableView];
    IWFoundNewModel *newModel = [[IWFoundNewModel alloc] init];
    newModel.imageName = contentArray[indexPath.row][@"image"];
    newModel.title =contentArray[indexPath.row][@"title"];
    newModel.time = contentArray[indexPath.row][@"time"];
    newModel.content = @"我是一只小青蛙, 呱呱呱呱呱.每天快乐的唱歌,啦啦啦啦啦.我是一只小青蛙, 呱呱呱呱呱.每天快乐的唱歌,啦啦啦啦啦.我是一只小青蛙, 呱呱呱呱呱.每天快乐的唱歌,啦啦啦啦啦.我是一只小青蛙, 呱呱呱呱呱.每天快乐的唱歌,啦啦啦啦啦.我是一只小青蛙, 呱呱呱呱呱.每天快乐的唱歌,啦啦啦啦啦.";
    newModel.isSectionFirst = indexPath.row == 0;
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

- (NSArray *)dataArray{
    if (!_dataArray){
        _dataArray = @[
                       @[
                         @{
                           @"date" : @"今天 3月22日 星期二",
                           @"content" : @[
                                      @{
                                       @"image" : @"http://b.hiphotos.baidu.com/image/pic/item/91529822720e0cf3d6a146fa0846f21fbe09aa58.jpg",
                                       @"title" : @"一个你不知道的海天盛宴",
                                       @"time" : @"2015-03-22 9:00"
                                       },
                                      @{
                                       @"image" : @"http://e.hiphotos.baidu.com/image/pic/item/1c950a7b02087bf4162e67f6f0d3572c10dfcfea.jpg",
                                       @"title" : @"一个你不知道的海天盛宴",
                                       @"time" : @"2015-03-22 10:00"
                                       },
                                      @{
                                       @"image" : @"http://e.hiphotos.baidu.com/image/pic/item/314e251f95cad1c8037ed8c97b3e6709c83d5112.jpg",
                                       @"title" : @"一个你不知道的海天盛宴",
                                       @"time" : @"2015-03-22 11:00"
                                       }
                                   ]
                               }
                           ],
                       
                       @[
                         @{
                           @"date" : @"今天 3月23日 星期三",
                           @"content" : @[
                                      @{
                                       @"image" : @"http://e.hiphotos.baidu.com/image/pic/item/91529822720e0cf39396832a0e46f21fbf09aafa.jpg",
                                       @"title" : @"一个你不知道的海天盛宴",
                                       @"time" : @"2015-03-23 13:00"
                                       },
                                      @{
                                       @"image" : @"http://f.hiphotos.baidu.com/image/pic/item/a50f4bfbfbedab642ebcbb1ff336afc378311e26.jpg",
                                       @"title" : @"一个你不知道的海天盛宴",
                                       @"time" : @"2015-03-23 14:00"
                                       }
                                   ]
                               }
                           ],

                       @[
                         @{
                           @"date" : @"今天 3月24日 星期四",
                           @"content" : @[
                                      @{
                                       @"image" : @"http://m.818today.com/imgsy/image/2016/0215/6359114724079675302648537.jpg",
                                       @"title" : @"一个你不知道的海天盛宴",
                                       @"time" : @"2015-03-24 15:00"
                                       }
                                   ]
                               }
                           ]
                       ];
    }
    return _dataArray;
}

@end
