//
//  PartyCollectionViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/18.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SignModel.h"
@interface PartyCollectionViewCell : UICollectionViewCell

@property (strong , nonatomic) UILabel *titleLabel;


@property (strong, nonatomic) UIImageView *imageView;

@property (strong , nonatomic) SignModel *model;

@end
