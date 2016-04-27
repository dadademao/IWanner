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
        [nameButton setTitleColor:YKSubColor forState:UIControlStateNormal];
        nameButton.backgroundColor = RandomColor;
        nameButton.layer.cornerRadius = nameButton.height * 0.5;
        [self addSubview:nameButton];
        
    }
    return self;
}

@end
