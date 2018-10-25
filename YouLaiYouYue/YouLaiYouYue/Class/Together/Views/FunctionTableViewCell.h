//
//  FunctionTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/20.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ActivitlModel.h"

@interface FunctionTableViewCell : UITableViewCell


@property (strong , nonatomic) UIButton *btn1;
@property (strong , nonatomic) UIButton *btn2;
@property (strong , nonatomic) UIButton *btn3;

@property (strong , nonatomic) ActivitlModel *model;


@end
