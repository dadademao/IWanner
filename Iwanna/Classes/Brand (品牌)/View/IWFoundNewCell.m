//
//  IWFoundNewCell.m
//  Iwanna
//
//  Created by 易凯 on 16/4/28.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "IWFoundNewCell.h"
#import "IWFoundNewModel.h"

@interface IWFoundNewCell ()

@property (nonatomic, weak) UIImageView *image;
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *timeLabel;
@property (nonatomic, weak) UILabel *contentLabel;

@end

@implementation IWFoundNewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    IWFoundNewCell *cell = [tableView dequeueReusableCellWithIdentifier:IWFoundNewCell_ID];
    if (cell == nil) {
        cell = [[IWFoundNewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:IWFoundNewCell_ID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){

        [self addImageView];
        [self addTitleLabel];
        [self addTimeLabel];
        [self addContentLabel];
        
        self.selectedBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENW, 200 * kPP)];
        self.selectedBackgroundView.backgroundColor = YKSubColor;
    }
    return self;
}

- (void)addImageView{
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(20 * kPP, 22 * kPP, 190 * kPP, 140 * kPP)];
    self.image = image;
    [self addSubview:image];
}

- (void)addTitleLabel{
    CGFloat x = CGRectGetMaxX(self.image.frame) + 32 * kPP;
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(x, 22 * kPP, 378 * kPP, 32 * kPP)];
    self.titleLabel = titleLabel;
    titleLabel.font = SYS_FONT(32 * kPP);
    titleLabel.textColor = [UIColor blackColor];
    [self addSubview:titleLabel];
}

- (void)addTimeLabel{
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.titleLabel.x, CGRectGetMaxY(self.titleLabel.frame) + 15 * kPP, self.titleLabel.width, 24 * kPP)];
    self.timeLabel = timeLabel;
    timeLabel.font = SYS_FONT(24 * kPP);
    timeLabel.textColor = YKSubColor;
    [self addSubview:timeLabel];
}

- (void)addContentLabel{
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.timeLabel.x, CGRectGetMaxY(self.timeLabel.frame) + 15 * kPP, self.titleLabel.width, 28 * kPP * 3)];
    self.contentLabel = contentLabel;
    contentLabel.numberOfLines = 3;
    contentLabel.font = SYS_FONT(28 * kPP);
    contentLabel.textColor = YKSubColor;
    [self addSubview:contentLabel];
}

- (void)setModel:(IWFoundNewModel *)model{
    _model = model;
    [self.image sd_setImageWithURL:[NSURL URLWithString:model.imageName] placeholderImage:[UIImage imageNamed:@"textImage"]];
    self.titleLabel.text = model.title;
    self.timeLabel.text = model.time;
    self.contentLabel.text = model.content;
}

@end
