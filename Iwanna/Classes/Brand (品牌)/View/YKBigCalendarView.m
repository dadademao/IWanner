//
//  YKCalendarView.m
//  Iwanna
//
//  Created by 易凯 on 16/4/28.
//  Copyright © 2016年 Iwanna. All rights reserved.
//


#import "YKBigCalendarView.h"

@interface YKBigCalendarView()

@property (nonatomic, strong) NSCalendar *gregorian;
@property (nonatomic, strong) NSDate * selectedDate;
@property (nonatomic, assign) NSInteger dayWidth;
@property (nonatomic, assign) NSInteger weekHeight;
@property (nonatomic, assign) NSCalendarUnit dayInfoUnits;
@property (nonatomic, strong) NSArray * weekDayNames;
@property (nonatomic, assign) NSInteger shakes;
@property (nonatomic, assign) NSInteger shakeDirection;
@property (nonatomic, strong) UISwipeGestureRecognizer * swipeleft;
@property (nonatomic, strong) UISwipeGestureRecognizer * swipeRight;

@end
@implementation YKBigCalendarView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        _dayWidth = frame.size.width / 7;
        _originX = 2;
        _gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        _borderWidth = 1.0; // 分割线宽
        _originY = 0;
        _calendarDate = [NSDate date];
        _dayInfoUnits = NSEraCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
        _weekHeight = 48 * kPP; // 星期高
        _monthAndDayTextColor = [UIColor whiteColor]; // 月份字体颜色
        _dayBgColorWithoutData = RGB(77, 65, 175); // 每个小格子的背景颜色
        _dayTxtColorWithoutData = [UIColor whiteColor]; // 日期的字体颜色
        _borderColor = [UIColor blackColor]; // 分割线的颜色
        _allowsChangeMonthByDayTap = NO; // 点击屏幕上显示的上一个月的日期是否改变当前月份
        _allowsChangeMonthByButtons = NO;
        _allowsChangeMonthBySwipe = YES;
        _hideMonthLabel = NO;
        _keepSelDayWhenMonthChange = NO;
        
        _nextMonthAnimation = UIViewAnimationOptionTransitionCrossDissolve;
        _prevMonthAnimation = UIViewAnimationOptionTransitionCrossDissolve;
        
        _defaultFont = SYS_FONT(24 * kPP);
        _weekFont = SYS_FONT(20 * kPP);
        _titleFont = [UIFont fontWithName:@"Helvetica-Bold" size:15.0f];
        
        
        _swipeleft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(showNextMonth)];
        _swipeleft.direction = UISwipeGestureRecognizerDirectionLeft;
        [self addGestureRecognizer:_swipeleft];
        _swipeRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(showPreviousMonth)];
        _swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
        [self addGestureRecognizer:_swipeRight];
        
        NSDateComponents *components = [_gregorian components:_dayInfoUnits fromDate:[NSDate date]];
        components.hour = 0;
        components.minute = 0;
        components.second = 0;
        
        _selectedDate = [_gregorian dateFromComponents:components];
        
        NSDateFormatter *dateFormatter = [NSDateFormatter new];
        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
        NSArray * shortWeekdaySymbols = [dateFormatter shortWeekdaySymbols];
        _weekDayNames = @[shortWeekdaySymbols[0], shortWeekdaySymbols[1], shortWeekdaySymbols[2], shortWeekdaySymbols[3], shortWeekdaySymbols[4], shortWeekdaySymbols[5], shortWeekdaySymbols[6]];
    }
    return self;
}

#pragma mark - Custom setters

- (void)setAllowsChangeMonthByButtons:(BOOL)allows{
    _allowsChangeMonthByButtons = allows;
    [self setNeedsDisplay];
}

- (void)setAllowsChangeMonthBySwipe:(BOOL)allows{
    _allowsChangeMonthBySwipe = allows;
    _swipeleft.enabled = allows;
    _swipeRight.enabled = allows;
}

- (void)setHideMonthLabel:(BOOL)hideMonthLabel{
    _hideMonthLabel = hideMonthLabel;
    [self setNeedsDisplay];
}

- (void)setSelectedDate:(NSDate *)selectedDate{
    _selectedDate = selectedDate;
    [self setNeedsDisplay];
}

// 向左滑动
- (void)showNextMonth{
    NSDateComponents *components = [_gregorian components:_dayInfoUnits fromDate:_calendarDate];
    components.day = 1;
    components.month ++;
    NSDate * nextMonthDate =[_gregorian dateFromComponents:components];
    
    if ([self canSwipeToDate:nextMonthDate]){
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        _calendarDate = nextMonthDate;
        components = [_gregorian components:_dayInfoUnits fromDate:_calendarDate];
        
        if (!_keepSelDayWhenMonthChange){
            _selectedDate = [_gregorian dateFromComponents:components];
        }
        [self performViewAnimation:_nextMonthAnimation];
    }else{
        [self performViewNoSwipeAnimation];
    }
}

// 向右滑动
- (void)showPreviousMonth{
    NSDateComponents *components = [_gregorian components:_dayInfoUnits fromDate:_calendarDate];
    components.day = 1;
    components.month --;
    NSDate * prevMonthDate = [_gregorian dateFromComponents:components];
    
    if ([self canSwipeToDate:prevMonthDate]){
        [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        _calendarDate = prevMonthDate;
        components = [_gregorian components:_dayInfoUnits fromDate:_calendarDate];
        
        if (!_keepSelDayWhenMonthChange){
            _selectedDate = [_gregorian dateFromComponents:components];
        }
        [self performViewAnimation:_prevMonthAnimation];
    }else{
        [self performViewNoSwipeAnimation];
    }
}

#pragma mark - Various methods
- (NSInteger)buttonTagForDate:(NSDate *)date{
    NSDateComponents * componentsDate = [_gregorian components:_dayInfoUnits fromDate:date];
    NSDateComponents * componentsDateCal = [_gregorian components:_dayInfoUnits fromDate:_calendarDate];
    
    if (componentsDate.month == componentsDateCal.month && componentsDate.year == componentsDateCal.year){
        return componentsDate.day;
    }else{
        NSInteger offsetMonth =  (componentsDate.year - componentsDateCal.year)*12 + (componentsDate.month - componentsDateCal.month);
        return componentsDate.day + offsetMonth*40;
    }
}

- (BOOL)canSwipeToDate:(NSDate *)date{
    if (_datasource == nil)
        return YES;
    return [_datasource canSwipeToDate:date];
}

- (void)performViewAnimation:(UIViewAnimationOptions)animation{
    NSDateComponents * components = [_gregorian components:_dayInfoUnits fromDate:_selectedDate];
    
    NSDate *clickedDate = [_gregorian dateFromComponents:components];
    [_delegate dayChangedToDate:clickedDate];
    
    [UIView transitionWithView:self duration:0.5f options:animation animations:^ { [self setNeedsDisplay]; } completion:nil];
}

- (void)performViewNoSwipeAnimation{
    _shakeDirection = 1;
    _shakes = 0;
    [self shakeView:self];
}

- (void)shakeView:(UIView *)theOneYouWannaShake{
    [UIView animateWithDuration:0.05 animations:^{
         theOneYouWannaShake.transform = CGAffineTransformMakeTranslation(5*_shakeDirection, 0);
         
     } completion:^(BOOL finished){
         if(_shakes >= 4){
             theOneYouWannaShake.transform = CGAffineTransformIdentity;
             return;
         }
         _shakes++;
         _shakeDirection = _shakeDirection * -1;
         [self shakeView:theOneYouWannaShake];
     }];
}

#pragma mark - Button creation and configuration

- (UIButton *)dayButtonWithFrame:(CGRect)frame{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = _defaultFont;
    button.frame = frame;
    button.layer.borderColor        = _borderColor.CGColor;
    [button addTarget:self action:@selector(tappedDate:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)configureDayButton:(UIButton *)button withDate:(NSDate*)date{
    NSDateComponents *components = [_gregorian components:_dayInfoUnits fromDate:date];
    [button setTitle:[NSString stringWithFormat:@"%ld",(long)components.day] forState:UIControlStateNormal];
    button.tag = [self buttonTagForDate:date];
    button.layer.borderWidth = _borderWidth / 2.f;
    NSDateComponents * componentsDateCal = [_gregorian components:_dayInfoUnits fromDate:_calendarDate];
    if (components.month != componentsDateCal.month)
        // 易凯修改 : 如果该天不在当前月, 让格子空着
        for (UIView *childView in button.subviews) {
            [childView removeFromSuperview];
        }
}

#pragma mark - Action methods

// 每个日期的点击事件
- (void)tappedDate:(UIButton *)sender{
    NSDateComponents *components = [_gregorian components:_dayInfoUnits fromDate:_calendarDate];
    
    if (sender.tag < 0 || sender.tag >= 40){
        if (!_allowsChangeMonthByDayTap)
            return;
        
        NSInteger offsetMonth   = (sender.tag < 0)?-1:1;
        NSInteger offsetTag     = (sender.tag < 0)?40:-40;
        
        components.day = 1;
        components.month += offsetMonth;
        NSDate * otherMonthDate =[_gregorian dateFromComponents:components];
        
        if ([self canSwipeToDate:otherMonthDate]){
            [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
            _calendarDate = otherMonthDate;
            
            components.day = sender.tag + offsetTag;
            _selectedDate = [_gregorian dateFromComponents:components];

            UIViewAnimationOptions animation = (offsetMonth > 0) ? _nextMonthAnimation:_prevMonthAnimation;
            
            [self performViewAnimation:animation];
        }else{
            [self performViewNoSwipeAnimation];
        }
        return;
    }
    
    NSDateComponents * componentsDateSel = [_gregorian components:_dayInfoUnits fromDate:_selectedDate];
    if(componentsDateSel.day != sender.tag || componentsDateSel.month != components.month || componentsDateSel.year != components.year){
        
        NSDate * oldSelectedDate = [_selectedDate copy];
        
        componentsDateSel.day = sender.tag;
        componentsDateSel.month = components.month;
        componentsDateSel.year = components.year;
        _selectedDate = [_gregorian dateFromComponents:componentsDateSel];
        
        [self configureDayButton:sender withDate:_selectedDate];
        
        // Configure the previously selected button, if it's visible
        UIButton *previousSelected =(UIButton *) [self viewWithTag:[self buttonTagForDate:oldSelectedDate]];
        if (previousSelected){
            [self configureDayButton:previousSelected withDate:oldSelectedDate];
        }
    }
    if ([self.delegate respondsToSelector:@selector(dateButtonClick:withSelectedDate:)]) {
        [self.delegate dateButtonClick:sender withSelectedDate:_selectedDate];
    }
}

#pragma mark - Drawing methods
- (void)addSubviews{
    NSDateComponents *components = [_gregorian components:_dayInfoUnits fromDate:_calendarDate];
    
    components.day = 2;
    NSDate *firstDayOfMonth = [_gregorian dateFromComponents:components];
    NSDateComponents *comps = [_gregorian components:NSWeekdayCalendarUnit fromDate:firstDayOfMonth];
    
    NSInteger weekdayBeginning = [comps weekday];  // Starts at 1 on Sunday
    weekdayBeginning -=2;
    if(weekdayBeginning < 0)
        weekdayBeginning += 7;                          // Starts now at 0 on Monday
    
    NSRange days = [_gregorian rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:_calendarDate];
    
    NSInteger monthLength = days.length;
    NSInteger remainingDays = (monthLength + weekdayBeginning) % 7;
    
    BOOL enableNext = YES;
    BOOL enablePrev = YES;
    
    NSDateComponents *componentsTmp = [_gregorian components:_dayInfoUnits fromDate:_calendarDate];
    componentsTmp.day = 1;
    componentsTmp.month --;
    NSDate * prevMonthDate =[_gregorian dateFromComponents:componentsTmp];
    if (![self canSwipeToDate:prevMonthDate]){
        enablePrev = NO;
    }
    componentsTmp.month +=2;
    NSDate * nextMonthDate =[_gregorian dateFromComponents:componentsTmp];
    if (![self canSwipeToDate:nextMonthDate]){
        enableNext = NO;
    }
    if (_delegate != nil && [_delegate respondsToSelector:@selector(setEnabledForPrevMonthButton:nextMonthButton:)])
        [_delegate setEnabledForPrevMonthButton:enablePrev nextMonthButton:enableNext];
    
    NSDateFormatter *format         = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"MMMM yyyy"];
    NSString *dateString            = [[format stringFromDate:_calendarDate] uppercaseString];
    
    if (_delegate != nil && [_delegate respondsToSelector:@selector(setMonthLabel:)])
        [_delegate setMonthLabel:dateString];
    
    __block CGRect frameWeekLabel = CGRectMake(0, 0, _dayWidth, _weekHeight);
    [_weekDayNames  enumerateObjectsUsingBlock:^(NSString * dayOfWeekString, NSUInteger idx, BOOL *stop){
         frameWeekLabel.origin.x = _originX+(_dayWidth*idx);
         UILabel *weekNameLabel = [[UILabel alloc] initWithFrame:frameWeekLabel];
         weekNameLabel.layer.borderWidth = _borderWidth/2.f;
         weekNameLabel.text = dayOfWeekString;
         weekNameLabel.textColor = _monthAndDayTextColor;
         weekNameLabel.font = _weekFont;
         weekNameLabel.backgroundColor = [UIColor clearColor];
         weekNameLabel.textAlignment = NSTextAlignmentCenter;
         [self addSubview:weekNameLabel];
     }];
    NSInteger yikai = 1;
    for (NSInteger i= 0; i<monthLength; i++){
        components.day = i + yikai;
        NSInteger offsetX = (_dayWidth*((i+weekdayBeginning)%7));
        NSInteger offsetY = (_dayWidth *((i+weekdayBeginning)/7));
        UIButton *button = [self dayButtonWithFrame:CGRectMake(_originX+offsetX, _originY+_weekHeight+offsetY, _dayWidth, _dayWidth)];
        [self configureDayButton:button withDate:[_gregorian dateFromComponents:components]];
        [self addSubview:button];
    }
    
    NSDateComponents *previousMonthComponents = [_gregorian components:_dayInfoUnits fromDate:_calendarDate];
    previousMonthComponents.month --;
    NSDate *previousMonthDate = [_gregorian dateFromComponents:previousMonthComponents];
    NSRange previousMonthDays = [_gregorian rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:previousMonthDate];
    NSInteger maxDate = previousMonthDays.length - weekdayBeginning;
    for (int i=0; i<weekdayBeginning; i++){
        previousMonthComponents.day = maxDate + i + yikai;
        NSInteger offsetX = (_dayWidth*(i%7));
        NSInteger offsetY = (_dayWidth *(i/7));
        UIButton *button = [self dayButtonWithFrame:CGRectMake(_originX+offsetX, _originY + _weekHeight + offsetY, _dayWidth, _dayWidth)];
        [self configureDayButton:button withDate:[_gregorian dateFromComponents:previousMonthComponents]];
        [self addSubview:button];
    }
    
    if(remainingDays == 0)
        return ;
    
    NSDateComponents *nextMonthComponents = [_gregorian components:_dayInfoUnits fromDate:_calendarDate];
    nextMonthComponents.month ++;
    
    for (NSInteger i=remainingDays; i<7; i++){
        nextMonthComponents.day = (i + yikai) - remainingDays;
        NSInteger offsetX = (_dayWidth*((i) %7));
        NSInteger offsetY = (_dayWidth *((monthLength+weekdayBeginning)/7));
        UIButton *button = [self dayButtonWithFrame:CGRectMake(_originX+offsetX, _originY + _weekHeight + offsetY, _dayWidth, _dayWidth)];
        [self configureDayButton:button withDate:[_gregorian dateFromComponents:nextMonthComponents]];
        [self addSubview:button];
    }
}
@end