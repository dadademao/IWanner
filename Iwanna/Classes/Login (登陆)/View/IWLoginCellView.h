//
//  IWLoginCellView.h
//  Iwanna
//
//  Created by apple on 15/12/27.
//  Copyright © 2015年 Iwanna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IWLoginCellView : UIView
@property (nonatomic, weak) UITextField *textField;
- (instancetype)initWithFrame:(CGRect)frame titleName:(NSString *)titleName placeholder:(NSString *)placeholderStr isReference:(BOOL)isReference;

@end
