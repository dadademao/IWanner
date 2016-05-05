//
//  YKDateView.h
//  123
//
//  Created by 易凯 on 16/4/30.
//  Copyright © 2016年 易凯. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YKDateView;
@protocol YKDateViewDelegate <NSObject>

- (void)dateViewDidSelect:(NSDate *)date andView:(YKDateView *)view;

@end

@interface YKDateView : UIView
- (instancetype)initWithFrame:(CGRect)frame andWeedSrring:(NSString *)weedString;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic) BOOL blnSelected;
@property (nonatomic, weak) id<YKDateViewDelegate> delegate;
- (void)dateViewDidSelected:(BOOL)isSelected;
@end
