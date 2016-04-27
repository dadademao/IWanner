//
//  YKLoginTextField.h
//  Iwanna
//
//  Created by 易凯 on 16/2/11.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IWLoginTextField : UIView
- (instancetype)initWithFrame:(CGRect)frame andPlaceholder:(NSString *)placeholder;

@property (nonatomic, weak) UIButton *attributeBtn;

@property (nonatomic, weak) UITextField *textField;
@end
