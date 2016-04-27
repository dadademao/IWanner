//
//  IWMineHeaderView.m
//  Iwanna
//
//  Created by 易凯 on 16/1/6.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "IWMineHeaderView.h"
#import "YKCircularImageView.h"

#define MARGIN (10 * kPP)

@interface IWMineHeaderView ()

@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) YKCircularImageView *headerImage;

@end

@implementation IWMineHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = YKMainColor;
        
        UILabel *nameLabel = [[UILabel alloc] init];
        self.nameLabel = nameLabel;
        nameLabel.text = @"易先生";
        nameLabel.textColor = [UIColor whiteColor];
        [nameLabel sizeToFit];
        [self addSubview:nameLabel];
        
        YKCircularImageView *headerImage = [[YKCircularImageView alloc] init];
        self.headerImage = headerImage;
        headerImage.image = [UIImage imageNamed:@"mine_defaultHeader"];
        [self addSubview:headerImage];
        
        // 轻触手势(点按)
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    self.headerImage.centerX = self.width * 0.5;
    self.headerImage.y = self.height - self.headerImage.height - MARGIN;

    self.nameLabel.centerX = self.width * 0.5;
    self.nameLabel.y = self.headerImage.y - self.nameLabel.height - MARGIN;
    
}

- (void)drawRect:(CGRect)rect{
    
    CGFloat rectH = MARGIN + self.headerImage.height * 1 / 3;
    CGFloat rectY = rect.size.height - rectH;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, rectY, self.width, rectH)];
    [YKBackColor setFill];
    [path fill];
}

- (void)tapGestureAction:(UITapGestureRecognizer *)recognizer{
    if ([self.delegate respondsToSelector:@selector(mineHeaderViewClick)]) {
        [self.delegate mineHeaderViewClick];
    }
}

@end
