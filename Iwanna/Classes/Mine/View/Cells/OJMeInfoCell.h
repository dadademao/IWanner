//
//  OJMeInfoCell.h
//  Iwanna
//
//  Created by One'J on 16/5/3.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OJMeInfo;

@interface OJMeInfoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *meInfoView;

@property(nonatomic,strong) OJMeInfo *meInfo;

@end
