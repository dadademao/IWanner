//
//  IWHobbyController.m
//  Iwanna
//
//  Created by apple on 16/1/2.
//  Copyright © 2016年 Iwanna. All rights reserved.
//

#import "IWHobbyController.h"
#import "IWHobbyCell.h"
#import "IWTabBarController.h"

@interface IWHobbyController ()
@property (nonatomic, strong) NSArray *hobbys;
@end

@implementation IWHobbyController

- (NSArray *)hobbys{
    if (_hobbys == nil) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"IWHobbySource" ofType:@"plist"];
        _hobbys = [NSArray arrayWithContentsOfFile:path];
        
        
    }
    return _hobbys;
}

- (instancetype)init{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat itemW = (SCREENW - 2 * 20 - 2 * 5) / 3;
    // 设置每个格子的大小
    flowLayout.itemSize = CGSizeMake(itemW, 40);
    // 设置每个格子之间的最小间距
    flowLayout.minimumInteritemSpacing = 5;
    // 设置每行之间的最小行间距
    flowLayout.minimumLineSpacing = 10;
    // 设置每组之间的内边距
    flowLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    return [super initWithCollectionViewLayout:flowLayout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = YKBackColor;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemClick:)];;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClick:)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // 注册cell
    [self.collectionView registerClass:[IWHobbyCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // 注册headerView
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
}

// 设置headerView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (self.hobbys[section][@"headerView"] && [self.hobbys[section][@"headerView"] length] > 0) {
        return CGSizeMake(SCREENW, 50);
    }
    return CGSizeMake(0, 0);
}

// 实现注册UICollectionReusableView的派生类
- (UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader){
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        reusableview = headerView;
    }
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.x = 20;
    nameLabel.centerY = reusableview.height * 0.5;
    nameLabel.text = self.hobbys[indexPath.section][@"headerView"];
    nameLabel.font = SYS_FONT(20);
    [nameLabel sizeToFit];
    [reusableview addSubview:nameLabel];
    return reusableview;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return self.hobbys.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray *tempArray = self.hobbys[section][@"title"];
    return [tempArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    IWHobbyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSArray *tempArray = self.hobbys[indexPath.section][@"title"];
    [cell.nameButton setTitle:tempArray[indexPath.row] forState:UIControlStateNormal];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)leftBarButtonItemClick:(UIBarButtonItem *)item{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBarButtonItemClick:(UIBarButtonItem *)item{
    [self presentViewController:[[IWTabBarController alloc] init] animated:YES completion:nil];
//    [UIApplication sharedApplication].keyWindow.rootViewController = [[IWTabBarController alloc] init];
}

@end
