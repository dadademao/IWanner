//
//  IWMessageTopBar.m
//  Iwanna
//
//  Created by 易凯 on 16/1/5.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "IWMessageTopBar.h"

@implementation IWMessageTopBar

- (instancetype)initWithFrame:(CGRect)frame withData:(NSArray *)dataArray{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = YKBackColor;
        
        for (int i = 0; i < dataArray.count; i ++) {
            UIButton *childButton = [[UIButton alloc] init];
            [childButton setTitle:dataArray[i] forState:UIControlStateNormal];
            [childButton setTitleColor:YKSubColor forState:UIControlStateNormal];
            childButton.titleLabel.font = SYS_FONT(12);
            [self addSubview:childButton];
        }
        
    }
    return self;
}

- (void)layoutSubviews{
    CGFloat childButtonW = self.width / self.subviews.count;
    for (int i = 0; i < self.subviews.count; i ++) {
        UIButton *childButton = self.subviews[i];
        childButton.size = CGSizeMake(childButtonW, self.height);
        childButton.x = i * childButtonW;
    }
}

- (void)drawRect:(CGRect)rect{
    CGFloat margin = 10;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(margin, self.height - 1, self.width - 2 * margin, 1)];
    [YKSubColor setFill];
    [path fill];
}

@end
