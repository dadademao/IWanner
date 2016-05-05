//
//  IWFoundNewChildView.m
//  Iwanna
//
//  Created by 易凯 on 16/4/28.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "IWFoundChildView.h"
#import "IWFoundChildViewModel.h"

@interface IWFoundChildView ()
@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *timeLabel;
@end

@implementation IWFoundChildView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = YKBackColor;
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width, 208 * kPP)];
        self.imageView = imageView;
        [self addSubview:imageView];
        
        UILabel *titleLabel = [[UILabel alloc] init];
        self.titleLabel = titleLabel;
        titleLabel.font = SYS_FONT(25 * kPP);
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.numberOfLines = 0;
        titleLabel.width = self.width;
        [self addSubview:titleLabel];
        
        UILabel *timeLabel = [[UILabel alloc] init];
        self.timeLabel = timeLabel;
        timeLabel.font = SYS_FONT(20 * kPP);
        timeLabel.textColor = YKSubColor;
        timeLabel.width = self.width;
        [self addSubview:timeLabel];
    }
    return self;
}

- (void)setChildViewModel:(IWFoundChildViewModel *)childViewModel{
    _childViewModel = childViewModel;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:childViewModel.imageName] placeholderImage:[UIImage imageNamed:@"textImage"]];
    
    self.titleLabel.text = childViewModel.title;
    [self.titleLabel sizeToFit];
    
    self.timeLabel.text = childViewModel.time;
    [self.timeLabel sizeToFit];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat margin = 15 * kPP;
    
    self.titleLabel.y = CGRectGetMaxY(self.imageView.frame) + margin;
    self.timeLabel.y = CGRectGetMaxY(self.titleLabel.frame) + margin;
}

@end
