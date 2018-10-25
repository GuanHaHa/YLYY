//
//  EditHeadTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/25.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "EditHeadTableViewCell.h"

@implementation EditHeadTableViewCell

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
    CGContextStrokeRect(context, CGRectMake(0, rect.size.height, rect.size.width-15, 5));
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.headImg];
        [self.contentView addSubview:self.nameLabel];
        
        
        
    }
    return self;
}

- (void)setModel:(PersonModel *)model {
    _model = model;
    
    if ([GetUserDefault(isLogin) boolValue] == NO) {
        
        
    }else {
        
        [self.headImg sd_setImageWithURL:[NSURL URLWithString:_model.headeimg] placeholderImage:nil];
        
    }
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_headImg autoAlignAxisToSuperviewAxis:(ALAxisHorizontal)];
    [_headImg autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [_headImg autoSetDimension:ALDimensionWidth toSize:100];
    [_headImg autoSetDimension:ALDimensionHeight toSize:100];
    _headImg.layer.cornerRadius = 100/2;
    _headImg.clipsToBounds = YES;
    
    [_nameLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(5, 20, 5, 0) excludingEdge:ALEdgeRight];
    [_nameLabel autoSetDimension:ALDimensionWidth toSize:200];
    
//    [_leaderImg autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_headImg withOffset:15];
//    [_leaderImg autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_nameLabel withOffset:10];
//    [_leaderImg autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:_nameLabel withOffset:0];
//    [_leaderImg autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_headImg withOffset:0];
//
//    [_sexImg autoAlignAxis:(ALAxisHorizontal) toSameAxisOfView:_nameLabel];
//    [_sexImg autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_nameLabel withOffset:10];
//    [_sexImg autoSetDimension:ALDimensionHeight toSize:20];
//    [_sexImg autoSetDimension:ALDimensionWidth toSize:20];
    
    
}

- (UIImageView *)headImg {
    if (!_headImg) {
        _headImg = [[UIImageView alloc] initForAutoLayout];
        _headImg.image = [UIImage imageNamed:@"2"];
        
    }
    return _headImg;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initForAutoLayout];
        _nameLabel.text = @"头像";
        _nameLabel.font = [UIFont fontWithName:@"Arial-BoldMT" size:18];
        _nameLabel.textColor = UIColorFromRGB(0x333333);
    }
    return _nameLabel;
}

//- (UIImageView *)leaderImg {
//    if (!_leaderImg) {
//        _leaderImg = [[UIImageView alloc] initForAutoLayout];
//        _leaderImg.image = [UIImage imageNamed:@"level-1"];
//        _leaderImg.contentMode = UIViewContentModeScaleAspectFit;
//    }
//    return _leaderImg;
//}
//- (UIImageView *)sexImg {
//    if (!_sexImg) {
//        _sexImg = [[UIImageView alloc] initForAutoLayout];
//        _sexImg.image = [UIImage imageNamed:@"nan"];
//        _sexImg.contentMode = UIViewContentModeScaleAspectFit;
//    }
//    return _sexImg;
//}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
