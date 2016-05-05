//
//  YKLoginTextField.m
//  Iwanna
//
//  Created by 易凯 on 16/2/11.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "IWLoginTextField.h"
#import "UIButton+RemoveHighlightEffect.h"

@interface IWLoginTextField ()

@property (nonatomic, copy) NSString *placeholderStr;

@end

@implementation IWLoginTextField

- (instancetype)initWithFrame:(CGRect)frame andPlaceholder:(NSString *)placeholderStr{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor greenColor];
        self.placeholderStr = placeholderStr;
        
        self.layer.cornerRadius = frame.size.height * 0.5;
        self.clipsToBounds = YES;
        
        UIButton *attributeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, frame.size.width / 6, frame.size.height)];
        attributeBtn.removeHighlightEffect = YES;
        [attributeBtn addTarget:self action:@selector(attributeBtnClick) forControlEvents:UIControlEventTouchUpInside];
        self.attributeBtn = attributeBtn;
        attributeBtn.backgroundColor = [UIColor whiteColor];
        [self addSubview:attributeBtn];
        
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(frame.size.width / 6, 0, frame.size.width - attributeBtn.width, frame.size.height)];
        self.textField = textField;
        textField.placeholder = [NSString stringWithFormat:@"| %@",placeholderStr];
        textField.clearsOnBeginEditing = YES; // 再次编辑就清空
        [self addSubview:textField];
    }
    return self;
}

- (void)attributeBtnClick{
    if ([self.placeholderStr isEqualToString:@"输入密码"]) {
        //每输入一个字符就变成点
        self.textField.secureTextEntry = !self.textField.secureTextEntry;
    }
}

@end
