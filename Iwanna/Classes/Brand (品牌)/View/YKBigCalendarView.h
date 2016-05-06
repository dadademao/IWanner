//
//  YKCalendarView.h
//  Iwanna
//
//  Created by 易凯 on 16/4/28.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol CalendarDelegate;
@protocol CalendarDataSource;


@interface YKBigCalendarView : UIView

- (void)addSubviews;

- (void)showNextMonth;
- (void)showPreviousMonth;


@property (nonatomic,strong) NSDate *calendarDate;
@property (nonatomic,weak) id<CalendarDelegate> delegate;
@property (nonatomic,weak) id<CalendarDataSource> datasource;
@property (nonatomic, strong) UIFont * defaultFont;
@property (nonatomic, strong) UIFont * titleFont;
@property (nonatomic, strong) UIFont * weekFont;
@property (nonatomic, strong) UIColor * monthAndDayTextColor;
@property (nonatomic, strong) UIColor * borderColor;
@property (nonatomic, assign) NSInteger borderWidth;
@property (nonatomic, strong) UIColor * dayBgColorWithoutData;
@property (nonatomic, strong) UIColor * dayTxtColorWithoutData;
@property (nonatomic, assign) BOOL allowsChangeMonthByDayTap;
@property (nonatomic, assign) BOOL allowsChangeMonthBySwipe;
@property (nonatomic, assign) BOOL allowsChangeMonthByButtons;
@property (nonatomic, assign) NSInteger originX;
@property (nonatomic, assign) NSInteger originY;
@property (nonatomic, assign) UIViewAnimationOptions nextMonthAnimation;
@property (nonatomic, assign) UIViewAnimationOptions prevMonthAnimation;
@property (nonatomic, assign) BOOL keepSelDayWhenMonthChange;
@property (nonatomic, assign) BOOL hideMonthLabel;
@end

@protocol CalendarDelegate <NSObject>

- (void)dayChangedToDate:(NSDate *)selectedDate;
- (void)dateButtonClick:(UIButton *)button withSelectedDate:(NSDate *)date;
@optional
- (void)setHeightNeeded:(NSInteger)heightNeeded;
- (void)setMonthLabel:(NSString *)monthLabel;
- (void)setEnabledForPrevMonthButton:(BOOL)enablePrev nextMonthButton:(BOOL)enableNext;
@end

@protocol CalendarDataSource <NSObject>
- (BOOL)isDataForDate:(NSDate *)date;
- (BOOL)canSwipeToDate:(NSDate *)date;

@end