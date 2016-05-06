//
//  YKDateView.m
//  123
//
//  Created by 易凯 on 16/4/30.
//  Copyright © 2016年 易凯. All rights reserved.
//

#import "YKDateView.h"
#import "UIView+Extension.h"
#import "NSDate+CL.h"

@interface YKDateView ()
@property (nonatomic, weak) UILabel *dateLabel;
@property (nonatomic, weak) UILabel *weekLabel;
@end

@implementation YKDateView

- (instancetype)initWithFrame:(CGRect)frame andWeedSrring:(NSString *)weedString{
    if (self = [super initWithFrame:frame]) {
        [self addSubViewsAndWeedString:weedString];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dateViewDidClick:)];
        tap.numberOfTapsRequired = 1;
        // 点按需要的手指数
        tap.numberOfTouchesRequired = 1;
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)addSubViewsAndWeedString:(NSString *)weedString{
    
    UILabel *weekLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height * 0.5)];
    self.weekLabel = weekLabel;
    weekLabel.textColor = YKSubColor;
    weekLabel.textAlignment = NSTextAlignmentCenter;
    weekLabel.text = weedString;
    weekLabel.font = SYS_FONT(20 * kPP);
    [self addSubview:weekLabel];
    
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.height * 0.5, self.width, self.height * 0.5)];
    self.dateLabel = dateLabel;
    dateLabel.textColor = YKSubColor;
    dateLabel.textAlignment = NSTextAlignmentCenter;
    dateLabel.font = SYS_FONT(24 * kPP);
    [self addSubview:dateLabel];
}

- (void)dateViewDidClick: (UIGestureRecognizer *)tap{
    if ([self.delegate respondsToSelector:@selector(dateViewDidSelect:andView:)]) {
        [self.delegate dateViewDidSelect:self.date andView:self];
    }
}

- (void)setDate:(NSDate *)date{
    _date = date;
    self.dateLabel.text = [self.date getDateOfMonth];
    
}

- (void)setBlnSelected: (BOOL)blnSelected{
    _blnSelected = blnSelected;
    self.dateLabel.text = [self.date getDateOfMonth];
}

- (void)dateViewDidSelected:(BOOL)isSelected{
    if (isSelected) {
        self.backgroundColor = RGB(100, 97, 146);
        self.dateLabel.textColor = [UIColor whiteColor];
        self.weekLabel.textColor = [UIColor whiteColor];
    }else{
        self.backgroundColor = [UIColor whiteColor];
        self.dateLabel.textColor = YKSubColor;
        self.weekLabel.textColor = YKSubColor;
    }
}

@end
