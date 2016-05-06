//
//  IWDetailedControllerView.m
//  Iwanna
//
//  Created by apple on 15/12/27.
//  Copyright © 2015年 Iwanna. All rights reserved.
//

#import "IWDetailedControllerView.h"

@interface IWDetailedControllerView ()

@property (nonatomic, assign) CGFloat centY;

@end

@implementation IWDetailedControllerView

- (instancetype)initWithFrame:(CGRect)frame withCentY:(CGFloat)centY{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = YKBackColor;
        self.centY = centY;
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    CGFloat drawY = self.centY - 40 * kPP * 0.5;
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRect:CGRectMake(0, drawY, rect.size.width, 40 * kPP)];
    [[UIColor whiteColor] setFill];
    [path1 fill];
    
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRect:CGRectMake(0, drawY -1, rect.size.width, 40 * kPP + 2)];
    [YKSubColor set];
    [path2 stroke];
}

@end
