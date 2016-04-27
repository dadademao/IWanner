//
//  IWHobbyCell.m
//  Iwanna
//
//  Created by apple on 16/1/2.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "IWHobbyCell.h"

@implementation IWHobbyCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = YKBackColor;
        
        UIButton *nameButton = [[UIButton alloc] initWithFrame:self.bounds];
        self.nameButton = nameButton;
        [nameButton setTitleColor:UIColorFromHex(0xa5a7bd) forState:UIControlStateNormal];
        nameButton.backgroundColor = [UIColor clearColor];
        nameButton.layer.cornerRadius = nameButton.height * 0.5;
        nameButton.layer.borderWidth = 2;
        nameButton.titleLabel.font = SYS_FONT(16);
        
        
        [self addSubview:nameButton];
        
    }
    return self;
}

@end
