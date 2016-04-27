//
//  MALTabBar.m
//  TabBarControllerModel
//
//  Created by wangtian on 14-6-25.
//  Copyright (c) 2014年 wangtian. All rights reserved.
//

#import "MALTabBar.h"
#define distance 20 //第一个和最后一个item距离屏幕边界的距离
#define itemY 0 //item在tabBar 里面的纵坐标
#define MALTabBarSize CGSizeMake(MainScreenBoundsSize.width, tabBarHeight)
#define MALTabBarOrigin CGPointMake(0, MainScreenBoundsSize.height - MALTabBarSize.height)

@interface MALTabBar ()
@property (strong, nonatomic) UIView *cameraBackView;
@property (strong, nonatomic) UIButton *cameraBtn;
@end
@implementation MALTabBar
{
    float _itemDisTance;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.tintColor = [UIColor whiteColor];
    }
    return self;
}

- (NSMutableArray *)items
{
    if (_items == nil) {
        
        _items = [[NSMutableArray alloc] init];
    }
    return _items;
}

+ (MALTabBar *)getMALTabBarWithItemModels:(NSArray *)itemModels defaultSelectedIndex:(NSInteger)defaultSelectedIndex
{
    MALTabBar *malTabBar = [[MALTabBar alloc] initWithFrame:CGRectMake(MALTabBarOrigin.x, MALTabBarOrigin.y, MALTabBarSize.width, MALTabBarSize.height)];
   
    malTabBar.itemArray = itemModels;
    [malTabBar setUpViews];
    [malTabBar selectdefaultItem:defaultSelectedIndex];
   
  
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:malTabBar.bounds];
    malTabBar.layer.masksToBounds = NO;
    malTabBar.layer.shadowColor = RGBA(199, 201, 216, 1).CGColor;
    malTabBar.layer.shadowOffset = CGSizeMake(0.3f, -0.4f);
    malTabBar.layer.shadowRadius = 1;
    malTabBar.layer.shadowOpacity = 0.3f;
    malTabBar.layer.shadowPath = shadowPath.CGPath;
   
   

    malTabBar.backgroundColor   = RGBA(255,255,255,1);

    
    UIView *topView =  [[UIView alloc]initWithFrame:CGRectMake(0, 0, malTabBar.frame.size.width, 0.5)];
    topView.backgroundColor     = RGBA(199, 201, 216, 0.);
    [malTabBar addSubview:topView];
    return malTabBar;
}

#pragma mark - 设置item
- (void)setUpViews
{
    NSInteger itemCount = self.itemArray.count;
    _itemDisTance = (MALTabBarSize.width - 2 * distance - (itemCount + 1) * itemWH) / (itemCount);
    for(NSInteger itemIndex = 0; itemIndex < itemCount; itemIndex++){
    
        MALTabBarItemModel *itemModel = [self.itemArray objectAtIndex:itemIndex];
        itemModel.itemIndex = itemIndex;
        MALTabBarItem *item = [MALTabBarItem getMALTabBarItemWithModel:itemModel];
        item.tag = itemIndex;
        [item addTarget:self action:@selector(selectItem:) forControlEvents:(UIControlEventTouchDown)];
        CGPoint itemPosition = [self getItemPositionWithItemIndex:itemIndex itemCount:itemCount];
        [item setFrame:CGRectMake(itemPosition.x, itemPosition.y, itemWH, itemWH)];
        [self addSubview:item];
        [self.items addObject:item];
    }
    
    float backViewSpace = 7; //照相机按钮背景相较于默认大小的扩大范围
    self.cameraBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, itemWH + backViewSpace, itemWH + backViewSpace)];
    self.cameraBackView.center = CGPointMake(self.width/2, self.height/2);
//    self.cameraBackView.layer.cornerRadius = (itemWH + backViewSpace)/2;
//    self.cameraBackView.layer.masksToBounds = YES;
//    self.cameraBackView.backgroundColor = kColor(199, 201, 216, 0.4);
    [self addSubview:self.cameraBackView];
    
//    float cameraBtnSpace = 1; //照相机按钮相较缩小的范围
    self.cameraBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, itemWH * 2 + 4, itemWH * 2)];
    self.cameraBtn.center = CGPointMake(self.width/2, self.height/2 + 4);
    [self.cameraBtn setImage:[UIImage imageNamed:@"v2ReportBtn"] forState:UIControlStateNormal];
//    self.cameraBtn.layer.cornerRadius = (itemWH - cameraBtnSpace)/2;
//    self.cameraBtn.layer.masksToBounds = YES;
//    self.cameraBtn.backgroundColor = kColor(199, 201, 216, 0.8);
    [self.cameraBtn addTarget:self action:@selector(shortClick) forControlEvents:UIControlEventTouchUpInside];
    [self.cameraBtn addTarget:self action:@selector(longPress) forControlEvents:UIControlEventTouchUpOutside];
//    [self.cameraBtn addTarget:self action:@selector(l) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:self.cameraBtn];
    
    [self selectdefaultItem:0];
}

#pragma mark -获得item的坐标 （item的索引   item的总数）
- (CGPoint)getItemPositionWithItemIndex:(NSInteger)itemIndex itemCount:(NSInteger)itemCount
{
    CGPoint itemPosition;
    if (itemIndex > 1) {
        itemPosition = CGPointMake((itemIndex + 1) * (itemWH + _itemDisTance) + distance, (tabBarHeight - itemWH) / 2);
    } else {
        itemPosition = CGPointMake(itemIndex * (itemWH + _itemDisTance) + distance, (tabBarHeight - itemWH) / 2);
    }

    return itemPosition;
}

#pragma mark -点击tabBar上item调用方法
- (void)selectItem:(UIButton *)sender
{

    [self selectedItemAtIndex:sender.tag];
}

#pragma mark -默认选中项
- (void)selectdefaultItem:(NSInteger)defaultSelectedItemIndex
{
     _currentSelectedIndex = defaultSelectedItemIndex;
    _lastSelectedIndex = defaultSelectedItemIndex;
    [self setSelectedItemStatus];
}

#pragma mark -选中item  改变item状态  并向tabBar代理发送消息
- (void)selectedItemAtIndex:(NSInteger)itemIndex
{
//    if (itemIndex == _currentSelectedIndex) {
//        if (_currentSelectedIndex == 0) {
//            [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_indexScrollToTop object:nil];
//        } else if (_currentSelectedIndex == 1) {
//            [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_discoverScrollToTop object:nil];
//        } else if (_currentSelectedIndex == 2) {
//            [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_IMScrollToTop object:nil];
//        } else if (_currentSelectedIndex == 3) {
//            [[NSNotificationCenter defaultCenter] postNotificationName:kNotification_profileScrollToTop object:nil];
//        }
//        return;
//    }

    MALTabBarItemModel *itemModel = [self.itemArray objectAtIndex:itemIndex];
    _lastSelectedIndex = _currentSelectedIndex;
    _currentSelectedIndex = itemIndex;
       [self setLastSelectedItemStatus];
    if ([self.delegate respondsToSelector:@selector(selectedItem:)]) {
        
        [self.delegate selectedItem:itemModel];
    }
 
    [self setSelectedItemStatus];
    

}

#pragma mark - 设置选中item状态的样式
- (void)setSelectedItemStatus
{
    MALTabBarItemModel *itemModel = [self.itemArray objectAtIndex:_currentSelectedIndex];
    MALTabBarItem *currentSelecteditem = [self.items objectAtIndex:_currentSelectedIndex];
    [currentSelecteditem setImage:[UIImage imageNamed:itemModel.selectedItemImageName] forState:(UIControlStateNormal)];
    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction animations:^{
        currentSelecteditem.transform = CGAffineTransformMakeScale(0.84, 0.84);

    } completion:^(BOOL finished) {
        
        if (itemModel.selectedItemImageName != nil) {
            

            [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:25 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction animations:^{
                [currentSelecteditem setTitleColor:selectedItemTitleColor forState:(UIControlStateNormal)];
                currentSelecteditem.transform = CGAffineTransformMakeScale(1, 1);
            } completion:^(BOOL finished) {
    //            [UIView animateWithDuration:0.1 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
    //            currentSelecteditem.transform = CGAffineTransformScale(currentSelecteditem.transform, 1, 1);
    //            } completion:nil];
            }];
            
        }
    }];
    
}

#pragma mark - 设置上一个被选中的item的样式
- (void)setLastSelectedItemStatus
{
    
    MALTabBarItemModel *itemModel = [self.itemArray objectAtIndex:_lastSelectedIndex];
    MALTabBarItem *lastSelectedItem = [self.items objectAtIndex:_lastSelectedIndex];

    [lastSelectedItem setTitleColor:itemTitleColor forState:(UIControlStateNormal)];
    if (itemModel.itemImageName != nil) {
        
        [lastSelectedItem setImage:[UIImage imageNamed:itemModel.itemImageName] forState:(UIControlStateNormal)];
    }
}

- (void)setItemBadgeNumberWithIndex:(NSInteger)itemIndex badgeNumber:(NSInteger)badgeNumber
{
    MALTabBarItem *item = [self.items objectAtIndex:itemIndex];
    [item setItemBadgeNumber:badgeNumber];
}

- (void)cameraBtnClick {
    [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.cameraBackView.transform = CGAffineTransformMakeScale(0.1, 0.1);
        self.cameraBtn.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
       [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
           self.cameraBackView.transform = CGAffineTransformMakeScale(1, 1);
           self.cameraBtn.transform = CGAffineTransformMakeScale(1, 1);
       } completion:nil];
    }];
}

- (void)shortClick {
    if ([self.delegate respondsToSelector:@selector(shortTouchOnCameraBtn)]) {
        [self.delegate shortTouchOnCameraBtn];
    }
}

- (void)longPress {
    if ([self.delegate respondsToSelector:@selector(longTouchOnCameraBtn)]) {
        [self.delegate longTouchOnCameraBtn];
    }
}
@end




