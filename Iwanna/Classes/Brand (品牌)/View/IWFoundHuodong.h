//
//  IWFoundHuodong.h
//  Iwanna
//
//  Created by 易凯 on 16/5/17.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IWFoundHuodongDelegate <NSObject>

- (void)huodongMoreButtonClick;

@end

@interface IWFoundHuodong : UIView
@property (nonatomic, weak) id <IWFoundHuodongDelegate> delegate;

@property (nonatomic, strong) NSArray *dataArray;
@end
