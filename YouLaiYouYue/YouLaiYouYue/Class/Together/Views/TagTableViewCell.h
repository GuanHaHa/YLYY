//
//  TagTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/9/2.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SegementView.h"

@interface TagTableViewCell : UITableViewCell

@property (strong , nonatomic) NSArray *titleArray;

@property (strong , nonatomic) SegementView *segeView;

@end
