//
//  RemDetailsTableViewCell.m
//  YouLaiYouYue
//
//  Created by Apple on 2018/7/23.
//  Copyright © 2018年 yiwo. All rights reserved.
//

#import "RemDetailsTableViewCell.h"

@implementation RemDetailsTableViewCell

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
        [self.contentView addSubview:self.bigImg];
        [self.contentView addSubview:self.headImg];
        [self.contentView addSubview:self.lvImg];
        [self.lvImg addSubview:self.lvLabel];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.lookImg];
        [self.contentView addSubview:self.lookLabel];
        [self.contentView addSubview:self.concernImg];
        [self.contentView addSubview:self.concernLabel];
        [self.contentView addSubview:self.xian];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.zanBtn];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_bigImg autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeBottom];
    [_bigImg autoSetDimension:ALDimensionHeight toSize:188];
    
    
    
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_titleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_bigImg withOffset:15];
    [_titleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [_titleLabel autoSetDimension:ALDimensionHeight toSize:40];
//    _titleLabel.layer.borderWidth = 1;
    
    [_lookImg autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:20];
    [_lookImg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_lookImg autoSetDimension:ALDimensionWidth toSize:20];
    [_lookImg autoSetDimension:ALDimensionHeight toSize:15];
//    _lookImg.layer.borderWidth = 1;
    
    [_lookLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:20];
    [_lookLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_lookImg withOffset:5];
    [_lookLabel autoSetDimension:ALDimensionWidth toSize:80];
    [_lookLabel autoSetDimension:ALDimensionHeight toSize:15];
//    _lookLabel.layer.borderWidth = 1;
    
    [_concernImg autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:20];
    [_concernImg autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_lookLabel withOffset:10];
    [_concernImg autoSetDimension:ALDimensionWidth toSize:20];
    [_concernImg autoSetDimension:ALDimensionHeight toSize:15];
//    _concernImg.layer.borderWidth = 1;
    
    [_concernLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_titleLabel withOffset:20];
    [_concernLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_concernImg withOffset:5];
    [_concernLabel autoSetDimension:ALDimensionWidth toSize:80];
    [_concernLabel autoSetDimension:ALDimensionHeight toSize:15];
//    _concernLabel.layer.borderWidth = 1;
    
    [_xian autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_lookImg withOffset:10];
    [_xian autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [_xian autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [_xian autoSetDimension:ALDimensionHeight toSize:2];
    
    [_headImg autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_xian withOffset:15];
    [_headImg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:15];
    [_headImg autoSetDimension:ALDimensionWidth toSize:50];
    [_headImg autoSetDimension:ALDimensionHeight toSize:50];
    _headImg.layer.cornerRadius = 50/2;
    _headImg.clipsToBounds = YES;
//    _headImg.layer.borderWidth = 1;
    
    [_nameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_headImg withOffset:5];
    [_nameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:_headImg withOffset:0];
    [_nameLabel autoSetDimension:ALDimensionHeight toSize:50/2];
    [_nameLabel autoSetDimension:ALDimensionWidth toSize:110];
    
    [_lvImg autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_headImg withOffset:5];
    [_lvImg autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:_nameLabel withOffset:0];
    [_lvImg autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:_headImg];
    [_lvImg autoSetDimension:ALDimensionWidth toSize:50];
    
    [_lvLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 18, 0, 0)];
    
    [_zanBtn autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:15];
    [_zanBtn autoAlignAxis:(ALAxisHorizontal) toSameAxisOfView:_headImg];
    [_zanBtn autoSetDimension:ALDimensionWidth toSize:50];
    [_zanBtn autoSetDimension:ALDimensionHeight toSize:27];
    
    
    
    
   
    
    
}

- (void)setModel:(ContentModel *)model {
    _model = model;
    if ([_model.uid isEqualToString:GetUserDefault(userID)]) {
        _zanBtn.hidden = YES;
    }else {
        _zanBtn.hidden = NO;
    }
    [_bigImg sd_setImageWithURL:[NSURL URLWithString:_model.fmpic] placeholderImage:nil];
    _titleLabel.text = _model.fmtitle;
    _lookLabel.text = [NSString stringWithFormat:@"浏览:%@",_model.fmlook];
    _concernLabel.text = [NSString stringWithFormat:@"收藏:%@",_model.fmfavorite];
    [_headImg sd_setImageWithURL:[NSURL URLWithString:_model.userpic] placeholderImage:nil];
    _nameLabel.text = _model.username;
    if ([_model.follow isEqualToString:@"0"]) {
        _zanBtn.selected = NO;
    }else {
        _zanBtn.selected = YES;
    }

    _lvLabel.text = [NSString stringWithFormat:@"LV%@",_model.usergrade];
}


- (UIView *)xian {
    if (!_xian) {
        _xian = [[UIView alloc] initForAutoLayout];
        _xian.backgroundColor = UIColorFromRGB(0xe5e5e5);
    }
    return _xian;
}

- (UIImageView *)bigImg {
    if (!_bigImg) {
        _bigImg = [[UIImageView alloc] initForAutoLayout];
        _bigImg.image = [UIImage imageNamed:@"2"];
        _bigImg.contentMode = UIViewContentModeScaleAspectFill;
        _bigImg.clipsToBounds = true;
    }
    return _bigImg;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initForAutoLayout];
        _titleLabel.text = @"在北京,九个小酒馆和九个旅行故事";
        _titleLabel.font = [UIFont systemFontOfSize:18];
        _titleLabel.textColor = UIColorFromRGB(0x333333);
    }
    return _titleLabel;
}

- (UIImageView *)lookImg {
    if (!_lookImg) {
        _lookImg = [[UIImageView alloc] initForAutoLayout];
        _lookImg.image = [UIImage imageNamed:@"kan"];
    }
    return _lookImg;
}
- (UIImageView *)concernImg {
    if (!_concernImg) {
        _concernImg = [[UIImageView alloc] initForAutoLayout];
        _concernImg.image = [UIImage imageNamed:@"con"];
    }
    return _concernImg;
}

- (UILabel *)lookLabel {
    if (!_lookLabel) {
        _lookLabel = [[UILabel alloc] initForAutoLayout];
        _lookLabel.text = @"浏览:12345";
        _lookLabel.font = [UIFont systemFontOfSize:15];
        _lookLabel.textColor = UIColorFromRGB(0x333333);
    }
    return _lookLabel;
}

- (UILabel *)concernLabel {
    if (!_concernLabel) {
        _concernLabel = [[UILabel alloc] initForAutoLayout];
        _concernLabel.text = @"关注:12345";
        _concernLabel.font = [UIFont systemFontOfSize:15];
        _concernLabel.textColor = UIColorFromRGB(0x333333);
    }
    return _concernLabel;
}

- (UIImageView *)headImg {
    if (!_headImg) {
        _headImg = [[UIImageView alloc] initForAutoLayout];
        _headImg.image = [UIImage imageNamed:@"2"];
        _headImg.userInteractionEnabled = YES;
    }
    return _headImg;
}

- (UIImageView *)lvImg {
    if (!_lvImg) {
        _lvImg = [[UIImageView alloc] initForAutoLayout];
        _lvImg.image = [UIImage imageNamed:@"level-v"];
        _lvImg.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _lvImg;
}
- (UILabel *)lvLabel {
    if (!_lvLabel) {
        _lvLabel = [[UILabel alloc] initForAutoLayout];
        //        _lvLabel.text = @"昵称昵称";
        _lvLabel.textColor = UIColorFromRGB(0xffffff);
        _lvLabel.font = [UIFont systemFontOfSize:12];
        _lvLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _lvLabel;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initForAutoLayout];
        _nameLabel.text = @"昵称昵称";
        _nameLabel.textColor = UIColorFromRGB(0x333333);
        _nameLabel.font = [UIFont systemFontOfSize:14];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _nameLabel;
}

- (UIButton *)zanBtn
{
    if (!_zanBtn) {
        _zanBtn = [[UIButton alloc] initForAutoLayout];
        _zanBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _zanBtn.backgroundColor = UIColorFromRGB(0xfc1729);
        //        [_zanBtn setImage:[[UIImage imageNamed:@"attentioned"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        //        [_zanBtn setImage:[[UIImage imageNamed:@"con"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateSelected];
        [_zanBtn setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
        [_zanBtn setTitle:[NSString stringWithFormat:@"+关注"] forState:UIControlStateNormal];
        [_zanBtn setTitle:[NSString stringWithFormat:@"已关注"] forState:UIControlStateSelected];
        _zanBtn.titleEdgeInsets = UIEdgeInsetsMake(0,  -(_zanBtn.imageView.frame.origin.x+_zanBtn.imageView.frame.size.width+4), 0, 0);
        //button图片的偏移量
        _zanBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -(_zanBtn.imageView.frame.origin.x +10), 0, _zanBtn.imageView.frame.origin.x);
        _zanBtn.layer.cornerRadius = 5;
        _zanBtn.clipsToBounds = YES;
    }
    return _zanBtn;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
