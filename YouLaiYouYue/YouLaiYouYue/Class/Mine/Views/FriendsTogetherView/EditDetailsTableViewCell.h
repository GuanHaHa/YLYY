//
//  EditDetailsTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/24.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditDetailsTableViewCellDelegate <NSObject>

- (void)deleteImgIndexPath:(NSInteger )index;

- (void)changeImgDescribeIndexPath:(NSInteger )index with:(UILabel *)label;

@end

@interface EditDetailsTableViewCell : UITableViewCell

@property (strong , nonatomic) NSMutableArray *imgArr;

@property (weak , nonatomic) id<EditDetailsTableViewCellDelegate>deletage;

@end
