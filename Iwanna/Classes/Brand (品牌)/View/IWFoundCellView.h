//
//  IWFondNewView.h
//  Iwanna
//
//  Created by 易凯 on 16/4/28.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IWFoundCellViewDelegate <NSObject>

- (void)foundCellViewMoreButtonClick:(NSString *)viewType;

@end

@interface IWFoundCellView : UIView

- (instancetype)initWithFrame:(CGRect)frame withData:(NSArray *)dataArray viewType:(NSString *)viewType;

@property (nonatomic, weak) id <IWFoundCellViewDelegate> delegate;

@end

