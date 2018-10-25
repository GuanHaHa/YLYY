//
//  NewImgTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/27.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DeleteImgDelegate <NSObject>

- (void)deleteImg;

@end


@interface NewImgTableViewCell : UITableViewCell

@property (strong , nonatomic) UIImageView *img;

@property (strong , nonatomic) UIButton *deleteBtn;

@property (strong , nonatomic) UILabel *firstLabel;

@property (strong , nonatomic) NSString *picUrl;


@property (weak , nonatomic) id<DeleteImgDelegate>delegate;

@end
