//
//  HeadTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/23.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "HeadTableViewCell.h"

@implementation HeadTableViewCell

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
    CGContextStrokeRect(context, CGRectMake(0, rect.size.height, rect.size.width-15, 2));
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.head_background];
        [self.contentView addSubview:self.headImg];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.leaderImg];
        [self.leaderImg addSubview:self.lvLabel];
        [self.contentView addSubview:self.img];
        [self.contentView addSubview:self.sexImg];
        
        
    }
    return self;
}

- (void)setModel:(PersonModel *)model {
    _model = model;
    
    if ([GetUserDefault(isLogin) boolValue] == NO) {
        
        self.nameLabel.text = @"未登录";
        self.headImg.image = [UIImage imageNamed:@"头像 copy 3"];
        self.sexImg.image = [UIImage imageNamed:@""];
        _leaderImg.image = [UIImage imageNamed:@""];
        _img.image = [UIImage imageNamed:@""];
        _lvLabel.text = @"";
    }else {
        
        [self.headImg sd_setImageWithURL:[NSURL URLWithString:_model.headeimg] placeholderImage:[UIImage imageNamed:@"头像 copy 3"]];
        self.nameLabel.text = _model.username;
        if ([_model.sex isEqualToString:@"0"]) {
            self.sexImg.image = [UIImage imageNamed:@"nan"];
        }else {
            self.sexImg.image = [UIImage imageNamed:@"nv"];
        }
        _leaderImg.image = [UIImage imageNamed:@"level-v"];
        _lvLabel.text = [NSString stringWithFormat:@"LV%@",_model.usergrade];
        if ([_model.sign isEqualToString:@"0"]) {
            _img.image = [UIImage imageNamed:@"Group 20"];
        }else {
            _img.image = [UIImage imageNamed:@"Group 18"];
        }
    }
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_head_background autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    [_headImg autoAlignAxisToSuperviewAxis:(ALAxisHorizontal)];
    [_headImg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_headImg autoSetDimension:ALDimensionWidth toSize:100];
    [_headImg autoSetDimension:ALDimensionHeight toSize:100];
    _headImg.layer.cornerRadius = 100/2;
    _headImg.clipsToBounds = YES;
    
    [_nameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_headImg withOffset:0];
    [_nameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_headImg withOffset:5];
    [_nameLabel autoSetDimension:ALDimensionHeight toSize:50];
    [_nameLabel autoSetDimension:ALDimensionWidth toSize:200];
    
    
    [_leaderImg autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_headImg withOffset:5];
    [_leaderImg autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_nameLabel withOffset:0];
    [_leaderImg autoSetDimension:ALDimensionHeight toSize:20];
    [_leaderImg autoSetDimension:ALDimensionWidth toSize:70];
    
    [_lvLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
    
    [_img autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_leaderImg withOffset:10];
    [_img autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_leaderImg];
    [_img autoSetDimension:ALDimensionWidth toSize:20];
    [_img autoSetDimension:ALDimensionHeight toSize:20];
    
    
    [_sexImg autoAlignAxis:(ALAxisHorizontal) toSameAxisOfView:_nameLabel];
    [_sexImg autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_nameLabel withOffset:10];
    [_sexImg autoSetDimension:ALDimensionHeight toSize:20];
    [_sexImg autoSetDimension:ALDimensionWidth toSize:20];
    
    
}

- (UIImageView *)head_background {
    if (!_head_background) {
        _head_background = [[UIImageView alloc] initForAutoLayout];
        _head_background.image = [UIImage imageNamed:@"head_background"];
    }
    return _head_background;
}

- (UIImageView *)headImg {
    if (!_headImg) {
        _headImg = [[UIImageView alloc] initForAutoLayout];
        _headImg.image = [UIImage imageNamed:@"头像 copy 3"];
        
    }
    return _headImg;
}

- (UIImageView *)img {
    if (!_img) {
        _img = [[UIImageView alloc] initForAutoLayout];
//        _img.image = [UIImage imageNamed:@"头像 copy 3"];
    }
    return _img;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initForAutoLayout];
        _nameLabel.text = @"未登录";
        _nameLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:18];
        _nameLabel.textColor = UIColorFromRGB(0x333333);
    }
    return _nameLabel;
}

- (UIImageView *)leaderImg {
    if (!_leaderImg) {
        _leaderImg = [[UIImageView alloc] initForAutoLayout];
        
        _leaderImg.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _leaderImg;
}



- (UILabel *)lvLabel {
    if (!_lvLabel) {
        _lvLabel = [[UILabel alloc] initForAutoLayout];
        _lvLabel.textColor = UIColorFromRGB(0xffffff);
        _lvLabel.font = [UIFont systemFontOfSize:12];
        _lvLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _lvLabel;
}
- (UIImageView *)sexImg {
    if (!_sexImg) {
        _sexImg = [[UIImageView alloc] initForAutoLayout];
//        _sexImg.image = [UIImage imageNamed:@"nan"];
        _sexImg.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _sexImg;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
