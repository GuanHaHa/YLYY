//
//  ShareAlertView.h
//  YzFunny
//
//  Created by wang yu on 2016/12/23.
//  Copyright © 2016年 0452e. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol collectionViewDidDelegate <NSObject>

- (void)collectionViewDid:(NSInteger)didItem;

@end

@interface ShareAlertView : UIView

- (void)showMenuView;
@property (nonatomic ,weak) id<collectionViewDidDelegate>delegate;

@property (nonatomic ,assign) BOOL isCollect;
@property (nonatomic ,assign) BOOL isShare;
@end
