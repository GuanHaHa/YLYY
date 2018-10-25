//
//  RealFrontTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/8/14.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "RealFrontTableViewCell.h"

@implementation RealFrontTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//自定义分割线
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    
    //下分割线
    CGContextSetStrokeColorWithColor(context, UIColorFromRGB(0xf5f5f5).CGColor);
    CGContextStrokeRect(context, CGRectMake(7, rect.size.height, rect.size.width-15, 2));
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.img];
        [self.contentView addSubview:self.deleteBtn];
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_titleLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(20, 20, 20, 20) excludingEdge:ALEdgeBottom];
    [_titleLabel autoSetDimension:ALDimensionHeight toSize:20];
    
    [_img autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:10];
    [_img autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:35*Balance_Width];
    [_img autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:35*Balance_Width];
    [_img autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
    _img.layer.borderWidth = 0.8;
    _img.layer.borderColor = UIColorFromRGB(0xf2f2f2).CGColor;
    
    
    [_deleteBtn autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_img withOffset:-10];
    [_deleteBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_img withOffset:-10];
    [_deleteBtn autoSetDimension:ALDimensionWidth toSize:20];
    [_deleteBtn autoSetDimension:ALDimensionHeight toSize:20];
    
}

- (void)deletenAction {
    if ([self.delegate respondsToSelector:@selector(deleteImgIndex:)]) {
        [self.delegate deleteImgIndex:self.index];
    }
}

- (UIImageView *)img {
    if (!_img) {
        _img = [[UIImageView alloc] initForAutoLayout];
        _img.image = [UIImage imageNamed:@"taker_photo"];
        _img.contentMode = UIViewContentModeScaleAspectFit;
        _img.layer.cornerRadius = 5;
        _img.clipsToBounds = YES;
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

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
//        _titleLabel.backgroundColor = UIColorFromRGB(0x626262);
//        _titleLabel.alpha = 0.5;
        _titleLabel.textColor = UIColorFromRGB(0x626262);
        _titleLabel.text = @"拍摄/上传您的身份证";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
