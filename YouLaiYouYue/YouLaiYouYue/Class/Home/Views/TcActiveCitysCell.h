//
//  TcActiveCitysCell.h
//  Amusing
//
//  Created by 时代科技 on 2018/4/24.
//  Copyright © 2018年 timesScience. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TcActiveCitysCellDelegate<NSObject>

- (void)cityCollectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface TcActiveCitysCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic,strong)NSMutableArray *dataArray;

//当前定位城市
@property (nonatomic,copy)NSString *location_city;

@property (nonatomic,weak)id<TcActiveCitysCellDelegate>delegate;

- (void)updateUIWithData:(NSMutableArray *)dataArray;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
