//
//  MALTabBarItem.m
//  TabBarControllerModel
//
//  Created by wangtian on 14-6-25.
//  Copyright (c) 2014年 wangtian. All rights reserved.
//

#import "MALTabBarItem.h"
#define kImageBiLi 1
#define itemFrame CGRectMake(0, 0, itemWH, itemWH)
#define distanceWithLableAndImageView 3
@implementation MALTabBarItem


+ (MALTabBarItem *)getMALTabBarItemWithModel:(MALTabBarItemModel *)itemModel
{
    MALTabBarItem *tabBarItem = [[MALTabBarItem alloc] initWithFrame:itemFrame];
    [tabBarItem configItemWithItemModel:itemModel];
    tabBarItem.exclusiveTouch = YES;
    return tabBarItem;
}

#pragma mark -设置item信息
- (void)configItemWithItemModel:(MALTabBarItemModel *)itemModel
{
    if (itemModel.itemTitle != nil) {
        

    }
    if (itemModel.itemImageName != nil) {
        
         [self setImage:[UIImage imageNamed:itemModel.itemImageName] forState:(UIControlStateNormal)];
    }
}

#pragma mark -设置小红圈里的数字
- (void)setItemBadgeNumber:(NSInteger)number
{
    if (number != 0) {
        
        if (self.badgeValueView.hidden) {
            
            self.badgeValueView.hidden = NO;
        }
        
//        [self.badgeValueView setTitle:[NSString stringWithFormat:@"%d",number] forState:(UIControlStateNormal)];
    } else {
  
        self.badgeValueView.hidden = YES;
        
    }
}

- (UIButton *)badgeValueView
{
    if (_badgeValueView == nil) {
        
        CGFloat x = itemWH - badgeValueViewWH + 5;
        CGFloat y = 0;
        _badgeValueView = [[UIButton alloc] initWithFrame:CGRectMake(x, y,badgeValueViewWH, badgeValueViewWH)];
//        [_badgeValueView setBackgroundImage:[UIImage imageNamed:badgeValueViewImageName] forState:(UIControlStateNormal)];
        _badgeValueView.backgroundColor = [UIColor colorWithRed:255/255. green:195/255. blue:33/255. alpha:1.000];
        _badgeValueView.titleLabel.font = badgeValueFont;
        [_badgeValueView setTitleColor:badgeValueColor forState:(UIControlStateNormal)];
        _badgeValueView.layer.cornerRadius = badgeValueViewWH/2;
        _badgeValueView.layer.masksToBounds = YES;
        _badgeValueView.userInteractionEnabled = NO;
        _badgeValueView.hidden = YES;
        _badgeValueView.adjustsImageWhenHighlighted = NO;
    }
    return  _badgeValueView;
}

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 设置按钮文字颜色
//        [self setTitleColor:itemTitleColor forState:UIControlStateNormal];
        // 设置按钮文字居中
//        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 让图片按照原来的宽高比显示出来
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        // 设置按钮文字的字体
//        self.titleLabel.font = itemTitleFont;
        // 设置按钮里面的内容（UILabel、UIImageView）居中
        // self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
//        UILabel *title = [[UILabel alloc]init];
//        title.center = CGPointMake(self.imageView.center.x, self.imageView.center.y+self.imageView.frame.size.height / 2 + 10);
//        title.bounds = CGRectMake(0, 0, self.frame.size.width, 20);
//        title.text = @"11231";
//        [self addSubview:title];
        [self addSubview:self.badgeValueView];
        self.adjustsImageWhenHighlighted = NO;
        
    }
    return self;
}


#pragma mark - 重写了UIButton的方法
#pragma mark 控制UILabel的位置和尺寸
// contentRect其实就是按钮的位置和尺寸
//- (CGRect)titleRectForContentRect:(CGRect)contentRect
//{
//    CGFloat titleX = 0;
//    CGFloat titleHeight = contentRect.size.height * (1 - kImageBiLi) - distanceWithLableAndImageView;
//    CGFloat titleY = contentRect.size.height - titleHeight;
//    CGFloat titleWidth = contentRect.size.width;
//    return CGRectMake(titleX, titleY, titleWidth, titleHeight);
//}

#pragma mark 控制UIImageView的位置和尺寸
//- (CGRect)imageRectForContentRect:(CGRect)contentRect
//{
//    CGFloat imageX = 0.5;
//    CGFloat imageY = 0.5;
//    CGFloat imageWidth = contentRect.size.width;
//    CGFloat imageHeight = contentRect.size.height;
//    return CGRectMake(imageX, imageY, imageWidth-0.5, imageHeight-0.5);
//}



@end
