//
//  YKCalendarView.h
//  123
//
//  Created by 易凯 on 16/4/30.
//  Copyright © 2016年 易凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YKSmallCalendarViewDelegate <NSObject>

- (void)smallCalendarViewDateDidChange:(NSDate *)date;

@end

@interface YKSmallCalendarView : UIView
@property (nonatomic, weak) id <YKSmallCalendarViewDelegate> delegate;
@end
