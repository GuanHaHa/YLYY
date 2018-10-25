//
//  EditRemCollectionViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/27.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditRemCollectionViewCellDelegate <NSObject>

- (void)deleteIndexPath:(NSInteger )indexRow;

- (void)changeDescribeIndexPath:(NSInteger )indexRow with:(UILabel *)label;

@end

@interface EditRemCollectionViewCell : UICollectionViewCell

@property (strong , nonatomic) UIImageView *imgView;

@property (strong , nonatomic) UIButton *deleteBtn;

@property (strong , nonatomic) UILabel *editLabel;

@property (copy , nonatomic) NSDictionary *dic;

@property (assign , nonatomic) NSInteger indexRow;

@property (weak , nonatomic) id<EditRemCollectionViewCellDelegate>delegate;



@end
