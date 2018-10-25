//
//  RealFrontTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/14.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RealDeleteImgDelegate <NSObject>

- (void)deleteImgIndex:(NSIndexPath *)index;

@end

@interface RealFrontTableViewCell : UITableViewCell

@property (strong , nonatomic) UILabel *titleLabel;

@property (strong , nonatomic) UIImageView *img;

@property (strong , nonatomic) UIButton *deleteBtn;

@property (assign , nonatomic) NSIndexPath *index;

@property (weak , nonatomic) id<RealDeleteImgDelegate>delegate;

@end
