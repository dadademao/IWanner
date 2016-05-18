//
//  IWFoundNewChildView.h
//  Iwanna
//
//  Created by 易凯 on 16/4/28.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ListHuodong, ListXinxianshi;

@interface IWFoundChildView : UIView

@property (nonatomic, strong) ListHuodong *huodong;
@property (nonatomic, strong) ListXinxianshi *xinxianshi;

@end
