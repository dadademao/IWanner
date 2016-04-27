//
//  IWLoginCellView.m
//  Iwanna
//
//  Created by apple on 15/12/27.
//  Copyright © 2015年 Iwanna. All rights reserved.
//

#import "IWLoginCellView.h"

#define MARGIN 20

@implementation IWLoginCellView

- (instancetype)initWithFrame:(CGRect)frame titleName:(NSString *)titleName placeholder:(NSString *)placeholderStr isReference:(BOOL)isReference{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        CGFloat width = self.width * 2 / 7;
        
//        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(MARGIN, 0, width, self.height)];
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.text = titleName;
        [titleLabel sizeToFit];
        titleLabel.x = MARGIN;
        titleLabel.height = self.height;
        titleLabel.y = 0;
        titleLabel.textColor = YKSubColor;
        titleLabel.textColor = [UIColor blackColor];
        [self addSubview:titleLabel];
        
        UIView *segmentationView;
        if (isReference == NO) {
           segmentationView  = [[UIView alloc] initWithFrame:CGRectMake(width + MARGIN * 0.5, MARGIN * 0.5, 1, self.height - MARGIN)];
        }else{
            segmentationView  = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titleLabel.frame) + MARGIN, MARGIN * 0.5, 1, self.height - MARGIN)];
            }
        
        segmentationView.backgroundColor = YKSubColor;
        [self addSubview:segmentationView];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(width + MARGIN, 0, self.width - width - MARGIN, self.height)];
        self.textField = textField;
        textField.placeholder = placeholderStr;
        [self addSubview:textField];
        
    }
    return self;
}

@end
