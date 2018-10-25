//
//  BtnTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/13.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "BtnTableViewCell.h"

@implementation BtnTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self.contentView addSubview:self.btn];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_btn autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(5, 20, 5, 20)];
}

- (UIButton *)btn {
    if (!_btn) {
        _btn = [[UIButton alloc] initForAutoLayout];
        [_btn setBackgroundColor:UIColorFromRGB(0xff9d00)];
        [_btn setTitle:@"报名" forState:UIControlStateNormal];
        [_btn setTitle:@"报名" forState:UIControlStateSelected];
        [_btn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        _btn.titleLabel.font = [UIFont systemFontOfSize:14];
        _btn.layer.cornerRadius = 6;
        [_btn.layer setMasksToBounds:YES];
        
    }
    return _btn;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
