//
//  IWCalendarSelectedView.m
//  Iwanna
//
//  Created by 易凯 on 16/4/30.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "IWCalendarSelectedView.h"

@implementation IWCalendarSelectedView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        UILabel *titleLabel = [[UILabel alloc] init];
        self.titleLabel = titleLabel;
        titleLabel.size = CGSizeMake(frame.size.width, 40 * kPP);
        titleLabel.centerY = frame.size.height * 0.5;
        titleLabel.x = 0;
        titleLabel.font = SYS_FONT(40 * kPP);
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.textColor = YKMainColor;
        [self addSubview:titleLabel];
        
        CGFloat WH = frame.size.width / 3;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width - WH, 0, WH, WH)];
        imageView.image = [UIImage imageNamed:@"mine_defaultHeader"];
        [self addSubview:imageView];
    }
    return self;
}

@end
