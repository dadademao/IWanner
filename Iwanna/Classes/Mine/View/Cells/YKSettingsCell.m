//
//  YKSettingsCell.m
//  Iwanna
//
//  Created by 易凯 on 16/1/6.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "YKSettingsCell.h"

@implementation YKSettingsCell

+ (instancetype)cellWithTableView:(UITableView *)tableView withDict:(NSDictionary *)dict{
    // 创建cell
    static NSString *ID = @"setting_cell";
    YKSettingsCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        // 根据字典里面的cellStyle的值来动态确定UITableViewCellStyle的类型
        cell = [[YKSettingsCell alloc] initWithStyle:[self cellStyleWithDict:dict] reuseIdentifier:ID];
    }
    return cell;
}

// 根据字典确定UITableViewCellStyle类型的逻辑
+ (UITableViewCellStyle)cellStyleWithDict:(NSDictionary *)dict{
    // 让cellStyle默认为UITableViewCellStyleDefault类型,如果plist文件里面没写也为这个类型
    UITableViewCellStyle cellStyle = UITableViewCellStyleDefault;
    // 如果字典里的cellStyle是其它类型的时候分别判断
    if ([dict[@"cellStyle"] isEqualToString:@"UITableViewCellStyleSubtitle"]) {
        cellStyle = UITableViewCellStyleSubtitle;
    }else if ([dict[@"cellStyle"] isEqualToString:@"UITableViewCellStyleValue1"]){
        cellStyle = UITableViewCellStyleValue1;
    }else if ([dict[@"cellStyle"] isEqualToString:@"UITableViewCellStyleValue2"]){
        cellStyle = UITableViewCellStyleValue2;
    }
    return cellStyle;
    
}

- (void)setItem:(NSDictionary *)item{
    _item = item;
    // 如果有title
    if (item[@"title"] && [item[@"title"] length] > 0) {
        self.textLabel.text = item[@"title"]; /*************cell的标题*************/
        self.textLabel.textColor = YKMainColor;
    }
    
    // 如果有details
    if (item[@"details"] && [item[@"details"] length] > 0) {
        self.detailTextLabel.text = item[@"details"]; /*************cell的副标题*************/
        
        if ([item[@"isHighlighted"] isEqualToString:@"YES"]) {
            [self.detailTextLabel setTextColor:[UIColor redColor]];
        }
    }
    
    // 如果timeString有值就去偏好设置里面取出时间字符串
    if (item[@"timeString"] && [item[@"timeString"] length] > 0) {
        NSString *timeString = [YKUserDefaults objectForKey:item[@"timeString"]];
        // 如果取出的时间字符串不为空,就把它设置给detailTextLabel
        if (timeString) {
            self.detailTextLabel.text = timeString;
        }
    }
    
    // 如果有icon
    if (item[@"icon"] && [item[@"icon"] length] > 0) {
        //设置icon
        self.imageView.image = [UIImage imageNamed:item[@"icon"]]; /*************cell的头像*************/
    }
    
    // 如果item里面有accessory这个key 并且accessory的value有值
    if (item[@"accessory"] && [item[@"accessory"] length] > 0) {
        // 根据accessory里面的value值确定对应的类型 (附件类型)
        Class accessoryClass = NSClassFromString(item[@"accessory"]);
        // 创建这个附件的对象
        id obj = [[accessoryClass alloc] init];
        // 如果附件类型是图片框
        if ([obj isKindOfClass:[UIImageView class]]) {
            // 根据plist文件中的accessoryImage设置图片框里面的图片
            UIImageView *imageView = obj;
            imageView.image = [UIImage imageNamed:item[@"accessoryImage"]];
            // 调整图片框大小
            [imageView sizeToFit];
        }
        // 把对应obj这个对象赋值给cell的附件
        self.accessoryView = obj; /*************cell的附件*************/
        
        // 如果switchName存在并且有值(说明是开关)
        if (item[@"switchName"] && [item[@"switchName"] length] > 0) {
            UISwitch *switcher = (UISwitch *)obj; // 强转类型
            // 给开关设置点击事件,在点击事件里保存开关状态
            [switcher addTarget:self action:@selector(switchValueChange:) forControlEvents:UIControlEventTouchUpInside];
            
            // 从偏好设置里读取开关状态并设置
            switcher.on = [YKUserDefaults boolForKey:self.item[@"switchName"]];
        }
    }
}

// 开关的点击事件(每次开关的状态改变,把当前的状态记录到偏好设置里面)
- (void)switchValueChange:(UISwitch *)switcher{
    // 把开关的状态保存到偏好设置中
    [YKUserDefaults setBool:switcher.isOn forKey:self.item[@"switchName"]];
    // 同步
    [YKUserDefaults synchronize];
}

- (void)setTime:(NSString *)dataString{
    // 设置detailTextLabel里面的时间内容
    self.detailTextLabel.text = dataString;
    // 把时间保存到偏好设置里面
    [YKUserDefaults setObject:dataString forKey:self.item[@"timeString"]];
    [YKUserDefaults synchronize]; // 同步
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

@end
