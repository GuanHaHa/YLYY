//
//  EditimgTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/11.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DeleteImgDelegate <NSObject>

- (void)deleteImgIndex:(NSIndexPath *)index;

@end

@interface EditimgTableViewCell : UITableViewCell

@property (strong , nonatomic) UIImageView *img;

@property (strong , nonatomic) UIButton *deleteBtn;

@property (strong , nonatomic) UILabel *firstLabel;

@property (copy , nonatomic) NSString *picUrl;

@property (weak , nonatomic) id<DeleteImgDelegate>delegate;

@property (assign , nonatomic) NSIndexPath *index;



@end
