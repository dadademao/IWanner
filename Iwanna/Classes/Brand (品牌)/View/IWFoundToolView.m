//
//  IWFoundToolView.m
//  Iwanna
//
//  Created by 易凯 on 16/4/28.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "IWFoundToolView.h"

#define WH (41 * kPP)
#define MARGIN (32 * kPP)

@implementation IWFoundToolView

- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName title:(NSString *)title{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(MARGIN, MARGIN, WH, WH)];
        imageView.image = [UIImage imageNamed:imageName];
        [self addSubview:imageView];
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.text = title;
        titleLabel.textColor = YKMainColor;
        titleLabel.font = SYS_FONT(32 * kPP);
        [titleLabel sizeToFit];
        titleLabel.x = CGRectGetMaxX(imageView.frame) + MARGIN;
        titleLabel.centerY = imageView.centerY;
        [self addSubview:titleLabel];
        
        UIImageView *moreView = [[UIImageView alloc] initWithFrame:CGRectMake(self.width - WH - MARGIN, MARGIN, WH, WH)];
        moreView.image = [UIImage imageNamed:@"public_cellMore"];
        [self addSubview:moreView];
    }
    return self;
}

@end
