//
//  IWFondNewView.m
//  Iwanna
//
//  Created by 易凯 on 16/4/28.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "IWFoundCellView.h"
#import "IWFoundToolView.h"
#import "IWFoundChildView.h"
#import "IWFoundChildViewModel.h"

#define MARGIN (17.5 * kPP)

@interface IWFoundCellView ()
@property (nonatomic, copy) NSString *viewType;
@end

@implementation IWFoundCellView

- (instancetype)initWithFrame:(CGRect)frame withData:(NSArray *)dataArray viewType:(NSString *)viewType{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = YKBackColor;
        self.viewType = viewType;
        
        NSString *imageName;
        if ([viewType isEqualToString:@"新鲜事"]) {
            imageName = @"found_new";
        }else{
            imageName = @"found_activity";
        }
        IWFoundToolView *toolView = [[IWFoundToolView alloc] initWithFrame:CGRectMake(0, 0, self.width, 105 * kPP) imageName:imageName title:viewType];
        [self addSubview:toolView];
        
        UIButton *moreButton = [[UIButton alloc] initWithFrame:toolView.bounds];
        [moreButton addTarget:self action:@selector(moreButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [toolView addSubview:moreButton];
        
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
            IWFoundChildViewModel *childViewModel = [[IWFoundChildViewModel alloc] init];
            childViewModel.imageName = dataArray[i][@"image"];
            childViewModel.title = dataArray[i][@"title"];
            childViewModel.time = dataArray[i][@"time"];
            childView.childViewModel = childViewModel;
            [scrollView addSubview:childView];
        }
    }
    return self;
}

- (void)moreButtonClick:(UIButton *)button{
    if ([self.delegate respondsToSelector:@selector(foundCellViewMoreButtonClick:)]) {
        [self.delegate foundCellViewMoreButtonClick:self.viewType];
    }
}

@end
