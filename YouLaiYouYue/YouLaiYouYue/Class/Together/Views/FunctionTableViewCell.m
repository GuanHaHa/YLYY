//
//  FunctionTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/20.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "FunctionTableViewCell.h"

@interface FunctionTableViewCell ()


@end

@implementation FunctionTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        [self.contentView addSubview:self.btn1];
        [self.contentView addSubview:self.btn2];
        [self.contentView addSubview:self.btn3];
        
    }
    return self;
}

- (void)setModel:(ActivitlModel *)model {
    _model = model;
    
    if ([_model.focusOn isEqualToString:@"0"]) {
        _btn3.selected = NO;
    }
    if ([_model.focusOn isEqualToString:@"1"]) {
        _btn3.selected = YES;
    }
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_btn1 autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeRight];
    [_btn1 autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/3];
    
    [_btn2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_btn1 withOffset:0];
    [_btn2 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [_btn2 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    [_btn2 autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/3];
    
    [_btn3 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_btn2 withOffset:0];
    [_btn3 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [_btn3 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    [_btn3 autoSetDimension:ALDimensionWidth toSize:SCREEN_WIDTH/3];
}


- (UIButton *)btn1
{
    if (!_btn1) {
        _btn1 = [[UIButton alloc] initForAutoLayout];
        _btn1.titleLabel.font = [UIFont systemFontOfSize:14];
        [_btn1 setImage:[[UIImage imageNamed:@"review_comments"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        [_btn1 setImage:[[UIImage imageNamed:@"review_comments"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateSelected];
        [_btn1 setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [_btn1 setTitle:[NSString stringWithFormat:@"查看评价"] forState:UIControlStateNormal];
        [_btn1 setTitle:[NSString stringWithFormat:@"查看评价"] forState:UIControlStateSelected];
        //        _btn3.titleEdgeInsets = UIEdgeInsetsMake(0,  -(_btn3.imageView.frame.origin.x+_btn3.imageView.frame.size.width+4), 0, 0);
        //        //button图片的偏移量
        //        _btn3.imageEdgeInsets = UIEdgeInsetsMake(0, -(_btn3.imageView.frame.origin.x +10), 0, _btn3.imageView.frame.origin.x);
    }
    return _btn1;
}


- (UIButton *)btn2
{
    if (!_btn2) {
        _btn2 = [[UIButton alloc] initForAutoLayout];
        _btn2.titleLabel.font = [UIFont systemFontOfSize:14];
        [_btn2 setImage:[[UIImage imageNamed:@"consult"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        [_btn2 setImage:[[UIImage imageNamed:@"consult"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateSelected];
        [_btn2 setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [_btn2 setTitle:[NSString stringWithFormat:@"咨询"] forState:UIControlStateNormal];
        [_btn2 setTitle:[NSString stringWithFormat:@"咨询"] forState:UIControlStateSelected];
        //        _btn3.titleEdgeInsets = UIEdgeInsetsMake(0,  -(_btn3.imageView.frame.origin.x+_btn3.imageView.frame.size.width+4), 0, 0);
        //        //button图片的偏移量
        //        _btn3.imageEdgeInsets = UIEdgeInsetsMake(0, -(_btn3.imageView.frame.origin.x +10), 0, _btn3.imageView.frame.origin.x);
    }
    return _btn2;
}

- (UIButton *)btn3
{
    if (!_btn3) {
        _btn3 = [[UIButton alloc] initForAutoLayout];
        _btn3.titleLabel.font = [UIFont systemFontOfSize:14];
        [_btn3 setImage:[[UIImage imageNamed:@"attentioned"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        [_btn3 setImage:[[UIImage imageNamed:@"con"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateSelected];
        [_btn3 setTitleColor:UIColorFromRGB(0x333333) forState:UIControlStateNormal];
        [_btn3 setTitle:[NSString stringWithFormat:@"关注活动"] forState:UIControlStateNormal];
        [_btn3 setTitle:[NSString stringWithFormat:@"关注活动"] forState:UIControlStateSelected];
//        _btn3.titleEdgeInsets = UIEdgeInsetsMake(0,  -(_btn3.imageView.frame.origin.x+_btn3.imageView.frame.size.width+4), 0, 0);
//        //button图片的偏移量
//        _btn3.imageEdgeInsets = UIEdgeInsetsMake(0, -(_btn3.imageView.frame.origin.x +10), 0, _btn3.imageView.frame.origin.x);
    }
    return _btn3;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
