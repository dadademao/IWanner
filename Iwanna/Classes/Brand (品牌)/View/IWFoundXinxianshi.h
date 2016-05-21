//
//  IWFoundXinxianshi.h
//  Iwanna
//
//  Created by 易凯 on 16/5/17.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IWFoundXinxianshiDelegate <NSObject>

- (void)xinxianshiMoreButtonClick;

@end

@interface IWFoundXinxianshi : UIView
@property (nonatomic, weak) id <IWFoundXinxianshiDelegate> delegate;

@property (nonatomic, strong) NSArray *dataArray;
@end
