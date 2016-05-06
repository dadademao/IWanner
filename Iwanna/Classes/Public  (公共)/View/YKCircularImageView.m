//
//  YKCircularImageView.m
//  Iwanna
//
//  Created by 易凯 on 16/1/7.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "YKCircularImageView.h"

@implementation YKCircularImageView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.size = CGSizeMake(100 * kPP, 100 * kPP);
        self.layer.cornerRadius = self.width * 0.5;
        [self.layer setMasksToBounds:YES];
        
    }
    return self;
}

@end
