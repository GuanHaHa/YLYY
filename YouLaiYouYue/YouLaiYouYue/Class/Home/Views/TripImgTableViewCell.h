//
//  TripImgTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/19.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface TripImgTableViewCell : UITableViewCell

@property (strong , nonatomic) UIImageView *img;

@property (strong , nonatomic) UILabel *contenLabel;




@property (copy , nonatomic) NSDictionary *dic;

@property (copy , nonatomic) NSDictionary *imgHDic;


@end
