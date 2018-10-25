//
//  BigImgTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/17.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "BigImgTableViewCell.h"

@implementation BigImgTableViewCell

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
        [self.contentView addSubview:self.imgView];
        [self.imgView addSubview:self.bgView];
        [self.bgView addSubview:self.titleLabel];
        [self.contentView addSubview:self.headImg];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.commentsBtn];
        [self.contentView addSubview:self.lookBtn];
        [self.contentView addSubview:self.timeLabel];
        
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_imgView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:15];
    [_imgView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [_imgView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [_imgView autoSetDimension:ALDimensionHeight toSize:187];
    
    [_bgView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
    [_bgView autoSetDimension:ALDimensionHeight toSize:44];
    
    [_titleLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
    
    [_headImg autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_imgView withOffset:10];
    [_headImg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_headImg autoSetDimension:ALDimensionWidth toSize:27];
    [_headImg autoSetDimension:ALDimensionHeight toSize:27];
    _headImg.layer.cornerRadius = 27/2;
    _headImg.clipsToBounds = YES;
    //    _headImg.layer.borderWidth = 1;
    
    [_nameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_headImg withOffset:5];
    [_nameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_headImg withOffset:0];
    [_nameLabel autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_headImg withOffset:0];
    [_nameLabel autoSetDimension:ALDimensionWidth toSize:110];
    //    _nameLabel.layer.borderWidth = 1;
    
    [_commentsBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [_commentsBtn autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_headImg];
    [_commentsBtn autoSetDimension:ALDimensionWidth toSize:44];
    [_commentsBtn autoSetDimension:ALDimensionHeight toSize:27];
    
    [_lookBtn autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_commentsBtn withOffset:-10];
    [_lookBtn autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_headImg];
    [_lookBtn autoSetDimension:ALDimensionWidth toSize:44];
    [_lookBtn autoSetDimension:ALDimensionHeight toSize:27];
    
    [_timeLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:_lookBtn withOffset:-10];
    [_timeLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:_headImg];
    [_timeLabel autoSetDimension:ALDimensionWidth toSize:100];
    [_timeLabel autoSetDimension:ALDimensionHeight toSize:27];
    
    
    
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [[UIImageView alloc] initForAutoLayout];
        _imgView.image = [UIImage imageNamed:@"2"];
        
    }
    return _imgView;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] initForAutoLayout];
        _bgView.backgroundColor = [UIColor blackColor];
        _bgView.alpha = 0.5;
    }
    return _bgView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.text = @"你发撒开了房就是垃圾";
        
    }
    return _titleLabel;
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
        _nameLabel.text = @"山峰不会写游记";
        _nameLabel.textColor = UIColorFromRGB(0x333333);
        _nameLabel.font = [UIFont systemFontOfSize:15];
        
    }
    return _nameLabel;
}

- (UIButton *)commentsBtn
{
    if (!_commentsBtn) {
        _commentsBtn = [[UIButton alloc] initForAutoLayout];
        _commentsBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_commentsBtn setImage:[[UIImage imageNamed:@"recommend"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        [_commentsBtn setTitleColor:UIColorFromRGB(0xff7f00) forState:UIControlStateNormal];
        [_commentsBtn setTitle:[NSString stringWithFormat:@"333"] forState:UIControlStateNormal];
        _commentsBtn.titleEdgeInsets = UIEdgeInsetsMake(0,  -(_commentsBtn.imageView.frame.origin.x+_commentsBtn.imageView.frame.size.width+4), 0, 0);
        //button图片的偏移量
        _commentsBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -(_commentsBtn.imageView.frame.origin.x +10), 0, _commentsBtn.imageView.frame.origin.x);
    }
    return _commentsBtn;
}

- (UIButton *)lookBtn
{
    if (!_lookBtn) {
        _lookBtn = [[UIButton alloc] initForAutoLayout];
        _lookBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_lookBtn setImage:[[UIImage imageNamed:@"lookBtn"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        [_lookBtn setTitleColor:UIColorFromRGB(0xff7f00) forState:UIControlStateNormal];
        [_lookBtn setTitle:[NSString stringWithFormat:@"333"] forState:UIControlStateNormal];
        _lookBtn.titleEdgeInsets = UIEdgeInsetsMake(0,  -(_lookBtn.imageView.frame.origin.x+_lookBtn.imageView.frame.size.width+4), 0, 0);
        //button图片的偏移量
        _lookBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -(_lookBtn.imageView.frame.origin.x +10), 0, _lookBtn.imageView.frame.origin.x);
    }
    return _lookBtn;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] initForAutoLayout];
        _timeLabel.text = @"2018-04-04";
        _timeLabel.textColor = UIColorFromRGB(0x333333);
        _timeLabel.font = [UIFont systemFontOfSize:15];
        _timeLabel.textAlignment = NSTextAlignmentRight;
        
    }
    return _timeLabel;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
