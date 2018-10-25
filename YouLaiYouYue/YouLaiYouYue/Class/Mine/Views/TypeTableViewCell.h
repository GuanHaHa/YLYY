//
//  TypeTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/24.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^MineTypeTabCellBlock)(NSInteger index , NSInteger senction);
@interface TypeTableViewCell : UITableViewCell


@property (copy ,nonatomic) NSDictionary *dic;
@property (assign , nonatomic) NSInteger section;

@property (copy ,nonatomic) MineTypeTabCellBlock block;

- (void)getIndex:(MineTypeTabCellBlock )block;

@end
