//
//  EditImgCollectionViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/24.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditImgCollectionViewCellDelegate <NSObject>

- (void)deleteIndexPath:(NSInteger )indexRow;

- (void)changeDescribeIndexPath:(NSInteger )indexRow with:(UILabel *)label;

@end

@interface EditImgCollectionViewCell : UICollectionViewCell

@property (strong , nonatomic) UIImageView *imgView;

@property (strong , nonatomic) UIButton *deleteBtn;

@property (strong , nonatomic) UILabel *editLabel;

@property (copy , nonatomic) NSDictionary *dic;

@property (assign , nonatomic) NSInteger indexRow;

@property (weak , nonatomic) id<EditImgCollectionViewCellDelegate>delegate;


@end
