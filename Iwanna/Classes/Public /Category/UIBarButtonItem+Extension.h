//
//  
//  
//  通过一张图片设置UIBarButtonItem
//  
//
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
// 通过一张图片返回一个UIBarButtonItem
+ (instancetype)itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action;

+ (instancetype)itemWithImageName:(NSString *)imageName title:(NSString *)title target:(id)target action:(SEL)action;

+ (instancetype)itemWithTitle:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target action:(SEL)action;
@end
