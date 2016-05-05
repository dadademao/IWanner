//
//  IWFoundNewCell.h
//  Iwanna
//
//  Created by 易凯 on 16/4/28.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import <UIKit/UIKit.h>

#define IWFoundNewCell_ID @"foundNewCell_ID"

@class IWFoundNewModel;

@interface IWFoundNewCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) IWFoundNewModel *model;
@end
