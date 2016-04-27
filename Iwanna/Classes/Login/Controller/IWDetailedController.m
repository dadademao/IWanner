//
//  IWDetailedController.m
//  Iwanna
//
//  Created by apple on 15/12/27.
//  Copyright © 2015年 Iwanna. All rights reserved.
//

#import "IWDetailedController.h"
#import "IWLoginCellView.h"
#import "WMCustomDatePicker.h"
#import "IWDetailedControllerView.h"
#import <CoreLocation/CoreLocation.h>
#import "IWHobbyController.h"

#define MARGIN 20

@interface IWDetailedController () <WMCustomDatePickerDelegate, CLLocationManagerDelegate>
@property (nonatomic, weak) UIButton *selectedBtn;
@property (nonatomic, weak) WMCustomDatePicker *datePicker;
@property (nonatomic, strong) CLLocationManager *mgr;
@property (nonatomic, weak) UILabel *locationDetailedLabel;
@end

@implementation IWDetailedController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemClick:)];;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClick:)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    [self addSubViews];
}

- (void)addSubViews{
    CGFloat subViewH = 50 * kPP;
    
    IWLoginCellView *nickname = [[IWLoginCellView alloc] initWithFrame:CGRectMake(0, MARGIN, SCREENW, subViewH) titleName:@"昵称" placeholder:@"请输入昵称" isReference:YES];
    [self.view addSubview:nickname];
    
    UIView *sexView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(nickname.frame) + MARGIN , SCREENW, subViewH)];
    sexView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:sexView];
    
    UIView *segmentationView1  = [[UIView alloc] initWithFrame:CGRectMake(SCREENW * 0.5, MARGIN * 0.5, 1, subViewH - MARGIN)];
    segmentationView1.backgroundColor = YKSubColor;
    [sexView addSubview:segmentationView1];
    
    UIButton *manButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, SCREENW * 0.5, subViewH)];
    [manButton setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forState:UIControlStateSelected];
    [manButton setTitle:@"男" forState:UIControlStateNormal];
    [manButton setTitleColor:YKSubColor forState:UIControlStateNormal];
    [manButton addTarget:self action:@selector(sexBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [sexView addSubview:manButton];
    
    UIButton *womanButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREENW * 0.5 + 1, 0, SCREENW * 0.5, subViewH)];
    [womanButton setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forState:UIControlStateSelected];
    [womanButton setTitle:@"女" forState:UIControlStateNormal];
    [womanButton setTitleColor:YKSubColor forState:UIControlStateNormal];
    [womanButton addTarget:self action:@selector(sexBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [sexView addSubview:womanButton];
    
    WMCustomDatePicker *datePicker =[[WMCustomDatePicker alloc]initWithframe:CGRectMake(30 * kPP, CGRectGetMaxY(sexView.frame), SCREENW, 3 * subViewH) Delegate:self PickerStyle:WMDateStyle_YearMonthDay];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init]; // 初始化时间格式化工具
    formatter.dateFormat = @"yyyy-MM-dd"; // 告诉格式化工具怎么去读取这个时间
    NSDate *createDate = [formatter dateFromString:@"2008-08-08"];
    datePicker.ScrollToDate = createDate;
    self.datePicker = datePicker;
    [self.view addSubview:datePicker];
    
    UILabel *birthdayLabel = [[UILabel alloc] init];
    birthdayLabel.text = @"生日";
    [birthdayLabel sizeToFit];
    birthdayLabel.textColor = YKSubColor;
    birthdayLabel.x = MARGIN * 0.5;
    birthdayLabel.centerY = CGRectGetMaxY(datePicker.frame) - datePicker.height * 0.5;
    [self.view addSubview:birthdayLabel];
    
    CGFloat SVX = (SCREENW - CGRectGetMaxX(birthdayLabel.frame)) / 3;
    
    for (int i = 0; i < 3; i ++) {
        UIView *segmentationView  = [[UIView alloc] init];
        //WithFrame:CGRectMake(SVX * (i + 1), MARGIN * 0.5, 1, subViewH - MARGIN)];
        segmentationView.backgroundColor = YKSubColor;
        segmentationView.size = CGSizeMake(1, subViewH - MARGIN * 1.5);
        segmentationView.x = SVX * i + CGRectGetMaxX(birthdayLabel.frame) + MARGIN;
        segmentationView.centerY = CGRectGetMaxY(datePicker.frame) - datePicker.height * 0.5;
        [self.view addSubview:segmentationView];
    }
    
    [self.view insertSubview:[[IWDetailedControllerView alloc] initWithFrame:self.view.bounds withCentY:datePicker.centerY] atIndex:0];
    
    UIView *locationView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(datePicker.frame), SCREENH, subViewH)];
    locationView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:locationView];
    
    UILabel *locationLabel = [[UILabel alloc] init];
    locationLabel.text = @"所在城市";
    locationLabel.textColor = YKSubColor;
    [locationLabel sizeToFit];
    locationLabel.x = MARGIN * 0.5;
    locationLabel.centerY = locationView.height * 0.5;
    [locationView addSubview:locationLabel];
    
    UIView *segmentationView2  = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(locationLabel.frame) + MARGIN * 0.5, MARGIN * 0.5, 1, subViewH - MARGIN)];
    segmentationView2.backgroundColor = YKSubColor;
    [locationView addSubview:segmentationView2];
    
    UIButton *locationBtn = [[UIButton alloc] init];
    locationBtn.backgroundColor = YKMainColor;
    [locationBtn addTarget:self action:@selector(locationBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [locationBtn setTitle:@"点我" forState:UIControlStateNormal];
    locationBtn.size = CGSizeMake(subViewH, subViewH);
    locationBtn.x = SCREENW - subViewH;
    [locationView addSubview:locationBtn];
    
    UILabel *locationDetailedLabel = [[UILabel alloc] init];
    self.locationDetailedLabel = locationDetailedLabel;
    locationDetailedLabel.textColor = YKSubColor;
    locationDetailedLabel.x = CGRectGetMaxX(segmentationView2.frame) + MARGIN * 0.5;
    locationDetailedLabel.height = subViewH;
    locationDetailedLabel.width = locationBtn.x - locationDetailedLabel.x;
    [locationView addSubview:locationDetailedLabel];
}

// 点击按钮设置定位功能
- (void)locationBtnClick:(UIButton *)button{
    NSLog(@"这里要获取对应的位置");
    // 如果没有开启定位服务
    if (![CLLocationManager locationServicesEnabled]) {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"定位不成功 ,请确认开启定位" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
        return;
    }
    
    // 创建定位的对象
    self.mgr = [[CLLocationManager alloc] init];
    // 如果开启了定位服务
    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedAlways) {
        // 获取用户授权app在前台后台都会定位(需要在info.plist加NSLocationAlwaysUsageDescription字段)
        // [self.mgr requestAlwaysAuthorization];
        // 只能在使用的时候(在前台)能够定位(需要在info.plist加NSLocationWhenInUseUsageDescription字段)
        [self.mgr requestWhenInUseAuthorization];
    }
    
    //设置定位的精度为最佳
    self.mgr.desiredAccuracy = kCLLocationAccuracyBest;
    self.mgr.delegate = self;
    // 开始定位
    [self.mgr startUpdatingLocation];
}

// 定位协议回调方法
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    //此处locations存储了持续更新的位置坐标值，取最后一个值为最新位置，如果不想让其持续更新位置，则在此方法中获取到一个值之后让locationManager stopUpdatingLocation
    
    CLLocation *currentLocation = [locations lastObject];
    // 获取当前所在的城市名
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    //根据经纬度反向地理编译出地址信息
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *array, NSError *error){
        if (array.count > 0){
            CLPlacemark *placemark = [array lastObject];
            //将获得的所有信息显示到label上
            NSLog(@"%@",placemark.name);
            //获取城市
            self.locationDetailedLabel.text = [NSString stringWithFormat:@"%@%@",placemark.locality, placemark.subLocality];
            if (!self.locationDetailedLabel.text.length) {
                //四大直辖市的城市信息无法通过locality获得，只能通过获取省份的方法来获得（如果city为空，则可知为直辖市）
                self.locationDetailedLabel.text = [NSString stringWithFormat:@"%@%@",placemark.locality, placemark.administrativeArea];
            }
        }else if (error == nil && [array count] == 0){
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"定位不成功 ,获取位置失败" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alertView show];
        }
        else if (error != nil){
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"定位不成功 ,获取位置失败" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alertView show];
        }
        
    }];
    //系统会一直更新数据，直到选择停止更新，因为我们只需要获得一次经纬度即可，所以获取之后就停止更新
    [manager stopUpdatingLocation];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)sexBtnClick:(UIButton *)button{
    self.selectedBtn.selected = NO;
    self.selectedBtn = button;
    self.selectedBtn.selected = YES;
}

- (void)leftBarButtonItemClick:(UIBarButtonItem *)item{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBarButtonItemClick:(UIBarButtonItem *)item{
    [self.navigationController pushViewController:[[IWHobbyController alloc] init] animated:YES];
}

- (void)finishDidSelectDatePicker:(WMCustomDatePicker *)datePicker year:(NSString *)year month:(NSString *)month day:(NSString *)day hour:(NSString *)hour minute:(NSString *)minute weekDay:(NSString *)weekDay{
    
    datePicker.ScrollToDate = [NSDate date];
    NSLog(@"%@====%@=====%@=====%@=====%@=====%@=====",year,month,day,hour,minute,weekDay);
    NSLog(@"%@",[NSString stringWithFormat:@"%@%@%@%@%@%@",year,month,day,hour,minute,weekDay]);
}


//根据date返回string
- (NSString *)dateFromString:(NSDate *)date withFormat:(NSString *)format {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:format];
    NSString *dateStr = [inputFormatter stringFromDate:date];
    return dateStr;
}

@end
