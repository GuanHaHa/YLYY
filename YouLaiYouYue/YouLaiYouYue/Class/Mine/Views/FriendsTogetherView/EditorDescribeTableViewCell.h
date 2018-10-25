//
//  EditorDescribeTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/23.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoModel.h"
@protocol EditorDescribeTableViewDelegate <NSObject>

- (void)editDescribeIndexPath:(NSIndexPath *)indexPath withLabel:(UILabel *)label;

@end


@interface EditorDescribeTableViewCell : UITableViewCell

@property (strong , nonatomic) UIImageView *img;

@property (strong , nonatomic) UILabel *editLabel;

@property (strong , nonatomic) NSIndexPath *index;

@property (weak , nonatomic) id<EditorDescribeTableViewDelegate>delegate;

@property (strong , nonatomic) PhotoModel *model;

@end
