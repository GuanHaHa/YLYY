//
//  EditRemImgTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/27.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditRemImgTableViewCellDelegate <NSObject>

- (void)deleteImgIndexPath:(NSInteger )index;

- (void)changeImgDescribeIndexPath:(NSInteger )index with:(UILabel *)label;

@end

@interface EditRemImgTableViewCell : UITableViewCell

@property (strong , nonatomic) NSMutableArray *imgArr;

@property (weak , nonatomic) id<EditRemImgTableViewCellDelegate>deletage;

@end
