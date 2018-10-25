//
//  ShareAlertCollectionViewCell.m
//  YzFunny
//
//  Created by wang yu on 2016/12/23.
//  Copyright © 2016年 0452e. All rights reserved.
//

#import "ShareAlertCollectionViewCell.h"

@implementation ShareAlertCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.picImage = [[UIImageView alloc ] init];
        [self.contentView addSubview:self.picImage];
        
        
        self.nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.nameLabel];
        self.nameLabel.font = [UIFont systemFontOfSize:13.f];
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
        self.nameLabel.textColor = UIColorFromRGB(0x696969);
        
        
        
        [self.picImage mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(self.contentView.mas_top).offset(10);
            make.centerX.equalTo(self.contentView);
            make.size.mas_equalTo(CGSizeMake(frame.size.height-35, frame.size.height-35));
        }];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
            make.left.mas_equalTo(self.contentView.mas_left).offset(0);
            make.top.equalTo(self.picImage.mas_bottom).offset(5);
            make.right.mas_equalTo(self.contentView.mas_right).offset(0);
            
            
        }];
        
        
    }
    return self;
}

@end
