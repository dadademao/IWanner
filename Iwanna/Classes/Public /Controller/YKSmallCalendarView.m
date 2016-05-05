//
//  YKCalendarView.m
//  123
//
//  Created by 易凯 on 16/4/30.
//  Copyright © 2016年 易凯. All rights reserved.
//

#import "YKSmallCalendarView.h"
#import "YKDateView.h"
#import "UIView+Extension.h"
#import "NSDate+CL.h"

@interface YKSmallCalendarView () <UIGestureRecognizerDelegate, YKDateViewDelegate>
@property (nonatomic, strong) NSDate *startDate;
@property (nonatomic, strong) NSDate *endDate;
@property (nonatomic, assign) NSInteger weekStartConfig;
@property (nonatomic, strong) NSArray *weekStrings;
@property (nonatomic, weak) UIView *selectedView;
@property (nonatomic, strong) NSDate *selectedDate;
@end

#define WEEKLY_VIEW_COUNT 7

@implementation YKSmallCalendarView

- (NSArray *)weekStrings{
    if (!_weekStrings) {
        _weekStrings = @[@"一", @"二", @"三", @"四", @"五", @"六", @"日"];
    }
    return _weekStrings;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.weekStartConfig = 1; // 从星期一开始
        [self addGestureRecognizer];
        [self initDailyViews];
    }
    return self;
}

- (void)addGestureRecognizer{
    UISwipeGestureRecognizer *recognizerRight;
    recognizerRight.delegate = self;
    recognizerRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight:)];
    [recognizerRight setDirection:UISwipeGestureRecognizerDirectionRight];
    [self addGestureRecognizer:recognizerRight];
    
    
    UISwipeGestureRecognizer *recognizerLeft;
    recognizerLeft.delegate = self;
    recognizerLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeft:)];
    [recognizerLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self addGestureRecognizer:recognizerLeft];
}

- (void)initDailyViews{
    CGFloat dailyWidth = self.width / WEEKLY_VIEW_COUNT;
    NSDate *today = [NSDate date];
    // 让today为北京时间
    today = [today dateByAddingTimeInterval:[[NSTimeZone systemTimeZone] secondsFromGMTForDate:today]];
    NSDate *dtWeekStart = [today getWeekStartDate:self.weekStartConfig]; // 从星期一开始
    self.startDate = dtWeekStart;
    for (UIView *v in [self subviews]){
        [v removeFromSuperview];
    }
    for(int i = 0; i < WEEKLY_VIEW_COUNT; i++){
        NSDate *date = [dtWeekStart addDays:i];
        [self dateViewForDate:date inFrame:CGRectMake(dailyWidth * i, 0, dailyWidth, self.height) weekString:self.weekStrings[i]];
        self.endDate = date;
    }
}

- (void)swipeLeft: (UISwipeGestureRecognizer *)swipe{
    [self delegateSwipeAnimation: NO blnToday:NO selectedDate:nil];
}
- (void)swipeRight: (UISwipeGestureRecognizer *)swipe{
    [self delegateSwipeAnimation: YES blnToday:NO selectedDate:nil];
}

- (void)delegateSwipeAnimation: (BOOL)blnSwipeRight blnToday: (BOOL)blnToday selectedDate:(NSDate *)selectedDate{
    CATransition *animation = [CATransition animation];
    [animation setDelegate:self];
    [animation setType:kCATransitionPush];
    [animation setSubtype:(blnSwipeRight)?kCATransitionFromLeft:kCATransitionFromRight];
    [animation setDuration:0.50];
    [animation setTimingFunction:
     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [self.layer addAnimation:animation forKey:kCATransition];
    
    NSMutableDictionary *data = @{@"blnSwipeRight": [NSNumber numberWithBool:blnSwipeRight],@"blnToday":[NSNumber numberWithBool:blnToday]}.mutableCopy;
    if(selectedDate){
        [data setObject:selectedDate forKey:@"selectedDate"];
    }
    
    [self performSelector:@selector(renderSwipeDates:) withObject:data afterDelay:0.05f];
}

-(void)renderSwipeDates: (NSDictionary*)param{
    int step = ([[param objectForKey:@"blnSwipeRight"] boolValue]) ? -1 : 1;
    BOOL blnToday = [[param objectForKey:@"blnToday"] boolValue];
    NSDate *selectedDate = [self objectForKeyWithNil:@"selectedDate" andData:param];
    CGFloat dailyWidth = self.width / WEEKLY_VIEW_COUNT;
    
    
    NSDate *dtStart;
    if(blnToday){
        dtStart = [[NSDate new] getWeekStartDate:self.weekStartConfig];
    }else{
        dtStart = (selectedDate)? [selectedDate getWeekStartDate:self.weekStartConfig]:[self.startDate addDays:step * 7];
    }
    
    self.startDate = dtStart;
    for (UIView *v in [self subviews]){
        [v removeFromSuperview];
    }
    
    for(int i = 0; i < WEEKLY_VIEW_COUNT; i++){
        NSDate *date = [dtStart addDays:i];
        [self dateViewForDate:date inFrame: CGRectMake(dailyWidth * i, 0, dailyWidth, self.height) weekString:self.weekStrings[i]];
        self.endDate = date;
    }
    if ([self.delegate respondsToSelector:@selector(smallCalendarViewDateDidChange:)]) {
        [self.delegate smallCalendarViewDateDidChange:self.startDate];
    }
}

- (void)dateViewForDate:(NSDate *)date inFrame:(CGRect)frame weekString:(NSString *)weekString{
    YKDateView *view = [[YKDateView alloc] initWithFrame:frame andWeedSrring:weekString];
    view.date = date;
    view.backgroundColor = [UIColor whiteColor];
    if (self.selectedDate) {
        if ([self isSameDay:self.selectedDate date2:date]) {
            [view dateViewDidSelected:YES];
            self.selectedView = view;
        }
    }
    view.delegate = self;
    [self addSubview:view];
}

- (void)dateViewDidSelect:(NSDate *)date andView:(YKDateView *)view{
    if (self.selectedView) {
        [(YKDateView *)self.selectedView dateViewDidSelected:NO];
    }
    [(YKDateView *)view dateViewDidSelected:YES];
    self.selectedView = view;
    self.selectedDate = date;
    NSLog(@"%@", date);
}

- (NSDate *)objectForKeyWithNil:(id)aKey andData:(NSDictionary *)dict{
    if(!self) return nil;
    id object = [dict objectForKey:aKey];
    if (object == [NSNull null]) {
        return nil;
    }
    return object;
}

- (BOOL)isSameDay:(NSDate*)date1 date2:(NSDate*)date2{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:date1];
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:date2];
    return [comp1 day] == [comp2 day] && [comp1 month] == [comp2 month] && [comp1 year]  == [comp2 year];
}

@end
