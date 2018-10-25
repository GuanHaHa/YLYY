//
//  EditimgTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/11.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "EditimgTableViewCell.h"

@implementation EditimgTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.img];
        [self.contentView addSubview:self.deleteBtn];
        [self.contentView addSubview:self.firstLabel];
        
    }
    return self;
}

- (void)deletenAction {
    if ([self.delegate respondsToSelector:@selector(deleteImgIndex:)]) {
        [self.delegate deleteImgIndex:self.index];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_img autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 15, 10, 15)];
    
    [_deleteBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_img withOffset:-10];
    [_deleteBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img withOffset:-10];
    [_deleteBtn autoSetDimension:ALDimensionWidth toSize:20];
    [_deleteBtn autoSetDimension:ALDimensionHeight toSize:20];
    
    [_firstLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
    [_firstLabel autoSetDimension:ALDimensionHeight toSize:40];
    
}

- (void)setPicUrl:(NSString *)picUrl {
    _picUrl = picUrl;
    if ([_picUrl isEqualToString:@""] || _picUrl == nil) {
        _img.image = [UIImage imageNamed:@"compose_pic_add@2x"];
        _deleteBtn.hidden = YES;
        _firstLabel.hidden = YES;
    }else {
        [_img sd_setImageWithURL:[NSURL URLWithString:_picUrl] placeholderImage:nil];
        _deleteBtn.hidden = NO;
        _firstLabel.hidden = NO;
    }
    
}

- (UIImageView *)img {
    if (!_img) {
        _img = [[UIImageView alloc] initForAutoLayout];
        _img.image = [UIImage imageNamed:@"compose_pic_add@2x"];
        _img.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _img;
}

- (UIButton *)deleteBtn {
    if (!_deleteBtn) {
        _deleteBtn = [[UIButton alloc] initForAutoLayout];
        [_deleteBtn setImage:[UIImage imageNamed:@"delete-1"] forState:(UIControlStateNormal)];
        //        [_deleteBtn setBackgroundColor:UIColorFromRGB(0xffffff)];
        //        [_deleteBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
        //        [_deleteBtn setTitle:@"忘记密码" forState:UIControlStateSelected];
        //        [_deleteBtn setTitleColor:UIColorFromRGB(0x626262) forState:UIControlStateNormal];
        //        _deleteBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        //        _deleteBtn.layer.cornerRadius = 6;
        //        [_deleteBtn.layer setMasksToBounds:YES];
        _deleteBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        _deleteBtn.tag = 001;
        _deleteBtn.hidden = YES;
        [_deleteBtn addTarget:self action:@selector(deletenAction) forControlEvents:(UIControlEventTouchUpInside)];
        
    }
    return _deleteBtn;
}

- (UILabel *)firstLabel {
    if (!_firstLabel) {
        _firstLabel = [[UILabel alloc] initForAutoLayout];
        _firstLabel.backgroundColor = [UIColor blackColor];
        _firstLabel.alpha = 0.5;
        _firstLabel.textColor = [UIColor whiteColor];
        _firstLabel.text = @"首图";
        _firstLabel.textAlignment = NSTextAlignmentCenter;
        _firstLabel.hidden = YES;
    }
    return _firstLabel;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
