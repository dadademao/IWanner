//
//  IWFoundViewController.m
//  Iwanna
//
//  Created by 易凯 on 16/4/27.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "IWFoundViewController.h"
#import "IWFoundCellView.h"
#import "IWFoundNewController.h"
#import "IWFoundActivityController.h"

@interface IWFoundViewController () <IWFoundCellViewDelegate>

@property (nonatomic, strong) NSDictionary *dataDict;

@end

@implementation IWFoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"1314");
    [self setNavigation];
    
    [self addSubViews];
}

- (void)setNavigation{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigation_sort" target:self action:@selector(leftButtonClick:)];
}

- (void)leftButtonClick:(UIBarButtonItem *)item{
    NSLog(@"123");
}

- (void)addSubViews{
    IWFoundCellView *newView = [[IWFoundCellView alloc] initWithFrame:CGRectMake(0, 0, SCREENW, (SCREENH - 108) * 0.5) withData:self.dataDict[@"new"] viewType:@"新鲜事"];
    newView.delegate = self;
    [self.view addSubview:newView];
    
    IWFoundCellView *activityView = [[IWFoundCellView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(newView.frame), SCREENW, (SCREENH - 108) * 0.5) withData:self.dataDict[@"activity"] viewType:@"活动"];
    activityView.delegate = self;
    [self.view addSubview:activityView];
}

- (void)foundCellViewMoreButtonClick:(NSString *)viewType{
    if ([viewType isEqualToString:@"新鲜事"]) {
        IWFoundNewController * newController = [[IWFoundNewController alloc] initWithData:self.dataDict[@"new"]];
        [self.navigationController pushViewController:newController animated:YES];
    }else{
        IWFoundActivityController * activityController = [[IWFoundActivityController alloc] initWithData:self.dataDict[@"activity"]];
        [self.navigationController pushViewController:activityController animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSDictionary *)dataDict{
    if (!_dataDict) {
        _dataDict = @{
                      @"new" : @[
                              @{
                                  @"image" : @"http://d.hiphotos.baidu.com/image/pic/item/f7246b600c3387448800ff78530fd9f9d62aa0e9.jpg",
                                  @"title" : @"复古+创新+浪漫主义=Attessa",
                                  @"time" : @"今天 10:00"
                                  },
                              @{
                                  @"image" : @"http://e.hiphotos.baidu.com/image/pic/item/b17eca8065380cd7c5c084bca344ad3458828180.jpg",
                                  @"title" : @"复古+创新+浪漫主义=Attessa",
                                  @"time" : @"今天 16:00"
                                  },
                              @{
                                  @"image" : @"http://a.hiphotos.baidu.com/image/pic/item/bf096b63f6246b606463596be9f81a4c510fa244.jpg",
                                  @"title" : @"复古+创新+浪漫主义=Attessa",
                                  @"time" : @"今天 11:00"
                                  },
                              @{
                                  @"image" : @"http://h.hiphotos.baidu.com/image/pic/item/37d3d539b6003af3ed4e6a7d372ac65c1038b633.jpg",
                                  @"title" : @"复古+创新+浪漫主义=Attessa",
                                  @"time" : @"今天 12:00"
                                  },
                              @{
                                  @"image" : @"http://a.hiphotos.baidu.com/image/pic/item/f9dcd100baa1cd117a87fd46ba12c8fcc3ce2da6.jpg",
                                  @"title" : @"复古+创新+浪漫主义=Attessa",
                                  @"time" : @"今天 13:00"
                                  },
                              @{
                                  @"image" : @"http://g.hiphotos.baidu.com/image/pic/item/c2cec3fdfc039245b077b7e38394a4c27c1e251f.jpg",
                                  @"title" : @"复古+创新+浪漫主义=Attessa",
                                  @"time" : @"今天 14:00"
                                  },
                              @{
                                  @"image" : @"http://g.hiphotos.baidu.com/image/pic/item/3801213fb80e7becfa5cfb092b2eb9389a506b50.jpg",
                                  @"title" : @"复古+创新+浪漫主义=Attessa",
                                  @"time" : @"今天 15:00"
                                  }
                              ],
                      @"activity" : @[
                              @{
                                  @"image" : @"http://b.hiphotos.baidu.com/image/pic/item/91529822720e0cf3d6a146fa0846f21fbe09aa58.jpg",
                                  @"title" : @"一个你不知道的海天盛宴",
                                  @"time" : @"今天 10:00"
                                  },
                              @{
                                  @"image" : @"http://e.hiphotos.baidu.com/image/pic/item/1c950a7b02087bf4162e67f6f0d3572c10dfcfea.jpg",
                                  @"title" : @"一个你不知道的海天盛宴",
                                  @"time" : @"今天 11:00"
                                  },
                              @{
                                  @"image" : @"http://e.hiphotos.baidu.com/image/pic/item/314e251f95cad1c8037ed8c97b3e6709c83d5112.jpg",
                                  @"title" : @"一个你不知道的海天盛宴",
                                  @"time" : @"今天 12:00"
                                  },
                              @{
                                  @"image" : @"http://e.hiphotos.baidu.com/image/pic/item/91529822720e0cf39396832a0e46f21fbf09aafa.jpg",
                                  @"title" : @"一个你不知道的海天盛宴",
                                  @"time" : @"今天 13:00"
                                  },
                              @{
                                  @"image" : @"http://f.hiphotos.baidu.com/image/pic/item/a50f4bfbfbedab642ebcbb1ff336afc378311e26.jpg",
                                  @"title" : @"一个你不知道的海天盛宴",
                                  @"time" : @"今天 14:00"
                                  },
                              @{
                                  @"image" : @"http://m.818today.com/imgsy/image/2016/0215/6359114724079675302648537.jpg",
                                  @"title" : @"一个你不知道的海天盛宴",
                                  @"time" : @"今天 15:00"
                                  },
                              @{
                                  @"image" : @"http://m.818today.com/imgsy/image/2016/0215/6359114592207963687677523.jpg",
                                  @"title" : @"一个你不知道的海天盛宴",
                                  @"time" : @"今天 16:00"
                                  }
                              ]
                      };
    }
    return _dataDict;
}


@end
