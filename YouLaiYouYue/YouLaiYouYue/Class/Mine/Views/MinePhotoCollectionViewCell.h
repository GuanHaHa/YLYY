//
//  MinePhotoCollectionViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/27.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MinePhotoModel.h"

@protocol MinePhotoCollectionViewCellDelegate <NSObject>

- (void)deleteIndexPath:(NSInteger )indexRow;

@end


@interface MinePhotoCollectionViewCell : UICollectionViewCell

@property (strong , nonatomic) UIImageView *imgView;

@property (strong , nonatomic) UIButton *deleteBtn;

@property (strong , nonatomic) UILabel *editLabel;

@property (assign , nonatomic) NSInteger indexRow;

@property (strong , nonatomic) MinePhotoModel *model;

@property (weak , nonatomic) id<MinePhotoCollectionViewCellDelegate>deleate;

@end
