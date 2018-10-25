//
//  TcActiveCitysCell.m
//  Amusing
//
//  Created by 时代科技 on 2018/4/24.
//  Copyright © 2018年 timesScience. All rights reserved.
//

#import "TcActiveCitysCell.h"
#import "City.h"

#define KFont(font) [UIFont systemFontOfSize:(font)]
#define RGBColor(a, r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define CG_RGBColor(a, r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)].CGColor
#define ScreenH [UIScreen mainScreen].bounds.size.height
#define ScreenW [UIScreen mainScreen].bounds.size.width

@implementation TcActiveCitysCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *identifer = @"ActiveCitysCell";
    
    TcActiveCitysCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([TcActiveCitysCell class]) owner:nil options:nil] firstObject];
    }
    return cell;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    //注册组头
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"sectionView"];
}
- (void)updateUIWithData:(NSMutableArray *)dataArray {
    if (_dataArray.count > 0) {
        [_dataArray removeAllObjects];
    }
    [self.dataArray addObjectsFromArray:dataArray];
    [_collectionView reloadData];
}
//获取headerView
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"sectionView" forIndexPath:indexPath];
        NSArray *titles = @[@"定位",@"热门城市"];
        UILabel *sectionLabel = [[UILabel alloc] init];
        sectionLabel.text = titles[indexPath.section];
        sectionLabel.textColor = RGBColor(1, 119, 123, 140);
        sectionLabel.font = KFont(15);
        sectionLabel.frame = CGRectMake(10, 0, 100, 30);
        sectionLabel.textAlignment = NSTextAlignmentLeft;
        [headerView addSubview:sectionLabel];
        headerView.backgroundColor = _collectionView.backgroundColor;
        return headerView;
    }
    return nil;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.clipsToBounds = YES;
    cell.layer.cornerRadius = 5;
    cell.layer.borderWidth = 0.5;
    cell.layer.borderColor = CG_RGBColor(1, 212, 220, 225);
    cell.backgroundColor = [UIColor whiteColor];
    if (indexPath.section == 0) {
        UIButton *locationBtn = [[UIButton alloc] initWithFrame:cell.bounds];
        NSString *location_city = _location_city.length > 0 ? _location_city:@"哈尔滨";
        [locationBtn setTitle:location_city forState:UIControlStateNormal];
        [locationBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        locationBtn.titleLabel.font = KFont(15);
        [locationBtn setImage:[UIImage imageNamed:@"location_city"] forState:UIControlStateNormal];
        locationBtn.backgroundColor = cell.backgroundColor;
        [cell addSubview:locationBtn];
    } else {
        if (_dataArray.count > 0) {
            City *city = _dataArray[indexPath.row];
            UILabel *cellLabel = [[UILabel alloc] init];
            cellLabel.text = city.cityName;
            cellLabel.textColor = [UIColor blackColor];
            cellLabel.font = KFont(15);
            cellLabel.backgroundColor = cell.backgroundColor;
            cellLabel.textAlignment = NSTextAlignmentCenter;
            cellLabel.frame = cell.bounds;
            [cell addSubview:cellLabel];
        }
    }
    return cell;
}
- (UILabel *)LabelWithTitle:(NSString *)title {
    UILabel *cellLabel = [[UILabel alloc] init];
    cellLabel.text = title;
    cellLabel.textColor = [UIColor blackColor];
    cellLabel.font = KFont(15);
    cellLabel.textAlignment = NSTextAlignmentCenter;
    cellLabel.layer.borderWidth = 1;
    cellLabel.layer.borderColor = CG_RGBColor(1, 212, 220, 225);
    cellLabel.layer.cornerRadius = 5;
    return cellLabel;
}
- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return _dataArray.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (ScreenW == 320) {
        return CGSizeMake(85, 35);
    } else if (ScreenW == 414) {
        return CGSizeMake(109, 35);
    } else {
        return CGSizeMake(99, 35);
    }
}
//组头
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    return CGSizeMake(ScreenW, 30);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(10,10,10,10);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.delegate && [self.delegate respondsToSelector:@selector(cityCollectionView:didSelectItemAtIndexPath:)]) {
        [self.delegate cityCollectionView:collectionView didSelectItemAtIndexPath:indexPath];
    }
}
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}
@end

