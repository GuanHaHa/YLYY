//
//  CityListViewController.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/19.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "BaseViewController.h"
#import "CityList.h"
@interface CityListViewController : BaseViewController

//选择城市block
@property (nonatomic, copy) void (^selectedCityBlock)(CityList *city);

// 重置block
@property (nonatomic , copy) void (^resetCityBlock)(NSString *cityId ,NSString *cityName);

@property (nonatomic, copy) NSString *look_City;

@end
