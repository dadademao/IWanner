//
//  YKSettingsCell.h
//  Iwanna
//
//  Created by 易凯 on 16/1/6.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YKSettingsCell : UITableViewCell

@property (nonatomic, strong) NSDictionary *item;

+ (instancetype)cellWithTableView:(UITableView *)tableView withDict:(NSDictionary *)dict;

- (void)setTime:(NSString *)dataString;

@end
