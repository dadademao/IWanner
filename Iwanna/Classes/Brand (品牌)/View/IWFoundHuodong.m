//
//  IWFoundHuodong.m
//  Iwanna
//
//  Created by 易凯 on 16/5/17.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "IWFoundHuodong.h"
#import "IWFoundToolView.h"
#import "IWFoundChildView.h"
#import "IWFoundChildViewModel.h"
#import "ListHuodong.h"

#define MARGIN (17.5 * kPP)

@implementation IWFoundHuodong

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = YKBackColor;
        
        IWFoundToolView *toolView = [[IWFoundToolView alloc] initWithFrame:CGRectMake(0, 0, self.width, 105 * kPP) imageName:@"found_activity" title:@"活动"];
        [self addSubview:toolView];
        
        UIButton *moreButton = [[UIButton alloc] initWithFrame:toolView.bounds];
        [moreButton addTarget:self action:@selector(moreButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [toolView addSubview:moreButton];
    }
    return self;
}

- (void)moreButtonClick:(UIButton *)button{
    if ([self.delegate respondsToSelector:@selector(huodongMoreButtonClick)]) {
        [self.delegate huodongMoreButtonClick];
    }
}

- (void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
    
    NSLog(@"%@", dataArray);
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 105 * kPP + MARGIN, self.width, self.height - 105 * kPP - MARGIN)];
    scrollView.backgroundColor = YKBackColor;
    //        scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.contentSize = CGSizeMake(((int)(dataArray.count / 3) + 1) * scrollView.width, scrollView.height);
    [self addSubview:scrollView];
    
    for (int i = 0; i < dataArray.count; i ++) {
        CGFloat x = MARGIN * (i + 1) + 190 * kPP * i + (int)(i / 3) * MARGIN;
        IWFoundChildView *childView = [[IWFoundChildView alloc] initWithFrame:CGRectMake(x, 0, 190 * kPP, scrollView.height)];
        ListHuodong *huodong = dataArray[i];
        childView.huodong = huodong;
        [scrollView addSubview:childView];
    }
}
@end
