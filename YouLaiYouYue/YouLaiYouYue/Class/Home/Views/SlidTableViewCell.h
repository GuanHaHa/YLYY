//
//  SlidTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/17.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SlideCollectionDelegate <NSObject>

- (void)didCollectionCellItem:(NSInteger)item;

@end

@interface SlidTableViewCell : UITableViewCell

@property (nonatomic ,weak) id<SlideCollectionDelegate>delegate;

@property (strong , nonatomic) NSArray *videoArr;
@end
