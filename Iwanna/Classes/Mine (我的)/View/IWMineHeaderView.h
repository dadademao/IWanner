//
//  IWMineHeaderView.h
//  Iwanna
//
//  Created by 易凯 on 16/1/6.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IWMineHeaderViewDelegate <NSObject>

- (void)mineHeaderViewClick;

@end

@interface IWMineHeaderView : UIView

@property (nonatomic, weak) id <IWMineHeaderViewDelegate> delegate;

@end
