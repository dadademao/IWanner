//
//  OJMeInfoCell.m
//  Iwanna
//
//  Created by One'J on 16/5/3.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "OJMeInfoCell.h"
#import "OJMeInfo.h"


@interface OJMeInfoCell()
@property (weak, nonatomic) IBOutlet UIImageView *meInfoView;
@property (weak, nonatomic) IBOutlet UILabel *meInfoLabel;

@end


@implementation OJMeInfoCell

- (void)setMeInfo:(OJMeInfo *)meInfo{
    _meInfo = meInfo;
    self.meInfoLabel.text = meInfo.title;
    _meInfoView.image = [UIImage imageNamed:meInfo.details];
    self.meInfoLabel.textColor = UIColorFromHex(0x3d3b7a);
//    self.meInfoLabel.font = [UIFont systemFontOfSize:16];
    self.meInfoLabel.font = [UIFont systemFontOfSize:16];
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
