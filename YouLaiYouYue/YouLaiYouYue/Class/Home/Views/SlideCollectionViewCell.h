//
//  SlideCollectionViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/17.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoModel.h"
@interface SlideCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UIImageView *imgView;

@property (strong , nonatomic) UIImageView *playImg;

@property (strong , nonatomic) VideoModel *model;

@end
