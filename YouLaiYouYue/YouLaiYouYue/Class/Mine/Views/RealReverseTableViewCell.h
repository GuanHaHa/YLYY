//
//  RealReverseTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/14.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol RealReverseDeleteImgDelegate <NSObject>

- (void)deleteTwoImgIndex:(NSIndexPath *)index;

@end
@interface RealReverseTableViewCell : UITableViewCell
@property (strong , nonatomic) UIImageView *img;

@property (strong , nonatomic) UIButton *deleteBtn;

@property (strong , nonatomic) UIImageView *smallImg;

@property (strong , nonatomic) UILabel *titleLabel;

@property (assign , nonatomic) NSIndexPath *index;

@property (weak , nonatomic) id<RealReverseDeleteImgDelegate>delegate;

@end
