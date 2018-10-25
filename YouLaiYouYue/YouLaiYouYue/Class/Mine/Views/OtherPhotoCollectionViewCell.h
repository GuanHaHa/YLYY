//
//  OtherPhotoCollectionViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/27.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MinePhotoModel.h"
@interface OtherPhotoCollectionViewCell : UICollectionViewCell
@property (strong , nonatomic) UIImageView *imgView;

@property (assign , nonatomic) NSInteger indexRow;

@property (strong , nonatomic) MinePhotoModel *model;
@end
