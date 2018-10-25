//
//  InformationTableViewCell.h
//  YouLaiYouYue
//
//  Created by Apple on 2018/9/4.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InformationTableViewCell : UITableViewCell

@property (strong , nonatomic) UIImageView *img;

@property (strong , nonatomic) UILabel *infoLabel;

@property (copy , nonatomic) NSDictionary *dic;

@end
