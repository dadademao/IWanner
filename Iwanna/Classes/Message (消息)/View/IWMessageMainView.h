//
//  IWMessageMainView.h
//  Iwanna
//
//  Created by apple on 16/1/3.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IWMessageMainView : UIView


{
    CGPoint openPointCenter;
    CGPoint closePointCenter;
}
- (id)initWithFrame:(CGRect)frame WithParentView:(UIView *)parentview WithData:(NSArray *)dataArray;
- (void)openOrCloseView;

@property (nonatomic, strong) UIView *parentView; //抽屉视图的父视图

@end
