//
//  InsertImgTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/31.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HXPhotoPicker.h"
#import "MoreImgModel.h"

@protocol InsertImgViewDelegate <NSObject>

- (void)changePhoto:(HXPhotoView *)photoView with:(NSArray<HXPhotoModel *> *)allList;

@end

@interface InsertImgTableViewCell : UITableViewCell

/**  照片视图  */
@property (nonatomic, strong) HXPhotoView *photoView;
/**  照片管理  */
@property (nonatomic, strong) HXPhotoManager *manager;

@property (nonatomic , assign) NSInteger imgCount;

@property (strong , nonatomic) MoreImgModel *model;
@property (weak , nonatomic) id<InsertImgViewDelegate> delegate;
@property (copy, nonatomic) void (^photoViewChangeHeightBlock)(UITableViewCell *myCell);

@end
